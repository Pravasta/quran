import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/repositories/get_jadwal_sholat_response_model.dart';
import 'package:quran/feature/pray/repository/pray_repository.dart';

part 'get_jadwal_sholat_by_location_state.dart';

class GetJadwalSholatByLocationCubit
    extends Cubit<GetJadwalSholatByLocationState> {
  GetJadwalSholatByLocationCubit(this._repository)
    : super(GetJadwalSholatByLocationState());

  final PrayRepository _repository;

  void getJadwalSholatByLocation(String code) async {
    final dateTime = DateTime.now();
    final tahun = dateTime.year;
    final bulan = dateTime.month;
    final tanggal = dateTime.day;

    emit(state.copyWith(status: GetJadwalSholatByLocationStatus.loading));
    try {
      final result = await _repository.getJadwalByLocation(
        code,
        tahun,
        bulan,
        tanggal,
      );
      emit(
        state.copyWith(
          data: result,
          status: GetJadwalSholatByLocationStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: GetJadwalSholatByLocationStatus.error,
          message: e.toString(),
        ),
      );
    }
  }
}
