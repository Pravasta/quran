import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/feature/home/repository/home_repository.dart';

import '../../../../core/services/save_ayat/save_ayat_model.dart';

part 'get_last_read_state.dart';

class GetLastReadCubit extends Cubit<GetLastReadState> {
  GetLastReadCubit(this._repository) : super(GetLastReadState());

  final HomeRepository _repository;

  void getLastRead() async {
    emit(state.copyWith(status: GetLastReadStatus.loading));
    try {
      final result = await _repository.getAyatLastRead();
      emit(state.copyWith(lastRead: result, status: GetLastReadStatus.loaded));
    } catch (e) {
      emit(
        state.copyWith(status: GetLastReadStatus.error, message: e.toString()),
      );
    }
  }
}
