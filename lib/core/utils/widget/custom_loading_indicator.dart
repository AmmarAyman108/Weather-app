import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/color.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: AppColor.white,
    ));
  }
}
