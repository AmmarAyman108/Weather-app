import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/core/utils/api_methods/api_methods.dart';
import 'package:weather_app/features/home_view/data/Models/weather_model.dart';
import 'package:weather_app/features/home_view/data/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo{
  @override
  Future<Either<Failure, WeatherModel>> getWeather({required String city}) async{
   try {
     var jsonData = await Api().get(
          endPoint: '/forecast.json?key=${Settings.apiKey}&q=$city&days=7');
     
      return right(WeatherModel.fromJason(jsonData));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errorMessage:e.toString()));
    }
  }
  // @override
  // Future<WeatherModel> getWeather({required String city}) async {
  //   try {
  //     Response response = await Api().get(
  //         endPoint: '/forecast.json?key=${Settings.apiKey}&q=$city&days=7');
  //     Map<String, dynamic> jsonData = response.data;
  //     return right(WeatherModel.fromJason(jsonData));
  //   } on DioException catch (e) {
  //     throw Exception(e);
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // Future<WeatherModel> getWeather({required String city}) async {
  //   String baseUrl = 'http://api.weatherapi.com/v1';
  //   String apiKey = 'ed1444729601456b8cc03857231808';

  //   try {
  //     Dio dio = Dio();
  //     Response response =
  //         await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$city&days=7');
  //     Map<String, dynamic> jsonData = response.data;

  //     return WeatherModel.fromJason(jsonData);
  //   } on DioException catch (e) {
  //     throw Exception(e);
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }
}
