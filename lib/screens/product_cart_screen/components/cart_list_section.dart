import 'package:admin_ecommerce/utility/extensions.dart';

import '../../../utility/utility_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/model/cart_model.dart';

class CartListSection extends StatelessWidget {
  final List<CartModel> cartProducts;

  const CartListSection({
    super.key,
    required this.cartProducts,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: cartProducts.mapWithIndex((index, _) {
            CartModel cartItem = cartProducts[index];
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Màu shadow
                    blurRadius: 10, // Độ mờ của shadow
                    spreadRadius: 2, // Độ lan tỏa của shadow
                    offset: const Offset(0, 5), // Vị trí của shadow (x, y)
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Hình ảnh sản phẩm
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        cartItem.productImages.safeElementAt(0)?.replaceFirst(
                                'localhost:3000', '10.0.2.2:3000') ??
                            '',
                        width: 50,
                        height: 50,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Icon(Icons.error, color: Colors.red);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Thông tin sản phẩm
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem.productName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${cartItem.variants.safeElementAt(0)?.price} ₫",
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Điều khiển số lượng
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          splashRadius: 20.0,
                          onPressed: () {
                            context.cartProvider.updateCart(cartItem, -1);
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '${cartItem.quantity}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        IconButton(
                          splashRadius: 20.0,
                          onPressed: () {
                            context.cartProvider.updateCart(cartItem, 1);
                          },
                          icon: const Icon(Icons.add, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
