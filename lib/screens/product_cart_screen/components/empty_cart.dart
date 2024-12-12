import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Căn giữa nội dung
        children: [
          // Animation Lottie
          Expanded(
            flex: 2,
            child: Center(
              child: Lottie.network(
                'https://lottie.host/dfdb56fe-d04f-4015-b869-c8bdfdcf794d/hzKN9f3aWi.json',
                width: 200,
                height: 200,
                frameRate: FrameRate.max,
              ),
            ),
          ),
          // Text thông báo
          const Text(
            "Your cart is empty!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'Montserrat',
              color: Colors.black54,
            ),
          ),
          const Spacer(), // Đảm bảo phần dưới được căn đều
        ],
      ),
    );
  }
}
