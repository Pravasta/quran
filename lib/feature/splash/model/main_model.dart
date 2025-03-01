import 'package:quran/core/utils/assets.gen.dart';
import 'package:quran/feature/bookmark/view/bookmark_page.dart';
import 'package:quran/feature/home/view/home_page.dart';
import 'package:quran/feature/pray/view/pray_page.dart';

class MainModel {
  static final List<Map<String, dynamic>> listBottomNav = [
    {
      'icon': Assets.icons.quran.path,
      'label': '',
      'child': HomePage(),
      'index': 0,
    },
    {
      'icon': Assets.icons.pray.path,
      'label': '',
      'child': PrayPage(),
      'index': 1,
    },
    {
      'icon': Assets.icons.bookmark.path,
      'label': '',
      'child': BookmarkPage(),
      'index': 2,
    },
  ];
}
