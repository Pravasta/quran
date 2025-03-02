import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/feature/detail_surah/logic/detail_surah/detail_surah_cubit.dart';
import 'package:quran/feature/detail_surah/repository/detail_surah_repository.dart';
import 'package:quran/feature/detail_surah/view/detail_surah_view.dart';

class DetailSurahPage extends StatelessWidget {
  const DetailSurahPage({super.key, required this.surahNumber});

  static const RouteSettings routeSettings = RouteSettings(
    name: '/detail-surah-page',
  );

  final int surahNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailSurahCubit>(
      create:
          (context) =>
              DetailSurahCubit(DetailSurahRepositoryImpl.create())
                ..getDetailSurah(surahNumber),
      child: DetailSurahView(),
    );
  }
}
