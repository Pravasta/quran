import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/logic/audio_player/audio_player_cubit.dart';
import 'package:quran/core/routes/navigation.dart';
import 'package:quran/core/services/audio_service.dart';

import 'core/injection/env.dart';
import 'core/theme/app_theme.dart';
import 'feature/splash/logic/location_init_cubit/location_init_cubit.dart';
import 'feature/splash/repository/init_location_repository.dart';
import 'feature/splash/view/splash_page.dart';

// shortcut for app theme
TextTheme appTextTheme(BuildContext context) => Theme.of(context).textTheme;
ColorScheme appColorScheme(BuildContext context) =>
    Theme.of(context).colorScheme;

// Set your environment here
const Environment env = Environment.development;

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationInitCubit>(
          create: (_) => LocationInitCubit(InitLocationRepositoryImpl.create()),
        ),
        BlocProvider(
          create: (_) => AudioPlayerCubit(AudioServiceImpl.create()),
        ),
      ],
      child: MaterialApp(
        showSemanticsDebugger: false,
        title: 'Pravasta Quran',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: AppTheme.lightTheme(context),
        darkTheme: AppTheme.darkTheme(context),
        navigatorKey: navigatorKey,
        home: SplashPage(),
      ),
    );
  }
}
