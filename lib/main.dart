import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/logic/notification/notification_cubit.dart';
import 'package:quran/core/services/notification/local_notification_service.dart';
import 'package:quran/feature/detail_surah/logic/audio_player/audio_player_cubit.dart';
import 'package:quran/core/routes/navigation.dart';
import 'package:quran/core/services/audio_service.dart';
import 'package:quran/feature/pray/logic/save_scheduled_notification/save_scheduled_notification_cubit.dart';
import 'package:quran/feature/pray/repository/pray_repository.dart';

import 'core/injection/env.dart';
import 'core/theme/app_theme.dart';
import 'feature/detail_surah/logic/add_last_read/add_last_read_cubit.dart';
import 'feature/detail_surah/repository/detail_surah_repository.dart';
import 'feature/home/logic/get_last_read/get_last_read_cubit.dart';
import 'feature/home/repository/home_repository.dart';
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
        BlocProvider(
          create:
              (_) =>
                  GetLastReadCubit(HomeRepositoryImpl.create())..getLastRead(),
        ),
        BlocProvider(
          create: (_) => AddLastReadCubit(DetailSurahRepositoryImpl.create()),
        ),
        BlocProvider(
          create:
              (_) => NotificationCubit(LocalNotificationServiceImpl.create()),
        ),
        BlocProvider(
          create:
              (_) =>
                  SaveScheduledNotificationCubit(PrayRepositoryImpl.create()),
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
