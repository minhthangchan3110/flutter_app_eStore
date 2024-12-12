import 'package:admin_ecommerce/utility/animations/animated_switcher_wrapper.dart';

import 'provider/cart_provider.dart';
import '../../utility/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utility/app_color.dart';
import 'components/buy_now_bottom_sheet.dart';
import 'components/cart_list_section.dart';
import 'components/empty_cart.dart';

class ProductCartScreen extends StatelessWidget {
  const ProductCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      context.cartProvider.getCartItem();
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: const Text(
          "My Cart",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.grey[100],
        child: Consumer<CartProvider>(
          builder: (context, cartProvider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                cartProvider.myCartItems.isEmpty
                    ? const EmptyCart()
                    : Consumer<CartProvider>(
                        builder: (context, cartProvider, child) {
                          return CartListSection(
                              cartProducts: cartProvider.myCartItems);
                        },
                      ),

                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w400),
                      ),
                      AnimatedSwitcherWrapper(
                        child: Text(
                          "${context.cartProvider.getCartSubTotal()} ₫",
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFFEC6813),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //? buy now button
                // SizedBox(
                //   width: double.infinity,
                //   child: Padding(
                //     padding:
                //         const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                //     child: ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //           padding: const EdgeInsets.all(20)),
                //       onPressed: context.cartProvider.myCartItems.isEmpty
                //           ? null
                //           : () {
                //               showCustomBottomSheet(context);
                //             },
                //       child: const Text("Buy Now",
                //           style: TextStyle(color: Colors.white)),
                //     ),
                //   ),
                // )
              ],
            );
          },
        ),
      ),
    );
  }
}
