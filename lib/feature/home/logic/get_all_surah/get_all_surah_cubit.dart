import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/repositories/list_surah_response_model.dart';
import 'package:quran/feature/home/repository/home_repository.dart';

part 'get_all_surah_state.dart';

class GetAllSurahCubit extends Cubit<GetAllSurahState> {
  GetAllSurahCubit(this._repository) : super(GetAllSurahState());

  final HomeRepository _repository;

  void getAllSurah() async {
    emit(state.copyWith(status: GetAllSurahStatus.loading));
    try {
      final result = await _repository.getListSurah();
      emit(state.copyWith(surah: result, status: GetAllSurahStatus.loaded));
    } catch (e) {
      emit(
        state.copyWith(status: GetAllSurahStatus.error, message: e.toString()),
      );
    }
  }
}
