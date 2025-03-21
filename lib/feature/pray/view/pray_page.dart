import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/feature/pray/logic/get_jadwal_sholat_by_location/get_jadwal_sholat_by_location_cubit.dart';
import 'package:quran/feature/pray/repository/pray_repository.dart';
import 'package:quran/feature/pray/view/pray_view.dart';
import 'package:quran/feature/splash/logic/location_init_cubit/location_init_cubit.dart';

class PrayPage extends StatelessWidget {
  const PrayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LocationInitCubit>();

    return BlocProvider(
      create:
          (_) =>
              GetJadwalSholatByLocationCubit(PrayRepositoryImpl.create())
                ..getJadwalSholatByLocation(bloc.state.data!.location ?? ''),
      child: PrayView(),
    );
  }
}
