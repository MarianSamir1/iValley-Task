import 'package:flutter/material.dart';
import 'package:ivally_task/utilities/styles/colors.dart';

class BottomNavigationWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  const BottomNavigationWidget({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      selectedIcon: Icon(
        icon,
        color: ColorManager.white,
      ),
      icon: Icon(icon),
      label: label,
    );
  }
}
