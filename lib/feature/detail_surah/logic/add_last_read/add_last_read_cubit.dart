import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/services/save_ayat/save_ayat_model.dart';
import 'package:quran/feature/detail_surah/repository/detail_surah_repository.dart';

part 'add_last_read_state.dart';

class AddLastReadCubit extends Cubit<AddLastReadState> {
  AddLastReadCubit(this._repository) : super(AddLastReadState());

  final DetailSurahRepository _repository;

  void addLastRead(SaveAyatModel data) async {
    emit(state.copyWith(status: AddLastReadStatus.loading));
    try {
      final result = await _repository.addLastRead(data);
      emit(
        state.copyWith(
          message: result,
          status: AddLastReadStatus.loaded,
          saveAyatLocal: data,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: AddLastReadStatus.error, message: e.toString()),
      );
    }
  }
}
