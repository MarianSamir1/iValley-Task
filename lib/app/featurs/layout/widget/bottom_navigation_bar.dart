import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivally_task/app/featurs/layout/controller/cubit.dart';
import 'package:ivally_task/app/featurs/layout/controller/states.dart';
import 'package:ivally_task/utilities/styles/colors.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) => NavigationBar(
        onDestinationSelected: (int index) {
          LayoutCubit.get(context).changeLayoutBody(index: index);
        },
        indicatorColor: Colors.indigo,
        selectedIndex: LayoutCubit.get(context).currentIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.car_repair,
              color: ColorManager.white,
            ),
            icon: const Icon(
              Icons.car_repair,
            ),
            label: 'سيارات متاحه',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.calendar_month,
              color: ColorManager.white,
            ),
            icon: const Icon(Icons.calendar_month),
            label: 'صفقات يوميه',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.search,
              color: ColorManager.white,
            ),
            icon: const Icon(Icons.search),
            label: 'بحث عام',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.add_circle_outline_outlined,
              color: ColorManager.white,
            ),
            icon: const Icon(Icons.add_circle_outline_outlined),
            label: 'اضافة اعلان',
          ),
        ],
      ),
    );
  }
}
