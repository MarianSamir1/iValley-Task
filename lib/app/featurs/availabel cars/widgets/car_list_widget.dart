import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivally_task/app/featurs/availabel%20cars/controller/cubit.dart';
import 'package:ivally_task/app/featurs/availabel%20cars/controller/states.dart';
import 'package:ivally_task/app/featurs/availabel%20cars/widgets/car_card_widget.dart';
import 'package:ivally_task/utilities/components/custom_text.dart';
import 'package:ivally_task/utilities/components/error_screen_widget.dart';

class CarsListWidget extends StatelessWidget {
  const CarsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = CarCubit.get(context);
    return BlocBuilder<CarCubit, CarState>(builder: (context, state) {
      //========================== Loading ======================
      if (state is GetAllAvailableCarsLoadingState &&
          cubit.lisOfAllAvailableCars.isEmpty) {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
          ],
        );
      }
      //============================ Error ============================
      else if (cubit.getAllAvailableCarsResponce.errorFlag == true &&
          cubit.currentPage == 1) {
        return ErrorScreen(
          onPressed: () => cubit.getAllAvailableCars(),
          errorMessage: cubit.getAllAvailableCarsResponce.errorMessage!,
        );
      }
      //============================ Success ===========================
      else if (cubit.lisOfAllAvailableCars.isEmpty) {
        return const CustomText(text: "لا يوجد سيارات متاحه");
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
            itemCount:
                cubit.lisOfAllAvailableCars.length + (cubit.isLoading ? 1 : 0),
            itemBuilder: (context, index) {
              //===================== pagination suceess ==============
              if (index < cubit.lisOfAllAvailableCars.length) {
                return CarCardWidget(
                  carModel: cubit.lisOfAllAvailableCars[index],
                );
              }
              //==================== pagenation error ================
              else if (cubit.getAllAvailableCarsResponce.errorFlag == true) {
                return IconButton(
                  onPressed: () {
                    cubit.getAllAvailableCars();
                  },
                  icon: const Icon(Icons.refresh),
                );
              }
              //================== pagination loading ==================
              else {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: SizedBox(
                      height: 25.h,
                      width: 25.w,
                      child: const CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    ),
                  ),
                );
              }
            },
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
          ),
        );
      }
    });
  }
}
