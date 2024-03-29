import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tezda/ui/common/app_colors.dart';
import 'package:tezda/ui/common/validate.dart';
import 'package:tezda/ui/views/components/already_have_an_account_acheck.dart';
import 'package:tezda/ui/views/login/login_view.dart';
import 'package:tezda/ui/views/sign_in/sign_in_viewmodel.dart';

class SignUpForm extends ViewModelWidget<SignInViewModel> {
  final TextEditingController email = TextEditingController();

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, SignInViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: username,
              validator: (value) =>
                  Validate.validateName("Your username", value ?? ''),
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your username",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          TextFormField(
            controller: email,
            validator: (value) => Validate.validateEmail(value),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              validator: (value) =>
                  Validate.validateName("Your password", value ?? ''),
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
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              if (viewModel.formKey.currentState!.validate()) {
                viewModel.signIn(email.text.trim(), password.text.trim(),
                    username.text.trim());
              }
            },
            child: viewModel.isBusy
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginView();
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
