import 'package:dio/dio.dart';

String ksBaseUrl = "https://fakestoreapi.com";

const String ksItem = "item";
const String ksSignIn = "users";
const String ksLogin = "auth/login";
const String ksProductList = "products?limit=5";

class BaseAPI {
  var dio = Dio();
  String baseUrl = ksBaseUrl;
  Options defaultOptions = Options(
    contentType: "application/json",

    sendTimeout: const Duration(seconds: 20), // 20 seconds
    receiveTimeout: const Duration(seconds: 20), // 20 seconds
    validateStatus: (s) => s! < 500,
  );
}
