part of 'location_init_cubit.dart';

enum LocationInitStatus { initial, loading, loaded, error }

class LocationInitState {
  final String message;
  final LocationResponseModel? data;
  final LocationInitStatus status;

  LocationInitState({
    this.message = '',
    this.data,
    this.status = LocationInitStatus.initial,
  });

  LocationInitState copyWith({
    String? message,
    LocationResponseModel? data,
    LocationInitStatus? status,
  }) {
    return LocationInitState(
      message: message ?? this.message,
      data: data ?? this.data,
      status: status ?? this.status,
    );
  }
}
