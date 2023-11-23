import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivally_task/app/featurs/layout/controller/cubit.dart';
import 'package:ivally_task/app/featurs/layout/view/layout_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LayoutCubit>(
          create: (BuildContext context) => LayoutCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          title: 'iValley Task',
          debugShowCheckedModeBanner: false,
          builder: ((context, child) {
            return MediaQuery(
              ///Setting font does not change with system font size
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: child!,
              ),
            );
          }),
          home: const LayoutScreen(),
        ),
      ),
    );
  }
}
