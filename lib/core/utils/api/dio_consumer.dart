

import 'package:dio/dio.dart';
import 'package:kitabi/core/errors/failures.dart';
import 'package:kitabi/core/utils/api/api_consumer.dart';
import 'package:kitabi/core/utils/api/api_interceptors.dart';
import 'package:kitabi/core/utils/api/end_ponits.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}){
    dio.options.baseUrl=EndPonits.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,

    ));
  }



  @override
  Future<dynamic> get(String end_ponits) async {
    try {
      final response = await dio.get(end_ponits);
      return response.data;
    }  on DioException catch (e) {
     throw ServerFailure.fromDioError(e);
    }
  }

 
}
