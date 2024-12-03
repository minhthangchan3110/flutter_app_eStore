import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Chỉnh kích thước của Lottie
                SizedBox(
                  height: 300, // Chiều cao cố định cho Lottie
                  width: 300, // Chiều rộng cố định cho Lottie
                  child: Lottie.network(
                    'https://lottie.host/5074ab4e-0bc5-421e-b849-45ff91214698/XC4gLBkaqc.json',
                  ),
                ),
                // Tăng khoảng cách giữa Lottie và Text
                SizedBox(height: 40),
                Text(
                  'Choose your product!',
                  style: TextStyle(
                    fontSize: 24, // Tăng font size để phù hợp hơn
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center, // Căn giữa text
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Explore our latest tech gadgets and choose the perfect one to upgrade your life!',
                  style: TextStyle(
                    fontSize: 14, // Tăng font size để phù h��p hơn
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center, // Căn giữa text
                )
              ],
            )),
      ),
    );
  }
}
