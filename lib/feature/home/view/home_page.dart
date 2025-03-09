import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/feature/home/logic/get_all_surah/get_all_surah_cubit.dart';
import 'package:quran/feature/home/repository/home_repository.dart';
import 'package:quran/feature/home/view/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetAllSurahCubit>(
          create:
              (_) =>
                  GetAllSurahCubit(HomeRepositoryImpl.create())..getAllSurah(),
        ),
      ],
      child: HomeView(),
    );
  }
}
