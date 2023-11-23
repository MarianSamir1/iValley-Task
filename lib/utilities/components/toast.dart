import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ivally_task/utilities/styles/colors.dart';
import 'package:ivally_task/utilities/styles/fonts.dart';

Widget showToastWithIcon({required String msg}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.green[400],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.check,
          color: Colors.white,
        ),
        const SizedBox(
          width: 12.0,
        ),
        Text(
          msg,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}

void showToast({required String msg, required ToastStates state}) =>
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: chooseToastColor(state),
      textColor: ColorManager.white,
      fontSize: FontManager.font16,
    );

//enum
// ignore: constant_identifier_names
enum ToastStates { SUCCRSS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCRSS:
      color = ColorManager.green;
      break;
    case ToastStates.ERROR:
      color = ColorManager.red;
      break;
    case ToastStates.WARNING:
      color = ColorManager.amber;
      break;
  }
  return color;
}
