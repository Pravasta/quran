import 'package:flutter/material.dart';
import 'package:quran/core/components/app_button.dart';
import 'package:quran/core/extensions/build_context_ext.dart';
import 'package:quran/core/routes/navigation.dart';
import 'package:quran/core/theme/app_color.dart';
import 'package:quran/core/utils/assets.gen.dart';
import 'package:quran/feature/splash/view/main_page.dart';
import 'package:quran/main.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Quran App', style: appTextTheme(context).displayMedium),
            Text(
              'Can read every time and everywhere',
              style: appTextTheme(context).headlineSmall!.copyWith(
                color: AppColor.neutral[400],
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(),
            Container(
              width: context.deviceWidth,
              height: context.deviceHeight * 0.6,
              decoration: BoxDecoration(
                color: AppColor.primaryAccent,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Image.asset(
                Assets.images.quranSplash.path,
                fit: BoxFit.contain,
              ),
            ),
            DefaultButton(
              title: 'Get Started',
              onTap: () {
                Navigation.push(MainPage(), MainPage.routeSettings);
              },
              titleColor: AppColor.primary,
              backgroundColor: AppColor.accent,
              width: context.deviceWidth * 0.5,
              borderRadius: 50,
              height: context.deviceHeight * 0.08,
            ),
          ],
        ),
      ),
    );
  }
}
