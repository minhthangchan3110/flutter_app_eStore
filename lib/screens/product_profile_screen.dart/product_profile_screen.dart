import 'package:admin_ecommerce/screens/product_list_screen/components/containers/primary_header_container.dart';
import 'package:admin_ecommerce/screens/product_profile_screen.dart/components/profile.dart';
import 'package:admin_ecommerce/screens/product_profile_screen.dart/components/settings_menu_tile.dart';
import 'package:admin_ecommerce/screens/product_profile_screen.dart/components/user_profile_tile.dart';
import 'package:admin_ecommerce/widgets/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductProfileScreen extends StatelessWidget {
  const ProductProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          PrimaryHeaderContainer(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  title: Text(
                    'Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                UserProfileTile(
                  onPressed: () => Get.to(() => const Profile()),
                ),
                const SizedBox(
                  height: 32.0,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                SectionHeading(
                  title: 'Account Settings',
                  showActionButton: false,
                ),
                const SizedBox(
                  height: 5,
                ),
                SettingsMenuTile(
                  icon: Icons.home_outlined,
                  title: 'My Address',
                  subTitle: 'Set shopping delivery address',
                ),
                SettingsMenuTile(
                  icon: Icons.shopping_cart_checkout_outlined,
                  title: 'My Orders',
                  subTitle: 'In-progress and Complete Order',
                ),
                SettingsMenuTile(
                  icon: Icons.account_balance_outlined,
                  title: 'Bank Account',
                  subTitle: 'Withdraw balance to registered bank accout',
                ),
                SettingsMenuTile(
                  icon: Icons.currency_exchange_outlined,
                  title: 'My Coupons',
                  subTitle: 'List of all the discounted coupons',
                ),
                const SizedBox(
                  height: 36.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 24.0), // Padding cho chữ
                      backgroundColor: Colors.black, // Đổi màu nền
                    ),
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white, // Đổi màu chữ
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            // Add other profile details here
          ),
        ],
      ),
    ));
  }
}
