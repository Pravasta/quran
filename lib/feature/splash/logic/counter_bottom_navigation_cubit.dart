import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBottomNavigationCubit extends Cubit<int> {
  CounterBottomNavigationCubit() : super(0);

  void changeIndex(int index) {
    emit(index);
  }
}
