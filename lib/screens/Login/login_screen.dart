import 'dart:convert'; // Để xử lý JSON
import 'package:admin_ecommerce/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Thư viện gọi API
import 'package:admin_ecommerce/screens/Login/Button/my_button.dart';
import 'package:admin_ecommerce/screens/Login/TextField/text_field.dart';
import 'package:admin_ecommerce/screens/Register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Hàm đăng nhập
  void signUserIn(BuildContext context) async {
    final username = usernameController.text;
    final password = passwordController.text;

    // Kiểm tra trường trống
    if (username.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Please fill in all fields.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    try {
      // Gọi API đăng nhập
      final response = await http.post(
        Uri.parse(
            'http://10.0.2.2:3000/users/login'), // Thay bằng URL API của bạn
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': username,
          'password': password,
        }),
      );

      // Xử lý kết quả trả về từ server
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData['success']) {
          // Đăng nhập thành công -> Điều hướng trực tiếp
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          // Lỗi từ server (VD: Sai tài khoản, mật khẩu)
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Error'),
              content: Text(responseData['message']),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } else {
        // Lỗi server (không phải lỗi người dùng nhập sai)
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text('Server error: ${response.statusCode}'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      // Lỗi không mong muốn (network, server không phản hồi, etc.)
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text('Something went wrong: $error'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Logo
                SizedBox(
                  height: 200,
                  width: 300,
                  child: Image.asset('assets/image/logo_img.png'),
                ),

                // Welcome text
                Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 25),

                // Username input
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // Password input
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // Forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Sign in button
                MyButton(
                  onTap: () => signUserIn(context),
                ),

                const SizedBox(height: 50),

                // Register link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member?',
                      style: TextStyle(fontFamily: 'Montserrat'),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
