part of 'save_scheduled_notification_cubit.dart';

class SaveScheduledNotificationState {
  final bool isScheduled;
  final bool isCancelled;
  final String? selectedTitle;

  const SaveScheduledNotificationState({
    this.isScheduled = false,
    this.isCancelled = false,
    this.selectedTitle,
  });

  SaveScheduledNotificationState copyWith({
    bool? isScheduled,
    bool? isCancelled,
    String? selectedTitle,
  }) {
    return SaveScheduledNotificationState(
      isScheduled: isScheduled ?? this.isScheduled,
      isCancelled: isCancelled ?? this.isCancelled,
      selectedTitle: selectedTitle ?? this.selectedTitle,
    );
  }
}
