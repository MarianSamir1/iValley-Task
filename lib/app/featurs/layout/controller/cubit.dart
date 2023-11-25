import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivally_task/app/featurs/availabel%20cars/view/availabel_cars_screen.dart';
import 'package:ivally_task/utilities/constants/constatnts.dart';

import 'states.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayouInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  final List<Widget> taps = [
    const AvailabelCarScreen(),
    const Column(),
    const Column(),
    const Column(),
  ];

  final List<String> appBarTitile = [
    Constants.availabelCars,
    Constants.dailyDeals,
    Constants.generlSerch,
    Constants.addAdvertiseng,
  ];

  changeLayoutBody({required int index}) {
    currentIndex = index;
    emit(ChangeLayoutBodySuccessState());
  }
}
