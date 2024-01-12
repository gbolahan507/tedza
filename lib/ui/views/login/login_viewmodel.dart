import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tezda/app/app.locator.dart';
import 'package:tezda/app/app.router.dart';
import 'package:tezda/core/model/lgoin/login.dart';
import 'package:tezda/core/storage/local_storage.dart';
import 'package:tezda/services/login_service.dart';

class LoginViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Login get loginUser => _authService.loginUser;

  Future<Login> login(String username, String password) async {
    final Map<String, String> data = {
      "username": username,
      "password": password,
    };
    _authService.loginUser = await runBusyFuture(_authService.login(data));
    if (_authService.loginUser.token != "") {
      AppStorage.saveTokene(_authService.loginUser.token);
      _navigationService.navigateTo(Routes.productListView);
    }
    return loginUser;
  }
}
