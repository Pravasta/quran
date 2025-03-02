import 'package:flutter/material.dart';
import 'package:quran/core/extensions/build_context_ext.dart';
import 'package:quran/core/theme/app_color.dart';
import 'package:quran/main.dart';

import '../../../../core/utils/assets.gen.dart';

class AyahListWidget extends StatelessWidget {
  const AyahListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: context.deviceWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
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
                    child: Text('1', style: appTextTheme(context).bodyLarge),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.play_arrow_outlined,
                      color: AppColor.primaryAccent,
                      size: 30,
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.bookmark_border_outlined,
                      color: AppColor.primaryAccent,
                      size: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // arabic text basmallah
          Text(
            'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
            style: appTextTheme(
              context,
            ).displayMedium!.copyWith(fontWeight: FontWeight.w500),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 20),
          Text(
            '[All] praise is [due] to Allah, Lord of the worlds,',
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
