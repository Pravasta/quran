import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/theme/app_color.dart';
import 'package:quran/feature/splash/logic/counter_bottom_navigation_cubit.dart';

import '../model/main_model.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBottomNavigationCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: MainModel.listBottomNav
              .map((e) => e['child'])
              .toList()
              .elementAt(currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            currentIndex: currentIndex,
            onTap: (index) {
              context.read<CounterBottomNavigationCubit>().changeIndex(index);
            },
            showUnselectedLabels: false,
            items:
                MainModel.listBottomNav
                    .map(
                      (e) => BottomNavigationBarItem(
                        icon: Image.asset(
                          e['icon'],
                          scale: 3.5,
                          height: 50,
                          color:
                              currentIndex == e['index']
                                  ? AppColor.primaryAccent
                                  : AppColor.neutral[500],
                        ),
                        label: '',
                      ),
                    )
                    .toList(),
          ),
        );
      },
    );
  }
}
