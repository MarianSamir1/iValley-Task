import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivally_task/app/featurs/availabel%20cars/view/availabel_cars_screen.dart';

import 'states.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayouInitialState());

  static LayoutCubit get(context, {bool listen = false}) =>
      BlocProvider.of(context, listen: listen);

  int currentIndex = 0;

  final List<Widget> taps = [
    const AvailabelCarScreen(),
    const Column(),
    const Column(),
    const Column(),
  ];

  final List<String> appBarTitile = [
    "سيارات المتاحه",
    'صفقات يوميه',
    'بحث عام',
    'اضافة اعلان',
  ];

  changeLayoutBody({required int index}) {
    currentIndex = index;
    emit(ChangeLayoutBodySuccessState());
  }
}
