import 'package:admin_ecommerce/screens/home_page.dart';
import 'package:admin_ecommerce/utility/extensions.dart';

import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import '../../utility/app_color.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      // savedEmail: 'testing@gmail.com',
      // savedPassword: '12345',
      loginAfterSignUp: false,
      // logo: const AssetImage('assets/images/logo.png'),
      onLogin: (LoginData loginData) {
        //TODO: should complete call login
        context.userProvider.login(loginData);
      },
      onSignup: (SignupData data) {
        //TODO: should complete call register
        context.userProvider.register(data);
      },
      onSubmitAnimationCompleted: () {
        if (context.userProvider.getLoginUser()?.sId != null) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) {
              return const HomePage();
            },
          ));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) {
              return const LoginScreen();
            },
          ));
        }
      },
      onRecoverPassword: (_) => null,
      hideForgotPasswordButton: true,
      theme: LoginTheme(
          primaryColor: AppColor.darkGrey,
          accentColor: AppColor.darkOrange,
          buttonTheme: const LoginButtonTheme(
            backgroundColor: AppColor.darkOrange,
          ),
          cardTheme: const CardTheme(
              color: Colors.white, surfaceTintColor: Colors.white),
          titleStyle: const TextStyle(color: Colors.black)),
    );
  }
}
