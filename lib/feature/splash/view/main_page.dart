import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/feature/splash/logic/counter_bottom_navigation_cubit/counter_bottom_navigation_cubit.dart';
import 'package:quran/feature/splash/view/main_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const RouteSettings routeSettings = RouteSettings(name: '/main-page');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBottomNavigationCubit(),
      child: MainView(),
    );
  }
}
