import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300, // Chiều cao cố định cho Lottie
              width: 300, // Chiều rộng cố định cho Lottie
              child: Lottie.network(
                'https://lottie.host/cef19f15-cc3f-49db-8d92-cb65b8a3671b/xPuiY4oOjE.json',
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Select Payment Method',
              style: TextStyle(
                fontSize: 24,
                fontFamily: "Montserrat", // Áp dụng font Montserrat trực tiếp
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Choose your preferred payment method for a seamless and secure checkout experience!',
              style: TextStyle(
                fontSize: 14, // Tăng font size để phù h��p hơn
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // Căn giữa text
            )
          ],
        ),
      )),
    );
  }
}
