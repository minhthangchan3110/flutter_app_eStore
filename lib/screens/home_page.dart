import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to 2301Store!',
            style: TextStyle(
              fontSize: 24,
              fontFamily: "Montserrat", // Áp dụng font Montserrat trực tiếp
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 30),
          Lottie.network(
              'https://lottie.host/91202e5f-6076-4223-9ce8-43dc2566e025/S7zbepXbB4.json'),
          SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Tạo hình tròn
              border: Border.all(
                color: Colors.black, // Màu viền
                width: 2.0, // Độ dày của viền
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Màu đổ bóng (nhạt)
                  spreadRadius: 3, // Độ lan của bóng
                  blurRadius: 7, // Độ mờ của bóng
                  offset: Offset(0, 3), // Độ lệch của bóng (x, y)
                ),
              ],
            ),
            padding: EdgeInsets.all(8.0), // Khoảng cách từ biểu tượng đến viền
            child: Icon(
              Icons.arrow_forward,
              size: 24.0,
            ),
          )
        ],
      )),
    );
  }
}
