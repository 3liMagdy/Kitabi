


import 'package:dio/dio.dart';
import 'package:kitabi/core/errors/error_model.dart';

class ServerExceptino  implements Exception {
final ErrorModel errorModel;

  ServerExceptino({required this.errorModel});
}

void handleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerExceptino(
        errorModel: ErrorModel.fromjson(e.response!.data),
      );
    case DioExceptionType.sendTimeout:
      throw ServerExceptino(
        errorModel: ErrorModel.fromjson(e.response!.data),
      );
    case DioExceptionType.receiveTimeout:
      throw ServerExceptino(
        errorModel: ErrorModel.fromjson(e.response!.data),
      );
    case DioExceptionType.badCertificate:
      throw ServerExceptino(
        errorModel: ErrorModel.fromjson(e.response!.data),
      );
    case DioExceptionType.cancel:
      throw ServerExceptino(
        errorModel: ErrorModel.fromjson(e.response!.data),
      );
    case DioExceptionType.connectionError:
      throw ServerExceptino(
        errorModel: ErrorModel.fromjson(e.response!.data),
      );
    case DioExceptionType.unknown:
      throw ServerExceptino(
        errorModel: ErrorModel.fromjson(e.response!.data),
      );
    case DioExceptionType.badResponse:
      switch(e.response!.statusCode){
        case 400:
          throw ServerExceptino(
            errorModel: ErrorModel.fromjson(e.response!.data),
          );
        case 401:
          throw ServerExceptino(
            errorModel: ErrorModel.fromjson(e.response!.data),
          );
        case 403:
          throw ServerExceptino(
            errorModel: ErrorModel.fromjson(e.response!.data),
          );
        case 404:
          throw ServerExceptino(
            errorModel: ErrorModel.fromjson(e.response!.data),
          );
        case 409:
          throw ServerExceptino(
            errorModel: ErrorModel.fromjson(e.response!.data),
          );
        case 422:
          throw ServerExceptino(
            errorModel: ErrorModel.fromjson(e.response!.data),
          );
        case 504:
          throw ServerExceptino(
            errorModel: ErrorModel.fromjson(e.response!.data),
          );
      }
  }
}


  