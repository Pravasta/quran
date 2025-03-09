import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/components/app_top_snackbar.dart';
import 'package:quran/core/extensions/build_context_ext.dart';
import 'package:quran/feature/detail_surah/logic/audio_player/audio_player_cubit.dart';
import 'package:quran/core/repositories/get_detail_surah_response_model.dart';
import 'package:quran/core/theme/app_color.dart';
import 'package:quran/main.dart';

import '../../../../core/utils/assets.gen.dart';

class AyahListWidget extends StatelessWidget {
  const AyahListWidget({super.key, required this.ayat});

  final Ayat ayat;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: context.deviceWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.deviceWidth,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: appColorScheme(context).primaryContainer,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.icons.ayah.path),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '${ayat.nomorAyat}',
                      style: appTextTheme(context).bodyLarge,
                    ),
                  ),
                ),
                BlocConsumer<AudioPlayerCubit, AudioPlayerState>(
                  listener: (context, state) {
                    if (state.message != null) {
                      AppTopSnackBar(context).showDanger(state.message ?? '');
                    }
                  },
                  builder: (context, state) {
                    final isPlaying =
                        state.isPlaying &&
                        state.currentAyatId == ayat.nomorAyat;

                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (state.isPlaying) {
                              context.read<AudioPlayerCubit>().pause();
                            } else {
                              context.read<AudioPlayerCubit>().play(
                                ayat.nomorAyat!,
                                ayat.audio!.the05 ?? '',
                              );
                            }
                          },
                          child: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow_outlined,
                            color: AppColor.primaryAccent,
                            size: 30,
                          ),
                        ),
                        isPlaying ? SizedBox(width: 10) : SizedBox(),
                        if (isPlaying)
                          GestureDetector(
                            onTap: () {
                              context.read<AudioPlayerCubit>().stop();
                            },
                            child: Icon(
                              Icons.stop,
                              color: AppColor.primaryAccent,
                            ),
                          )
                        else
                          SizedBox(),
                        SizedBox(width: 10),
                        Icon(
                          Icons.bookmark_border_outlined,
                          color: AppColor.primaryAccent,
                          size: 30,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              '${ayat.teksArab}',
              style: appTextTheme(
                context,
              ).displayMedium!.copyWith(fontWeight: FontWeight.w500),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
          ),
          SizedBox(height: 20),
          Text(
            '${ayat.teksLatin}',
            style: appTextTheme(context).bodyMedium!.copyWith(
              color: appColorScheme(context).primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${ayat.teksIndonesia}',
            style: appTextTheme(context).bodyMedium!.copyWith(
              color: AppColor.neutral,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Divider(color: AppColor.neutral[500], thickness: 0.3),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
