part of 'get_code_location_cubit.dart';

enum GetCodeLocationStatus { initial, loading, loaded, error }

class GetCodeLocationState {
  final String messagte;
  final List<Lokasi> location;
  final GetCodeLocationStatus status;

  GetCodeLocationState({
    this.messagte = '',
    this.location = const [],
    this.status = GetCodeLocationStatus.initial,
  });

  GetCodeLocationState copyWith({
    String? messagte,
    List<Lokasi>? location,
    GetCodeLocationStatus? status,
  }) {
    return GetCodeLocationState(
      messagte: messagte ?? this.messagte,
      location: location ?? this.location,
      status: status ?? this.status,
    );
  }
}
