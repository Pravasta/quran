part of 'notification_cubit.dart';

class NotificationState {
  final bool isPermissionGranted;
  final bool isInitialized;
  final bool isConfigured;
  final bool isScheduled;
  final bool isCancelled;
  final bool isCancelledAll;

  const NotificationState({
    this.isPermissionGranted = false,
    this.isInitialized = false,
    this.isConfigured = false,
    this.isScheduled = false,
    this.isCancelled = false,
    this.isCancelledAll = false,
  });

  NotificationState copyWith({
    bool? isPermissionGranted,
    bool? isInitialized,
    bool? isConfigured,
    bool? isScheduled,
    bool? isCancelled,
    bool? isCancelledAll,
  }) {
    return NotificationState(
      isPermissionGranted: isPermissionGranted ?? this.isPermissionGranted,
      isInitialized: isInitialized ?? this.isInitialized,
      isConfigured: isConfigured ?? this.isConfigured,
      isScheduled: isScheduled ?? this.isScheduled,
      isCancelled: isCancelled ?? this.isCancelled,
      isCancelledAll: isCancelledAll ?? this.isCancelledAll,
    );
  }
}
