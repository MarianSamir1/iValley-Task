import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivally_task/app/featurs/availabel%20cars/controller/cubit.dart';
import 'package:ivally_task/app/featurs/availabel%20cars/widgets/car_list_widget.dart';

class AvailabelCarScreen extends StatelessWidget {
  const AvailabelCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CarCubit>(
      create: (BuildContext context) => CarCubit()..getAllAvailableCars(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
              child: const CarsListWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
