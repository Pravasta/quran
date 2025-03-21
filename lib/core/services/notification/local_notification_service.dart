import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

abstract class LocalNotificationService {
  Future<void> init();
  Future<bool?> requestPermission();
  Future<void> showSimpleNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
    String? channelId,
    String? channelName,
  });
  Future<void> notificationWithBigPicture({
    required int id,
    required String title,
    required String body,
    required String payload,
    String? channelId,
    String? channelName,
  });
  Future<void> configureLocalTimeZone();
  Future<void> scheduleDailyNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
    required int hour,
    required int minute,
    String? channelId,
    String? channelName,
  });
  Future<void> cancelNotification(int id);
  Future<void> cancelAllNotifications();
}

class LocalNotificationServiceImpl implements LocalNotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  LocalNotificationServiceImpl({
    required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  }) : _flutterLocalNotificationsPlugin = flutterLocalNotificationsPlugin;

  @override
  Future<void> init() async {
    const initializationAndroidSettings = AndroidInitializationSettings(
      'app_icon',
    );

    const initializationDarwinSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    final initializationSettings = InitializationSettings(
      android: initializationAndroidSettings,
      iOS: initializationDarwinSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<bool> _isAndroidPermissionGranted() async {
    final isNotificationPermissionGranted =
        await _flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >()
            ?.areNotificationsEnabled();

    return isNotificationPermissionGranted ?? false;
  }

  Future<bool> _requestAndroidNotificationPermission() async {
    final isNotificationPermissionGranted =
        await _flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >()
            ?.requestNotificationsPermission();

    return isNotificationPermissionGranted ?? false;
  }

  Future<bool> _requestExactAlarmsPermission() async {
    return await _flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >()
            ?.requestExactAlarmsPermission() ??
        false;
  }

  @override
  Future<bool?> requestPermission() async {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      final iosImplementation =
          _flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin
              >();

      return await iosImplementation?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      final requestNotificationsPermission =
          await _requestAndroidNotificationPermission();

      final isPermissionGranted = await _isAndroidPermissionGranted();
      final requestAlarmEnabled = await _requestExactAlarmsPermission();

      return requestNotificationsPermission &&
          isPermissionGranted &&
          requestAlarmEnabled;
    } else {
      return false;
    }
  }

  @override
  Future<void> showSimpleNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
    String? channelId,
    String? channelName,
  }) async {
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channelId ?? 'default_channel_id',
      channelName ?? 'default_channel_name',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    final iOSPlatformChannelSpecifics = DarwinNotificationDetails();
    final notificationDetails = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  @override
  Future<void> notificationWithBigPicture({
    required int id,
    required String title,
    required String body,
    required String payload,
    String? channelId,
    String? channelName,
  }) {
    throw UnimplementedError();
  }

  tz.TZDateTime _nextInstanceServiceTime(int hour, int minute) {
    final now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }

    return scheduleDate;
  }

  @override
  Future<void> configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  @override
  Future<void> scheduleDailyNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
    required int hour,
    required int minute,
    String? channelId,
    String? channelName,
  }) async {
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channelId ?? 'default_channel_id',
      channelName ?? 'default_channel_name',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    final iOSPlatformChannelSpecifics = DarwinNotificationDetails();
    final notificationDetails = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    final scheduledDate = _nextInstanceServiceTime(hour, minute);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: payload,
    );
  }

  @override
  Future<void> cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  @override
  Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  factory LocalNotificationServiceImpl.create() {
    return LocalNotificationServiceImpl(
        flutterLocalNotificationsPlugin: FlutterLocalNotificationsPlugin(),
      )
      ..init()
      ..configureLocalTimeZone();
  }
}
