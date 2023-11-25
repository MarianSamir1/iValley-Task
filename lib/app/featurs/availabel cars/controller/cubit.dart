import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivally_task/app/data/apis/car_apis.dart';
import 'package:ivally_task/app/model/car_model.dart';

import '../../../model/response_handler_model.dart';
import 'states.dart';

class CarCubit extends Cubit<CarState> {
  CarCubit() : super(CarInitialState());

  static CarCubit get(context) => BlocProvider.of(context);

  List<CarModel> lisOfAllAvailableCars = [];
  ResponseHandlerClass getAllAvailableCarsResponce = ResponseHandlerClass();

  getAllAvailableCars() async {
    emit(GetAllAvailableCarsLoadingState());
    getAllAvailableCarsResponce =
        await CarApis.getAllAvilableCar(pageNumber: currentPage);

    if (getAllAvailableCarsResponce.errorFlag == false) {
      if (getAllAvailableCarsResponce.values.isNotEmpty) {
        getAllAvailableCarsResponce.values.forEach((v) {
          lisOfAllAvailableCars.add(CarModel.fromJson(v));
        });
      }
      isLoading = false;
      log("======= first available car name : ${lisOfAllAvailableCars[0].fullName} ==== ");
      emit(GetAllAvailableCarsSuccessState());
    } else {
      emit(GetAllAvailableCarsErrorState());
    }
  }

  final ScrollController scrollController = ScrollController();
  int currentPage = 1;
  bool isLoading = false;

  paginationFun() {
    if (isLoading == false && currentPage < 100) {
      isLoading = true;
      currentPage++;
      emit(PaginationState());
      getAllAvailableCars();
    }
  }
}
