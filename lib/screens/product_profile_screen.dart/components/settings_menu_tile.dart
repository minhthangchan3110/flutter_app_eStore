import 'package:flutter/material.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle,
      this.trailing,
      this.onTap});

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
            color: Colors.black),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
            color: Colors.black),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
