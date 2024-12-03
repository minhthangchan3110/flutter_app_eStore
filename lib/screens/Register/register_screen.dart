import 'package:admin_ecommerce/screens/Login/login_screen.dart';
import 'package:admin_ecommerce/screens/Register/Button/my_button.dart';
import 'package:admin_ecommerce/screens/Register/TextField/text_field.dart';

import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();

  void registerUserIn() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: 200, // Chiều cao cố định cho Lottie
              width: 300, // Chiều rộng cố định cho Lottie
              child: Image.asset('assets/image/logo_img.png'),
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Colors.grey[700],
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 25),
            MyTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              obscureText: true,
            ),
            SizedBox(
              height: 25,
            ),
            MyButton(
              onTap: registerUserIn,
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Login now',
                    style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
