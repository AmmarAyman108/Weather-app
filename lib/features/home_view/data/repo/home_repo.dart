import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/features/home_view/data/Models/weather_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, WeatherModel>> getWeather({required String city});
}
