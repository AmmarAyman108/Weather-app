import 'package:weather_app/features/home_view/data/Models/weather_model.dart';

abstract class WeatherStates {}

class InitialState extends WeatherStates {}

class WeatherLoadingState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  final WeatherModel weather;
  WeatherLoadedState({required this.weather});
}

class WeatherFailureState extends WeatherStates {
  final String errorMessage;
  WeatherFailureState({required this.errorMessage});
}
