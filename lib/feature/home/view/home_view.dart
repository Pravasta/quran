import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/components/app_shimmer.dart';
import 'package:quran/core/components/app_top_snackbar.dart';
import 'package:quran/core/extensions/build_context_ext.dart';
import 'package:quran/core/routes/navigation.dart';
import 'package:quran/feature/detail_surah/view/detail_surah_page.dart';
import 'package:quran/feature/home/logic/get_all_surah/get_all_surah_cubit.dart';
import 'package:quran/feature/home/logic/get_last_read/get_last_read_cubit.dart';
import 'package:quran/feature/home/view/widget/header_widget.dart';
import 'package:quran/main.dart';

import 'widget/quran_list_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    AppBar appBar() {
      return AppBar(
        title: Text('Quran App', style: appTextTheme(context).displaySmall),
        automaticallyImplyLeading: false,
      );
    }

    Widget contentHeader() {
      return BlocBuilder<GetLastReadCubit, GetLastReadState>(
        builder: (context, state) {
          if (state.status == GetLastReadStatus.loading) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: AppShimmer(
                context.deviceHeight * 0.18,
                context.deviceWidth,
                15,
              ),
            );
          }

          if (state.status == GetLastReadStatus.error) {
            return GestureDetector(
              onTap: () {
                AppTopSnackBar(context).showDanger('Last read not found');
              },
              child: HeaderWidget(),
            );
          }

          if (state.status == GetLastReadStatus.loaded) {
            final lastRead = state.lastRead!;

            return GestureDetector(
              onTap:
                  () => Navigation.push(
                    DetailSurahPage(surahNumber: lastRead.nomorSurat!),
                    DetailSurahPage.routeSettings,
                  ),
              child: HeaderWidget(
                nameSurah: lastRead.namaSurat,
                noAyat: lastRead.nomorAyat,
              ),
            );
          }

          return SizedBox();
        },
      );
    }

    Widget contentSurah() {
      return BlocBuilder<GetAllSurahCubit, GetAllSurahState>(
        builder: (context, state) {
          if (state.status == GetAllSurahStatus.loading) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: AppShimmer(
                context.deviceHeight * 1 / 2,
                context.deviceWidth,
                15,
              ),
            );
          }
          if (state.status == GetAllSurahStatus.error) {
            return Center(child: Text(state.message!));
          }
          if (state.status == GetAllSurahStatus.loaded) {
            final surahs = state.surah!;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: surahs.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap:
                        () => Navigation.push(
                          DetailSurahPage(surahNumber: surahs[index].nomor!),
                          DetailSurahPage.routeSettings,
                        ),
                    child: QuranListWidget(surah: surahs[index]),
                  );
                },
              ),
            );
          }

          return SizedBox();
        },
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(children: [contentHeader(), contentSurah()]),
      ),
    );
  }
}
