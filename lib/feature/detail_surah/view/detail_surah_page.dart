import 'package:flutter/material.dart';
import 'package:quran/feature/detail_surah/view/detail_surah_view.dart';

class DetailSurahPage extends StatelessWidget {
  const DetailSurahPage({super.key});

  static const RouteSettings routeSettings = RouteSettings(
    name: '/detail-surah-page',
  );

  @override
  Widget build(BuildContext context) {
    return DetailSurahView();
  }
}
