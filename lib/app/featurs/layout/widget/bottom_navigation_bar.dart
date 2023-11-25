import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivally_task/app/featurs/layout/controller/cubit.dart';
import 'package:ivally_task/app/featurs/layout/controller/states.dart';
import 'package:ivally_task/utilities/constants/constatnts.dart';
import 'package:ivally_task/utilities/styles/colors.dart';

import 'bottom_navigation_widget.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) => NavigationBar(
        onDestinationSelected: (int index) {
          LayoutCubit.get(context).changeLayoutBody(index: index);
        },
        indicatorColor: ColorManager.primaryColor,
        selectedIndex: LayoutCubit.get(context).currentIndex,
        destinations: const <Widget>[
          BottomNavigationWidget(
            icon: Icons.car_repair,
            label: Constants.availabelCars,
          ),
          BottomNavigationWidget(
            icon: Icons.calendar_month,
            label: Constants.dailyDeals,
          ),
          BottomNavigationWidget(
            icon: Icons.search,
            label: Constants.generlSerch,
          ),
          BottomNavigationWidget(
            icon: Icons.add_circle_outline_outlined,
            label: Constants.addAdvertiseng,
          )
        ],
      ),
    );
  }
}
