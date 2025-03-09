import 'dart:convert';

import 'package:quran/core/repositories/get_detail_surah_response_model.dart';
import 'package:quran/core/repositories/list_surah_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ApiLocalService {
  Future<void> addListSurahToLocal(List<Surah> data);
  Future<ListSurahResponseModel> getListSurahFromLocal();
  Future<void> addDetailSurahToLocal(DetailSurah data);
  Future<DetailSurah> getDetailSurahFromLocal(int surahNumber);
}

class ApiLocalServiceImpl implements ApiLocalService {
  @override
  Future<void> addListSurahToLocal(List<Surah> data) async {
    final prefs = await SharedPreferences.getInstance();

    final maps = data.map((e) => e.toMap()).toList();

    await prefs.setString('list_surah', json.encode(maps));
  }

  @override
  Future<ListSurahResponseModel> getListSurahFromLocal() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString('list_surah');

    if (data != null) {
      final surah = List<Surah>.from(
        json.decode(data).map((x) => Surah.fromMap(x)),
      );

      return ListSurahResponseModel(data: surah);
    } else {
      throw 'Data Not Found';
    }
  }

  @override
  Future<void> addDetailSurahToLocal(DetailSurah data) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      'detail_surah_${data.nomor}',
      json.encode(data.toMap()),
    );
  }

  @override
  Future<DetailSurah> getDetailSurahFromLocal(int surahNumber) async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString('detail_surah_$surahNumber');

    if (data != null) {
      return DetailSurah.fromMap(json.decode(data));
    } else {
      throw 'Data Not Found';
    }
  }
}
