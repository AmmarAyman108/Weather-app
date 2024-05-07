import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/core/utils/color.dart';
import 'package:weather_app/core/utils/style.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.errorMessage,
  });
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: Style.textStyle20
            .copyWith(color: AppColor.red),
      ),
    );
  }
}
