import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivally_task/utilities/styles/fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double? fontSize;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final FontWeight? fontWeight;
  final double? spacing;
  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.textStyle,
    this.textAlign,
    this.maxLines,
    this.textOverflow,
    this.fontWeight,
    this.spacing,
    this.color = const Color(0xff28292A),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
      style: TextStyle(
        fontSize: fontSize?.sp ?? FontManager.font14.sp,
        color: color,
        height: spacing,
        fontWeight: fontWeight,
      ),
    );
  }
}
