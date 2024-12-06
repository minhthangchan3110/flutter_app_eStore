import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
              child: Icon(
                Icons.menu,
                color: Colors.grey[900],
              ),
            ),
          ),
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w900,
                  color: Colors.grey),
              // border: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.white),
              //   borderRadius: BorderRadius.circular(20),
              // ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            style: TextStyle(
                color: Colors.black, // Màu chữ khi người dùng nhập
                fontFamily: 'Montserrat',
                fontSize: 15 // Thay đổi font chữ
                ),
          ),
        ),
      ),
    );
  }
}
