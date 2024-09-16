import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_app/core/utils/style.dart';
import 'package:weather_app/core/utils/widget/custom_error_widget.dart';
import 'package:weather_app/core/utils/widget/custom_loading_indicator.dart';
import 'package:weather_app/core/utils/widget/gradient_background.dart';
import 'package:weather_app/features/search/presentation/Views/search_view.dart';
import 'package:weather_app/features/home/presentation/manager/weather_cubit/weather_cubit.dart';
import 'package:weather_app/features/home/presentation/manager/weather_cubit/weather_states.dart';
import 'package:weather_app/features/home/presentation/view/widgets/no_weather.dart';
import 'package:weather_app/features/home/presentation/view/widgets/weather_details.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text(
                'Weather Cloud',
                style: Style.textStyle28,
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 31,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).push<void>(
                    MaterialPageRoute(
                      builder: (context) => const SearchView(),
                    ),
                  ),
                )
              ],
            ),
            body: BlocBuilder<GetWeatherCubit, WeatherStates>(
                builder: (context, state) {
              if (state is InitialState) {
                return const NoWeather();
              } else if (state is WeatherFailureState) {
                return CustomErrorWidget(
                  errorMessage: state.errorMessage,
                );
              } else if (state is WeatherLoadedState) {
                return WeatherDetails(weatherData: state.weather);
              } else {
                return Skeletonizer(
                    enabled:
                        true, // Skeleton effect will be shown in loading state
                    child: WeatherDetails(weatherData: null));
              }
            })));
  }
}
