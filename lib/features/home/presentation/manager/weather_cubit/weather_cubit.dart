import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/data/repo/home_repo_impl.dart';
import 'package:weather_app/features/home/presentation/manager/weather_cubit/weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(InitialState());
  // ignore: prefer_typing_uninitialized_variables
  var weather;
  getWeatherCubit({required String city}) async {
    emit(WeatherLoadingState());
    weather = await HomeRepoImpl().getWeather(city: city);
    weather.fold((failure) {
      emit(WeatherFailureState(errorMessage: failure.errorMessage));
    }, (weather) {
      emit(WeatherLoadedState(weather: weather));
    });
  }
}
