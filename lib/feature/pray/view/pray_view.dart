import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/components/app_shimmer.dart';
import 'package:quran/core/components/app_top_snackbar.dart';
import 'package:quran/core/extensions/build_context_ext.dart';
import 'package:quran/feature/pray/logic/get_code_location/get_code_location_cubit.dart';
import 'package:quran/feature/pray/logic/get_jadwal_sholat_by_location/get_jadwal_sholat_by_location_cubit.dart';
import 'package:quran/main.dart';

class PrayView extends StatefulWidget {
  const PrayView({super.key});

  @override
  State<PrayView> createState() => _PrayViewState();
}

class _PrayViewState extends State<PrayView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<GetCodeLocationCubit, GetCodeLocationState>(
      listener: (context, state) {
        if (state.status == GetCodeLocationStatus.error) {
          AppTopSnackBar(context).showDanger(state.messagte);
        }

        if (state.status == GetCodeLocationStatus.loaded) {
          final codeLocation = state.location[0].id ?? '';

          context
              .read<GetJadwalSholatByLocationCubit>()
              .getJadwalSholatByLocation(codeLocation);
        }
      },
      child: BlocBuilder<
        GetJadwalSholatByLocationCubit,
        GetJadwalSholatByLocationState
      >(
        builder: (context, state) {
          if (state.status == GetJadwalSholatByLocationStatus.loading) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: AppShimmer(context.deviceHeight, context.deviceWidth, 15),
            );
          }

          if (state.status == GetJadwalSholatByLocationStatus.error) {
            return Center(child: Text(state.message));
          }

          if (state.status == GetJadwalSholatByLocationStatus.loaded) {
            print(state.data!.daerah ?? '');
            print(state.data!.lokasi ?? '');

            return Container(
              width: context.deviceWidth,
              height: context.deviceHeight,
              child: Center(
                child: Text(
                  state.data!.jadwal!.ashar ?? '',
                  style: appTextTheme(context).titleLarge,
                ),
              ),
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
