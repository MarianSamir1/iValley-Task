import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivally_task/app/featurs/layout/controller/cubit.dart';
import 'package:ivally_task/app/featurs/layout/controller/states.dart';
import 'package:ivally_task/app/featurs/layout/widget/app_bar.dart';
import '../widget/bottom_navigation_bar.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) => Scaffold(
        appBar: appBar(context),
        body: LayoutCubit.get(context)
            .taps[LayoutCubit.get(context).currentIndex],
        bottomNavigationBar: const BottomNavigationBarWidget(),
      ),
    );
  }
}
