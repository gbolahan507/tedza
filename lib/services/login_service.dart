import 'dart:async';

import 'package:tezda/app/app.locator.dart';
import 'package:tezda/core/api/auth.dart';
import 'package:tezda/core/error/custom_exception.dart';
import 'package:tezda/core/model/lgoin/login.dart';
import 'package:tezda/core/model/signUp/signIn.dart';

class AuthService {
  final _appApi = locator<AuthApi>();

  Login loginUser = Login();
  SignIn signInUser = SignIn();

  Future<SignIn> signIn(Map<String, String> data) async {
    try {
      signInUser = await _appApi.signIn(data);
    } on CustomException catch (_) {}
    return signInUser;
  }

  Future<Login> login(Map<String, String> data) async {
    try {
      loginUser = await _appApi.login(data);
      print(loginUser);
    } on CustomException catch (_) {}
    return loginUser;
  }
}
