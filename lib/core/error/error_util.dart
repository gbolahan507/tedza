import 'package:dio/dio.dart';

class DioErrorUtil {
  // general methods:------------------------------------------------------------
  static String handleError(dynamic error) {
    String errorDescription = '';
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          errorDescription = 'Request to API server was cancelled';
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription = 'Connection timeout with API server';
          break;
        case DioExceptionType.unknown:
          errorDescription = 'Connection failed due to internet connection';
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = 'Receive timeout in connection with API server';

          break;
        case DioExceptionType.badResponse:
          if (error.response!.statusCode == 404) {
            errorDescription =
                error.response!.statusMessage ?? 'Unexpected error occurred';
          } else if (error.response!.statusCode == 400) {
            errorDescription = error.response!.statusMessage ?? 'Bad request';
          } else if (error.response!.statusCode == 401) {
            errorDescription = error.response!.statusMessage ??
                'These credentials are wrong \nCheck and try again';
          } else if (error.response!.statusCode == 500) {
            errorDescription = error.response!.statusMessage ??
                'Server is currently under maintenance, Try again later';
          } else if (error.response!.statusCode == 502) {
            errorDescription = 'Server is currently under maintenance';
          } else {
            errorDescription =
                'Received invalid status code: ${error.response!.statusCode}';
          }
          break;
        case DioExceptionType.sendTimeout:
          errorDescription = 'Send timeout in connection with API server';
          break;
        case DioExceptionType.badCertificate:
          break;
        case DioExceptionType.connectionError:
          errorDescription = 'Error in connection';
          break;
      }
    } else if (error is TypeError) {
      errorDescription = error.stackTrace.toString();
    } else {
      return error.toString();
    }
    return errorDescription;
  }
}
