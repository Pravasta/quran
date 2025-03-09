part of 'add_last_read_cubit.dart';

enum AddLastReadStatus { initial, loading, loaded, error }

class AddLastReadState {
  final String message;
  final AddLastReadStatus status;
  final SaveAyatModel? saveAyatLocal;

  AddLastReadState({
    this.message = "",
    this.status = AddLastReadStatus.initial,
    this.saveAyatLocal,
  });

  AddLastReadState copyWith({
    String? message,
    AddLastReadStatus? status,
    SaveAyatModel? saveAyatLocal,
  }) {
    return AddLastReadState(
      message: message ?? this.message,
      status: status ?? this.status,
      saveAyatLocal: saveAyatLocal ?? this.saveAyatLocal,
    );
  }
}
