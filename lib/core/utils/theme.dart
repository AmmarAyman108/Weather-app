import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/core/utils/color.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.blueGradient10,
          statusBarBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColor.blueGradient3,
        ),
      ),
    );
  }
}
