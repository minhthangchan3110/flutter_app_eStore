import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
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
                SizedBox(
                  height: 300, // Chiều cao cố định cho Lottie
                  width: 300, // Chiều rộng cố định cho Lottie
                  child: Lottie.network(
                    'https://lottie.host/a8325472-13cf-481c-bfdf-3b83516da8fd/B8AnhJA9Vl.json',
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  'Deliver at your door step',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily:
                        "Montserrat", // Áp dụng font Montserrat trực tiếp
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Fast and secure shipping – choose your favorite product and get it delivered to your doorstep',
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
