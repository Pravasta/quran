import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/repositories/location_response_model.dart';
import 'package:quran/feature/splash/repository/init_location_repository.dart';

part 'location_init_state.dart';

class LocationInitCubit extends Cubit<LocationInitState> {
  LocationInitCubit(this._repository) : super(LocationInitState());

  final InitLocationRepository _repository;

  void getCurrentLocation() async {
    emit(state.copyWith(status: LocationInitStatus.loading));
    try {
      final result = await _repository.getCurrentLocation();
      emit(state.copyWith(status: LocationInitStatus.loaded, data: result));
    } catch (e) {
      emit(
        state.copyWith(status: LocationInitStatus.error, message: e.toString()),
      );
    }
  }
}
