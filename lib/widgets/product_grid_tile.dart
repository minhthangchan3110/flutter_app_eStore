import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../utility/extensions.dart';
import '../utility/utility_extention.dart';
import 'custom_network_image.dart';

class ProductGridTile extends StatelessWidget {
  final Product product;
  final int index;
  final bool isPriceOff;

  const ProductGridTile({
    super.key,
    required this.product,
    required this.index,
    required this.isPriceOff,
  });

  @override
  Widget build(BuildContext context) {
    double discountPercentage = context.dataProvider
        .calculateDiscountPercentage(
            product.price ?? 0, product.offerPrice ?? 0);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Image Section
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Builder(
                builder: (context) {
                  String imageUrl = product.images?.isNotEmpty == true
                      ? product.images
                              ?.safeElementAt(0)
                              ?.url
                              ?.replaceFirst('localhost', '10.0.2.2') ??
                          ''
                      : '';

                  return CustomNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.scaleDown,
                    scale: 3.0,
                  );
                },
              ),
            ),

            // Product Info Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 100, // Tăng chiều cao để đủ chỗ cho nút
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        product.name ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.offerPrice != 0
                                  ? "\$${product.offerPrice} "
                                  : "\$${product.price}",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0,
                                color: product.offerPrice != 0
                                    ? Colors.red
                                    : Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (product.offerPrice != null &&
                                product.offerPrice != product.price)
                              Text(
                                "\$${product.price}",
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                          ],
                        ),
                        if (discountPercentage != 0)
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.red[100],
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            child: Text(
                              "- ${discountPercentage.toInt()}%",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 10),
                        SizedBox(width: 5),
                        Text(
                          "4.5", // Thay số bằng giá trị động
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "(120 đánh giá)", // Thay số bằng giá trị động
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
