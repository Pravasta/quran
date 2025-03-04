import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/repositories/get_code_location_response_model.dart';
import 'package:quran/feature/pray/repository/pray_repository.dart';

part 'get_code_location_state.dart';

class GetCodeLocationCubit extends Cubit<GetCodeLocationState> {
  GetCodeLocationCubit(this._repository) : super(GetCodeLocationState());

  final PrayRepository _repository;

  void getCodeLocation(String location) async {
    emit(state.copyWith(status: GetCodeLocationStatus.loading));
    try {
      final result = await _repository.getCodeLocation(location);
      emit(
        state.copyWith(location: result, status: GetCodeLocationStatus.loaded),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: GetCodeLocationStatus.error,
          messagte: e.toString(),
        ),
      );
    }
  }
}
