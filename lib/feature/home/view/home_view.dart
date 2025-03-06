import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/components/app_shimmer.dart';
import 'package:quran/core/extensions/build_context_ext.dart';
import 'package:quran/core/routes/navigation.dart';
import 'package:quran/core/theme/app_color.dart';
import 'package:quran/core/utils/assets.gen.dart';
import 'package:quran/feature/detail_surah/view/detail_surah_page.dart';
import 'package:quran/feature/home/logic/get_all_surah/get_all_surah_cubit.dart';
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
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: context.deviceWidth,
          padding: EdgeInsets.only(left: 20, top: 20),
          height: context.deviceHeight * 0.18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                AppColor.primaryAccent[400]!,
                AppColor.primaryAccent[100]!,
              ],
            ),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.menu_book_outlined,
                        color: AppColor.white,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Last Read',
                        style: appTextTheme(context).titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Al-Fatihah',
                        style: appTextTheme(context).titleLarge!.copyWith(
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Ayat No. 1',
                        style: appTextTheme(context).titleSmall!.copyWith(
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Image.asset(Assets.images.appQuran.path, scale: 3.8),
              ),
            ],
          ),
        ),
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
