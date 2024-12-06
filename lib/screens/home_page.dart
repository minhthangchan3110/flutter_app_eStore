import 'package:admin_ecommerce/screens/product_cart_screen/product_cart_screen.dart';
import 'package:admin_ecommerce/screens/product_favorites_screen/product_favorite_screen.dart';
import 'package:admin_ecommerce/screens/product_list_screen/product_list_screen.dart';
import 'package:admin_ecommerce/screens/product_profile_screen.dart/product_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  // Danh sách các trang
  final List<Widget> pages = [
    ProductListScreen(),
    ProductFavoriteScreen(),
    ProductCartScreen(),
    ProductProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex], // Hiển thị trang tương ứng với tab
      bottomNavigationBar: Container(
        color: Color(0xFF89A8B2),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 10.0,
          ),
          child: GNav(
            gap: 8,
            backgroundColor: Color(0xFF89A8B2),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Color(0xFFB3C8CF),
            padding: EdgeInsets.all(16),
            selectedIndex: selectedIndex, // Tab được chọn
            onTabChange: (index) {
              setState(() {
                selectedIndex = index; // Cập nhật tab
              });
            },
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                textStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Favorites',
                textStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
              ),
              GButton(
                icon: Icons.shopping_bag,
                text: 'Cart',
                textStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
                textStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
