import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/repositories/get_detail_surah_response_model.dart';
import 'package:quran/feature/detail_surah/repository/detail_surah_repository.dart';

part 'detail_surah_state.dart';

class DetailSurahCubit extends Cubit<DetailSurahState> {
  DetailSurahCubit(this._repository) : super(DetailSurahState());

  final DetailSurahRepository _repository;

  void getDetailSurah(int surahNumber) async {
    emit(state.copyWith(status: DetailSurahStatus.loading));
    try {
      final result = await _repository.getDetailSurah(surahNumber);
      emit(
        state.copyWith(status: DetailSurahStatus.loaded, detailSurah: result),
      );
    } catch (e) {
      emit(
        state.copyWith(status: DetailSurahStatus.error, message: e.toString()),
      );
    }
  }
}
