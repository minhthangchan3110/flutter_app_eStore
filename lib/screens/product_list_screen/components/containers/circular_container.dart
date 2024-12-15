import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer(
      {super.key,
      this.child,
      this.width = 400,
      this.height = 400,
      this.padding = 0,
      this.radius = 400,
      this.backgroundColor = Colors.white});

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Color backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
