import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivally_task/app/featurs/availabel%20cars/controller/cubit.dart';
import 'package:ivally_task/app/featurs/availabel%20cars/controller/states.dart';
import 'package:ivally_task/app/featurs/availabel%20cars/widgets/car_card_widget.dart';
import 'package:ivally_task/utilities/components/error_screen_widget.dart';

class CarsListWidget extends StatefulWidget {
  const CarsListWidget({super.key});

  @override
  State<CarsListWidget> createState() => _CarsListWidgetState();
}

class _CarsListWidgetState extends State<CarsListWidget> {
  @override
  void initState() {
    super.initState();
    CarCubit.get(context).scrollController.addListener(
          CarCubit.get(context).scrollListener,
        );
  }

  @override
  Widget build(BuildContext context) {
    var cubit = CarCubit.get(context);
    return BlocBuilder<CarCubit, CarState>(builder: (context, state) {
      if (state is GetAllAvailableCarsLoadingState &&
          cubit.lisOfAllAvailableCars.isEmpty) {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
          ],
        );
      } else if (cubit.getAllAvailableCarsResponce.errorFlag == true) {
        return ErrorScreen(
          errorMessage: cubit.getAllAvailableCarsResponce.errorMessage!,
        );
      } else {
        return NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollEndNotification &&
                scrollNotification.metrics.extentAfter == 0) {
              cubit.paginationFun();
            }
            return false;
          },
          child: ListView.separated(
            controller: CarCubit.get(context).scrollController,
            itemBuilder: (context, index) {
              if (index < cubit.lisOfAllAvailableCars.length) {
                return CarCardWidget(
                    carModel: cubit.lisOfAllAvailableCars[index]);
              } else {
                return Center(
                  child: SizedBox(
                    height: 25.h,
                    width: 25.w,
                    child: const CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  ),
                );
              }
            },
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
            itemCount:
                cubit.lisOfAllAvailableCars.length + (cubit.isLoading ? 1 : 0),
          ),
        );
      }
    });
  }
}
