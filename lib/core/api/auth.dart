import 'package:dio/dio.dart';
import 'package:tezda/core/base_api.dart';
import 'package:tezda/core/error/custom_exception.dart';
import 'package:tezda/core/error/error_util.dart';
import 'package:tezda/core/model/lgoin/login.dart';
import 'package:tezda/core/model/signUp/signIn.dart';

class AuthApi extends BaseAPI {
  Future<SignIn> signIn(Map<String, String> data) async {
    try {
      final response = await Dio().post(
        "$ksBaseUrl/$ksSignIn",
        data: data,
      );
      switch (response.statusCode) {
        case 200:
          return SignIn.fromJson(response.data);
        default:
          throw 'Error in fetching response';
      }
    } catch (e) {
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<Login> login(Map<String, String> data) async {
    try {
      final response = await Dio().post(
        "$ksBaseUrl/$ksLogin",
        data: data,
      );
      print(response.data);
      switch (response.statusCode) {
        case 200:
          return Login.fromJson(response.data);
        default:
          throw 'Error in fetching response';
      }
    } catch (e) {
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }
}
