import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading(
      {super.key,
      this.onPressed,
      this.textColor,
      this.buttonTitle = "View all",
      required this.title,
      this.showActionButton = true});
  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonTitle,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }
}
