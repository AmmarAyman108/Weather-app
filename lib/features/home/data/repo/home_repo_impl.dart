import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/core/utils/api_methods/api_methods.dart';
import 'package:weather_app/features/home/data/Models/weather_model.dart';
import 'package:weather_app/features/home/data/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failure, WeatherModel>> getWeather(
      {required String city}) async {
    try {
      var jsonData = await Api().get(
          endPoint: '/forecast.json?key=${Settings.apiKey}&q=$city&days=7');

      return right(WeatherModel.fromJason(jsonData));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
