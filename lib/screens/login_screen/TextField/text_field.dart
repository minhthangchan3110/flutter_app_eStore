import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller, // Liên kết controller
        obscureText: obscureText,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black, // Màu chữ
          fontFamily: 'Montserrat', // Font chữ tùy chỉnh
        ),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          fillColor: Colors.grey.shade200, // Không dùng 'const'
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            // Tuỳ chỉnh kiểu chữ của hintText
            fontSize: 16,
            fontWeight: FontWeight.w400,

            color: Colors.grey[600], // Màu chữ
            fontFamily: 'Montserrat', // Sử dụng font custom
          ),
        ),
      ),
    );
  }
}
