import 'package:flutter/material.dart';
import 'package:quran/core/extensions/build_context_ext.dart';

import '../../../core/theme/app_color.dart';
import '../../../core/utils/assets.gen.dart';
import '../../../main.dart';
import 'widget/ayah_list_widget.dart';

class DetailSurahView extends StatelessWidget {
  const DetailSurahView({super.key});

  @override
  Widget build(BuildContext context) {
    AppBar appBar() {
      return AppBar(
        title: Text('Al-Fatihah', style: appTextTheme(context).displaySmall),
        leading: BackButton(color: appColorScheme(context).onPrimary),
      );
    }

    Widget contentHeader() {
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
                      'Al-Fatihah',
                      style: appTextTheme(context).displayMedium!.copyWith(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Pembukaan',
                      style: appTextTheme(context).headlineSmall!.copyWith(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(),
                    Text(
                      'Meccan - 7 Ayat',
                      style: appTextTheme(
                        context,
                      ).titleMedium!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(),
                    Text(
                      'Ayat 1',
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

    Widget contentAyah() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: 7,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return AyahListWidget();
          },
        ),
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(children: [contentHeader(), contentAyah()]),
      ),
    );
  }
}
