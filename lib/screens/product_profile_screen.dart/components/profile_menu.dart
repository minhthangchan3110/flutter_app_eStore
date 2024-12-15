import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.value,
      this.icon = Icons.arrow_right});
  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12.0,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                value,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0),
              ),
            ),
            Expanded(
                child: Icon(
              icon,
              size: 18,
            ))
          ],
        ),
      ),
    );
  }
}
