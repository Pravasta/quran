part of 'get_last_read_cubit.dart';

enum GetLastReadStatus { initial, loading, loaded, error }

class GetLastReadState {
  final String message;
  final GetLastReadStatus status;
  final SaveAyatModel? lastRead;

  GetLastReadState({
    this.message = '',
    this.status = GetLastReadStatus.initial,
    this.lastRead,
  });

  GetLastReadState copyWith({
    String? message,
    GetLastReadStatus? status,
    SaveAyatModel? lastRead,
  }) {
    return GetLastReadState(
      message: message ?? this.message,
      status: status ?? this.status,
      lastRead: lastRead ?? this.lastRead,
    );
  }
}
