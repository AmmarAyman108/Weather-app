import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/theme.dart';
import 'package:weather_app/features/home/presentation/view/home_view.dart';
import 'package:weather_app/features/home/presentation/manager/weather_cubit/weather_cubit.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
        theme: AppTheme.getTheme(),
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
      ),
    );
  }
}
