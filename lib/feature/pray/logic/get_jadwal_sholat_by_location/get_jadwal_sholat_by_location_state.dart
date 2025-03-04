part of 'get_jadwal_sholat_by_location_cubit.dart';

enum GetJadwalSholatByLocationStatus { initial, loading, loaded, error }

class GetJadwalSholatByLocationState {
  final String message;
  final Data? data;
  final GetJadwalSholatByLocationStatus status;

  GetJadwalSholatByLocationState({
    this.message = '',
    this.data,
    this.status = GetJadwalSholatByLocationStatus.initial,
  });

  GetJadwalSholatByLocationState copyWith({
    String? message,
    Data? data,
    GetJadwalSholatByLocationStatus? status,
  }) {
    return GetJadwalSholatByLocationState(
      message: message ?? this.message,
      data: data ?? this.data,
      status: status ?? this.status,
    );
  }
}
