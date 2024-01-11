import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tezda/ui/common/app_colors.dart';
import 'package:tezda/ui/views/components/already_have_an_account_acheck.dart';
import 'package:tezda/ui/views/login/login_viewmodel.dart';
import 'package:tezda/ui/views/sign_in/sign_in_view.dart';

class LoginForm extends ViewModelWidget<LoginViewModel> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: username,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Your username",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: password,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () {
              viewModel.login(username.text.trim(), password.text.trim());
            },
            child: Text(
              "Login".toUpperCase(),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignInView();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
