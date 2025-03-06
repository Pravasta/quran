import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/components/app_shimmer.dart';
import 'package:quran/core/extensions/build_context_ext.dart';
import 'package:quran/core/extensions/date_time_ext.dart';
import 'package:quran/feature/pray/logic/get_jadwal_sholat_by_location/get_jadwal_sholat_by_location_cubit.dart';
import 'package:quran/feature/splash/logic/location_init_cubit/location_init_cubit.dart';
import 'package:quran/main.dart';

class PrayView extends StatefulWidget {
  const PrayView({super.key});

  @override
  State<PrayView> createState() => _PrayViewState();
}

class _PrayViewState extends State<PrayView> {
  @override
  Widget build(BuildContext context) {
    AppBar appBar() {
      return AppBar(
        automaticallyImplyLeading: false,
        title: Text('Jadwal Sholat', style: appTextTheme(context).bodyLarge),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.location_on_outlined,
              color: appColorScheme(context).primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: appColorScheme(context).primary),
          ),
        ],
      );
    }

    Widget header() {
      return BlocBuilder<LocationInitCubit, LocationInitState>(
        builder: (context, state) {
          if (state.status == LocationInitStatus.loading) {
            return AppShimmer(
              context.deviceHeight * 1 / 3,
              context.deviceWidth,
              10,
            );
          }

          if (state.status == LocationInitStatus.error) {
            return Center(
              child: Text(
                state.message,
                style: appTextTheme(context).titleMedium,
              ),
            );
          }

          if (state.status == LocationInitStatus.loaded) {
            return Row(
              spacing: 10,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: appColorScheme(context).primary,
                ),
                Expanded(
                  child: Text(
                    state.data!.location ?? '',
                    style: appTextTheme(context).titleMedium,
                  ),
                ),
                Text(
                  DateTime.now().toFormattedDate(),
                  style: appTextTheme(context).titleMedium,
                ),
              ],
            );
          }

          return SizedBox();
        },
      );
    }

    Widget content() {
      Widget listSchedule(String title, String time) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: appTextTheme(context).titleMedium),
              Row(
                children: [
                  Text(time, style: appTextTheme(context).titleMedium),
                  SizedBox(width: 10),
                  Icon(
                    Icons.alarm_add_outlined,
                    color: appColorScheme(context).secondary,
                    size: 30,
                  ),
                ],
              ),
            ],
          ),
        );
      }

      return BlocBuilder<
        GetJadwalSholatByLocationCubit,
        GetJadwalSholatByLocationState
      >(
        builder: (context, state) {
          if (state.status == GetJadwalSholatByLocationStatus.loading) {
            return AppShimmer(
              context.deviceHeight * 1 / 3,
              context.deviceWidth,
              10,
            );
          }

          if (state.status == GetJadwalSholatByLocationStatus.error) {
            return Center(
              child: Text(
                state.message,
                style: appTextTheme(context).titleMedium,
              ),
            );
          }

          if (state.status == GetJadwalSholatByLocationStatus.loaded) {
            final data = state.data?.jadwal;

            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: appColorScheme(context).primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  listSchedule('Imsak', data!.imsak ?? ''),
                  listSchedule('Subuh', data.subuh ?? ''),
                  listSchedule('Terbit', data.terbit ?? ''),
                  listSchedule('Dzuhur', data.dzuhur ?? ''),
                  listSchedule('Ashar', data.ashar ?? ''),
                  listSchedule('Maghrib', data.maghrib ?? ''),
                  listSchedule('Isya', data.isya ?? ''),
                ],
              ),
            );
          }

          return SizedBox();
        },
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(children: [header(), SizedBox(height: 20), content()]),
      ),
    );
  }
}
