import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home_view/presentation/view/home_view.dart';
import 'package:weather_app/features/home_view/presentation/manager/cubits/get_weather_cubit/weather_cubit.dart';

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
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Color.fromARGB(255, 4, 44, 78),
                    statusBarBrightness: Brightness.light,
                    systemNavigationBarIconBrightness: Brightness.light,
                    systemNavigationBarColor:
                        Color.fromARGB(255, 0, 100, 182)))),
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
      ),
    );
  }
}
