part of 'detail_surah_cubit.dart';

enum DetailSurahStatus { initial, loading, error, loaded }

class DetailSurahState {
  final String? message;
  final DetailSurah? detailSurah;
  final DetailSurahStatus? status;

  DetailSurahState({
    this.message = '',
    this.detailSurah,
    this.status = DetailSurahStatus.initial,
  });

  DetailSurahState copyWith({
    String? message,
    DetailSurah? detailSurah,
    DetailSurahStatus? status,
  }) {
    return DetailSurahState(
      message: message ?? this.message,
      detailSurah: detailSurah ?? this.detailSurah,
      status: status ?? this.status,
    );
  }
}
