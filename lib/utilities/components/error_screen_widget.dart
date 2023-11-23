import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class ErrorScreen extends StatelessWidget {
  final Function()? onPressed;
  final String errorMessage;
  const ErrorScreen({super.key, this.onPressed, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.refresh,
              size: 30.r,
            ),
          ),
          CustomText(text: errorMessage)
        ],
      ),
    );
  }
}
