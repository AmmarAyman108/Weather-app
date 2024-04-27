import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:weather_app/constants.dart';

class Api {
  Future get(
      {required String endPoint,
      String? token,
      Map<String, dynamic>? queryParameters}) async {
    Dio dio = Dio(BaseOptions(
        baseUrl: Settings.baseUrl,
        receiveDataWhenStatusError: true,
        receiveTimeout: const Duration(seconds: 20),
        connectTimeout: const Duration(seconds: 20)));
    Map<String, dynamic> headers = {
      //  'Content-Type': 'application/x-www-form-urlencoded',
      // 'Accept': 'application/json',
    };
    if (token != null) {
      headers.addAll(
        {
          'Authorization': 'Bearer $token',
        },
      );
    }
    Response response = await dio.get(
      endPoint,
      options: Options(headers: headers),
      queryParameters: queryParameters,
    );
    return response.data;
  }

  //DELETE Method
  Future delete(
      {required String url, //url is contain id of item to delete
      String? token,
      Map<String, dynamic>? queryParameters}) async {
    Dio dio = Dio();
    Map<String, dynamic> headers = {};
    if (token != null) {
      headers.addAll(
        {
          'Authorization': 'Bearer $token',
        },
      );
    }

    Response response = await dio.delete(url,
        options: Options(headers: headers), queryParameters: queryParameters);
    return response.data;
  }

//POST Method
  Future post(
      {required String url,
      required body,
      String? token,
      Map<String, dynamic>? queryParameters}) async {
    Dio dio = Dio();
    Map<String, String> headers = {
      // 'Content-Type': 'application/x-www-form-urlencoded',
      // 'Accept': 'application/json',
    };
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    Response response = await dio.post(url,
        data: body,
        options: Options(
          headers: headers,
        ),
        queryParameters: queryParameters);
    return response.data;
  }

//PUT Method
  Future put(
      {required String url,
      required body,
      @required String? token,
      Map<String, dynamic>? queryParameters}) async {
    Dio dio = Dio();
    Map<String, String> headers = {
      // 'Content-Type': 'application/x-www-form-urlencoded',
      // 'Accept': 'application/json',
    };
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    Response response = await dio.put(url,
        data: body,
        options: Options(
          headers: headers,
        ),
        queryParameters: queryParameters);
    return response.data;
  }
}
