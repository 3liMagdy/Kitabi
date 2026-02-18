import 'dart:io';
import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response?.statusCode,
          dioError.response?.data,
        );

      case DioExceptionType.cancel:
        return const ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.unknown:
        if (dioError.error is SocketException) {
          return const ServerFailure('No Internet Connection');
        }
        return const ServerFailure('Unexpected Error, Please try again!');

      default:
        return const ServerFailure(
          'Opps There was an Error, Please try again',
        );
    }
  }

  factory ServerFailure.fromResponse(
      int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      final message =
          response is Map && response['error'] != null
              ? response['error']['message']
              : 'There was an error, please try again';

      return ServerFailure(message);
    } else if (statusCode == 404) {
      return const ServerFailure(
          'Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return const ServerFailure(
          'Internal Server error, Please try later');
    } else {
      return const ServerFailure(
          'Opps There was an Error, Please try again');
    }
  }
}
