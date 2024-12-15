import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key, required this.text, this.icon = Icons.search});

  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color.fromRGBO(158, 158, 158, 1),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
