// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  Failure({
    required this.errorMessage,
  });
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
  factory ServerFailure.fromDioException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            errorMessage: "Connection Timeout with ApiServer ");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: "Receive Timeout with ApiServer ");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: "Send Timeout with ApiServer ");
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "Request is cancel ");
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: "No internet Connection");
      case DioExceptionType.unknown:
        return ServerFailure(errorMessage: "Unexpected Error,try again");
      case DioExceptionType.badResponse:
        return ServerFailure.formBadResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      default:
        return ServerFailure(errorMessage: 'opps , there was an error');
    }
  }
  factory ServerFailure.formBadResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 404) {
      return ServerFailure(errorMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(errorMessage: 'Api method error');
    } else if (statusCode == 500) {
      return ServerFailure(errorMessage: 'Internal Server Error');
    } else {
      return ServerFailure(errorMessage: 'opps , there was an error');
    }
  }
}
