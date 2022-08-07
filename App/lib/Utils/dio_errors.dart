import 'package:dio/dio.dart';

String getErrorMessage(Object error) {
  var dioError = error as DioError;
  String? message = dioError.response?.data["message"];
  return message ?? "Ha ocurrido un error, por favor inténtelo nuevamente";
}
