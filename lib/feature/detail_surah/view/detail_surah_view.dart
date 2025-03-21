import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/components/app_button.dart';
import 'package:quran/core/components/app_dialog.dart';
import 'package:quran/core/components/app_top_snackbar.dart';
import 'package:quran/core/extensions/build_context_ext.dart';
import 'package:quran/core/services/save_ayat/save_ayat_model.dart';
import 'package:quran/feature/detail_surah/logic/add_last_read/add_last_read_cubit.dart';
import 'package:quran/feature/detail_surah/logic/audio_player/audio_player_cubit.dart';
import 'package:quran/feature/detail_surah/logic/detail_surah/detail_surah_cubit.dart';
import 'package:quran/feature/home/logic/get_last_read/get_last_read_cubit.dart';

import '../../../core/components/app_shimmer.dart';
import '../../../core/repositories/get_detail_surah_response_model.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/utils/assets.gen.dart';
import '../../../main.dart';
import 'widget/ayah_list_widget.dart';

class DetailSurahView extends StatefulWidget {
  const DetailSurahView({super.key});

  @override
  State<DetailSurahView> createState() => _DetailSurahViewState();
}

class _DetailSurahViewState extends State<DetailSurahView> {
  final Map<int, GlobalKey> _ayatKeys = {};
  String? surahName = '';

  void _scrollToLastRead(int lastReadAyat) {
    Future.delayed(Duration(milliseconds: 300), () {
      final key = _ayatKeys[lastReadAyat];
      if (key != null && key.currentContext != null) {
        Scrollable.ensureVisible(
          key.currentContext!,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final lastRead = context.select<GetLastReadCubit, SaveAyatModel?>(
      (cubit) => cubit.state.lastRead,
    );

    AppBar appBar() {
      return AppBar(
        title: Text(
          surahName ?? '',
          style: appTextTheme(context).headlineSmall,
        ),
        leading: BackButton(color: appColorScheme(context).onPrimary),
      );
    }

    Widget contentHeader(DetailSurah? data) {
      return Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          width: context.deviceWidth,
          padding: EdgeInsets.only(top: 30),
          height: context.deviceHeight * 0.3,
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
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data!.namaLatin ?? '',
                      style: appTextTheme(context).displayMedium!.copyWith(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data.arti ?? '',
                      style: appTextTheme(context).headlineSmall!.copyWith(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(),
                    Text(
                      '${data.tempatTurun} - ${data.jumlahAyat} Ayat',
                      style: appTextTheme(
                        context,
                      ).titleMedium!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(),
                    data.nomor == 1
                        ? Text(
                          data.nama ?? '',
                          style: appTextTheme(context).displayMedium!.copyWith(
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                        : Text(
                          'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                          style: appTextTheme(context).displayMedium!.copyWith(
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Opacity(
                  opacity: 0.1,
                  child: Image.asset(Assets.images.appQuran.path, scale: 2.4),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget contentAyah(DetailSurah? data) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: data!.ayat!.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final Ayat ayat = data.ayat![index];

            _ayatKeys[ayat.nomorAyat ?? 0] = GlobalKey();

            return BlocListener<AddLastReadCubit, AddLastReadState>(
              listener: (context, state) {
                if (state.status == AddLastReadStatus.error) {
                  AppTopSnackBar(context).showDanger(state.message);
                }

                if (state.status == AddLastReadStatus.loaded) {
                  AppTopSnackBar(context).showSuccess(state.message);
                  context.read<GetLastReadCubit>().getLastRead();
                }
              },
              child: GestureDetector(
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AppDialog.defaultDialog(
                        context,
                        'Add to Last Read? ',
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: DefaultButton(
                            backgroundColor:
                                appColorScheme(context).primaryContainer,
                            borderColor:
                                appColorScheme(context).primaryContainer,
                            title: 'Add',
                            onTap: () {
                              context.read<AddLastReadCubit>().addLastRead(
                                SaveAyatModel(
                                  namaSurat: data.namaLatin,
                                  nomorSurat: data.nomor,
                                  nomorAyat: ayat.nomorAyat,
                                ),
                              );
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    },
                  );
                  // context.read<AddLastReadCubit>().addLastRead(
                  //   SaveAyatModel(
                  //     namaSurat: data.namaLatin,
                  //     nomorSurat: data.nomor,
                  //     nomorAyat: ayat.nomorAyat,
                  //   ),
                  // );
                },
                child: AyahListWidget(
                  key: _ayatKeys[ayat.nomorAyat],
                  ayat: ayat,
                ),
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: BlocBuilder<DetailSurahCubit, DetailSurahState>(
        builder: (context, state) {
          if (state.status == DetailSurahStatus.error) {
            return Container(
              padding: EdgeInsets.all(20),
              width: context.deviceWidth,
              height: context.deviceHeight,
              child: Center(
                child: Text(
                  state.message!,
                  style: appTextTheme(context).displaySmall,
                ),
              ),
            );
          }
          if (state.status == DetailSurahStatus.loading) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: AppShimmer(context.deviceHeight, context.deviceWidth, 15),
            );
          }

          if (state.status == DetailSurahStatus.loaded) {
            final data = state.detailSurah;

            surahName = data!.namaLatin ?? '';

            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (lastRead != null && lastRead.namaSurat == data.namaLatin) {
                _scrollToLastRead(lastRead.nomorAyat ?? 0);
              }
            });

            context.read<AudioPlayerCubit>().setAyatList(state.ayat ?? []);

            return SingleChildScrollView(
              child: Column(children: [contentHeader(data), contentAyah(data)]),
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
