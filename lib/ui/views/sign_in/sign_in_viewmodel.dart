import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tezda/app/app.locator.dart';
import 'package:tezda/app/app.router.dart';
import 'package:tezda/core/model/signUp/signIn.dart';
import 'package:tezda/services/login_service.dart';

class SignInViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignIn get signInUser => _authService.signInUser;

  Future<SignIn> signIn(String email, String password, String username) async {
    final Map<String, String> data = {
      "email": email,
      "password": password,
      "username": username,
    };
    _authService.signInUser = await runBusyFuture(_authService.signIn(data));
    if (_authService.signInUser.id != 0) {
      _navigationService.navigateTo(Routes.loginView);
    }
    return signInUser;
  }
}
