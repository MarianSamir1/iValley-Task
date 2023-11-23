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
      getAllAvailableCarsResponce.values.forEach((v) {
        lisOfAllAvailableCars.add(CarModel.fromJson(v));
      });
      isLoading = false;
      log("======= first available car name : ${lisOfAllAvailableCars[0].fullName} ==== ");
      emit(GetAllAvailableCarsSuccessState());
    } else {
      emit(GetAllAvailableCarsErrorState());
    }
  }

  final ScrollController scrollController = ScrollController();
  int currentPage = 1;
  int totalPages = 0;
  bool isLoading = false;

  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (!isLoading && currentPage < totalPages) {
        isLoading = true;
        currentPage++;
        emit(PaginationState());
        getAllAvailableCars();
      }
    }
  }

  paginationFun() {
    if (isLoading == false && currentPage < 10) {
      isLoading = true;
      currentPage++;
      emit(PaginationState());
      getAllAvailableCars();
    }
  }
}
