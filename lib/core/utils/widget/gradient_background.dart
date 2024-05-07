import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/core/utils/color.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
      AppColor.blueGradient10,
      AppColor.blueGradient8,
      AppColor.blueGradient3,

              ], begin: Alignment.center, end: Alignment.bottomCenter)),
        child: child);
  }
}
