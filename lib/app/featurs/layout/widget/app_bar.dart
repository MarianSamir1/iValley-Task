import 'package:flutter/material.dart';
import 'package:ivally_task/app/featurs/layout/controller/cubit.dart';
import 'package:ivally_task/utilities/components/custom_text.dart';
import 'package:ivally_task/utilities/styles/colors.dart';
import 'package:ivally_task/utilities/styles/fonts.dart';

PreferredSizeWidget appBar(BuildContext context) => AppBar(
      backgroundColor: Colors.indigo,
      centerTitle: true,
      title: CustomText(
        color: ColorManager.white,
        fontSize: FontManager.font20,
        text: LayoutCubit.get(context)
            .appBarTitile[LayoutCubit.get(context).currentIndex],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert_outlined,
            color: ColorManager.white,
          ),
        )
      ],
    );
