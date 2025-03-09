import 'package:flutter/material.dart';

import 'package:quran/core/extensions/build_context_ext.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/utils/assets.gen.dart';
import '../../../../main.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, this.nameSurah, this.noAyat});

  final String? nameSurah;
  final int? noAyat;

  @override
  Widget build(BuildContext context) {
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
                      nameSurah ?? 'Surah -',
                      style: appTextTheme(context).titleLarge!.copyWith(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      noAyat == null ? 'Ayat No -' : 'Ayat No. $noAyat',
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
}
