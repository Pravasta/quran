part of 'detail_surah_cubit.dart';

enum DetailSurahStatus { initial, loading, error, loaded }

class DetailSurahState {
  final String? message;
  final DetailSurah? detailSurah;
  final DetailSurahStatus? status;
  final List<Ayat>? ayat;

  DetailSurahState({
    this.message = '',
    this.detailSurah,
    this.status = DetailSurahStatus.initial,
    this.ayat,
  });

  DetailSurahState copyWith({
    String? message,
    DetailSurah? detailSurah,
    DetailSurahStatus? status,
    final List<Ayat>? ayat,
  }) {
    return DetailSurahState(
      message: message ?? this.message,
      detailSurah: detailSurah ?? this.detailSurah,
      status: status ?? this.status,
      ayat: ayat ?? this.ayat,
    );
  }
}
