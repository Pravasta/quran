import 'package:flutter/material.dart';
import 'package:quran/core/extensions/build_context_ext.dart';
import 'package:quran/core/theme/app_color.dart';
import 'package:quran/main.dart';

import '../../../../core/utils/assets.gen.dart';

class AyahListWidget extends StatelessWidget {
  const AyahListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
