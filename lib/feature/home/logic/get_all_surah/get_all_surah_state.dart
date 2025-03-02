part of 'get_all_surah_cubit.dart';

enum GetAllSurahStatus { initial, loading, loaded, error }

class GetAllSurahState {
  final String? message;
  final List<Surah>? surah;
  final GetAllSurahStatus? status;
  GetAllSurahState({
    this.message = '',
    this.surah,
    this.status = GetAllSurahStatus.initial,
  });

  GetAllSurahState copyWith({
    String? message,
    List<Surah>? surah,
    GetAllSurahStatus? status,
  }) {
    return GetAllSurahState(
      message: message ?? this.message,
      surah: surah ?? this.surah,
      status: status ?? this.status,
    );
  }
}
