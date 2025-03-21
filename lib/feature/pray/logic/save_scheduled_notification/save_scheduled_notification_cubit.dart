import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/feature/pray/repository/pray_repository.dart';

part 'save_scheduled_notification_state.dart';

class SaveScheduledNotificationCubit
    extends Cubit<SaveScheduledNotificationState> {
  SaveScheduledNotificationCubit(this._prayRepository)
    : super(SaveScheduledNotificationState());

  final PrayRepository _prayRepository;

  void saveScheduledNotification(String key, String value) async {
    await _prayRepository.setSharedPref(key, value);
    emit(
      state.copyWith(isScheduled: true, isCancelled: false, selectedTitle: key),
    );
  }

  void loadScheduledNotification(String key) async {
    final result = await _prayRepository.getSharedPref(key);
    if (result != null) {
      emit(
        state.copyWith(
          isScheduled: true,
          isCancelled: false,
          selectedTitle: key,
        ),
      );
    }
  }

  void cancelScheduledNotification(String key) async {
    await _prayRepository.removeSharedPref(key);
    emit(
      state.copyWith(isScheduled: false, isCancelled: true, selectedTitle: key),
    );
  }
}
