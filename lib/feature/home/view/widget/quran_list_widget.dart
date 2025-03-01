import 'package:flutter/material.dart';
import 'package:quran/core/theme/app_color.dart';
import 'package:quran/core/utils/assets.gen.dart';
import 'package:quran/main.dart';

class QuranListWidget extends StatelessWidget {
  const QuranListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
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
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Al-Fatihah',
                      style: appTextTheme(
                        context,
                      ).titleMedium!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Meccan - 7 Ayat',
                      style: appTextTheme(context).titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: appColorScheme(context).secondary,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'data',
                style: appTextTheme(
                  context,
                ).titleMedium!.copyWith(color: AppColor.primaryAccent[400]),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(color: AppColor.neutral[900], thickness: 2),
        ],
      ),
    );
  }
}
