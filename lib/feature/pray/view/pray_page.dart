import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/feature/pray/logic/get_code_location/get_code_location_cubit.dart';
import 'package:quran/feature/pray/logic/get_jadwal_sholat_by_location/get_jadwal_sholat_by_location_cubit.dart';
import 'package:quran/feature/pray/repository/pray_repository.dart';
import 'package:quran/feature/pray/view/pray_view.dart';

class PrayPage extends StatelessWidget {
  const PrayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) =>
                  GetCodeLocationCubit(PrayRepositoryImpl.create())
                    ..getCodeLocation('Surakarta'),
        ),
        BlocProvider(
          create:
              (_) =>
                  GetJadwalSholatByLocationCubit(PrayRepositoryImpl.create()),
        ),
      ],
      child: PrayView(),
    );
  }
}
