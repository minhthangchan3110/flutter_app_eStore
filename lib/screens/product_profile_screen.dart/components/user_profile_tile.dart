import 'package:flutter/material.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/image/user.png'),
      ),
      title: Text(
        'Minh Thang Tran',
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.white),
      ),
      subtitle: Text(
        'minthangtran@gmail.com',
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
            color: Colors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.edit,
          size: 20.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
