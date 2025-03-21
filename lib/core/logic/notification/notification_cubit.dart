import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/repositories/notification_scheduled_request_model.dart';
import 'package:quran/core/services/notification/local_notification_service.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._service) : super(NotificationState());

  final LocalNotificationService _service;

  Future<void> requestPermission() async {
    final isPermissionGrandted = await _service.requestPermission();
    emit(state.copyWith(isPermissionGranted: isPermissionGrandted ?? false));
  }

  void showScheduledNotification(NotificationScheduledRequestModel data) async {
    await _service.scheduleDailyNotification(
      id: data.id,
      title: data.title,
      body: data.body,
      payload: data.payload,
      hour: data.hour,
      minute: data.minute,
    );

    emit(state.copyWith(isScheduled: true));
  }

  void cancelScheduledNotification(int id) async {
    await _service.cancelNotification(id);
    emit(state.copyWith(isCancelled: true, isScheduled: false));
  }
}
