import 'package:admin_ecommerce/models/variant.dart';
import 'package:admin_ecommerce/screens/product_detail_screen/components/product_rating_section.dart';
import 'package:admin_ecommerce/screens/product_detail_screen/providers/product_detail_provider.dart';
import 'package:admin_ecommerce/screens/product_favorites_screen/provider/favorite_provider.dart';
import 'package:admin_ecommerce/utility/extensions.dart';
import 'package:admin_ecommerce/utility/snack_bar_helper.dart';
import 'package:admin_ecommerce/widgets/carousel_slider.dart';
import 'package:admin_ecommerce/widgets/horizondal_list.dart';
import 'package:admin_ecommerce/widgets/page_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import 'dart:convert';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen(this.product, {super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    List<String> variantIds = [];
    if (product.proVariantId != null && product.proVariantId!.isNotEmpty) {
      variantIds = List<String>.from(jsonDecode(product.proVariantId![0]));
    }
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          actions: [
            // Sử dụng Consumer để lấy trạng thái yêu thích từ provider
            Consumer<FavoriteProvider>(
              builder: (context, favoriteProvider, child) {
                return IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color:
                        favoriteProvider.checkIsItemFavorite(product.sId ?? '')
                            ? Colors.red
                            : const Color(0xFFA6A3A0),
                  ),
                  onPressed: () {
                    // Cập nhật danh sách yêu thích thông qua FavoriteProvider
                    context.favoriteProvider
                        .updateToFavoriteList(product.sId ?? '');
                  },
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            // Nội dung chi tiết sản phẩm
            Expanded(
              child: SingleChildScrollView(
                child: PageWrapper(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Phần hình ảnh sản phẩm
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: CarouselSlider(items: product.images ?? []),
                      ),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Tên sản phẩm
                              Text(
                                '${product.name}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20.0,
                                    fontFamily: 'Montserrat'),
                              ),
                              const SizedBox(height: 10),
                              // Phần đánh giá sản phẩm
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ProductRatingSection(),
                                  const SizedBox(width: 10),
                                  Row(
                                    children: [
                                      Text(
                                        product.quantity != 0
                                            ? "Available stock : ${product.quantity}"
                                            : "Not available",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),

                              product.proVariantId!.isNotEmpty
                                  ? Text(
                                      'Available ${product.proVariantTypeId?.type}',
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: 'Montserrat'),
                                    )
                                  : const SizedBox(),
                              Consumer<ProductDetailProvider>(
                                  builder: (context, proDetailProvider, child) {
                                return HorizontalList(
                                  items: variantIds
                                      .where((id) => id != null)
                                      .map((id) {
                                    // So sánh với variants đã tải từ DB để lấy tên
                                    var variant = proDetailProvider.allVariants
                                        .firstWhere((v) => v.sId == id,
                                            orElse: () => Variant(
                                                sId: id, name: 'Unknown'));

                                    return variant.name; // Trả về tên variant
                                  }).toList(), // Filter out null values and map to names
                                  itemToString: (val) =>
                                      val ??
                                      '', // Handle null values inside the closure
                                  selected: proDetailProvider.selectedVariant,
                                  onSelect: (val) {
                                    proDetailProvider.selectedVariant = val;
                                    proDetailProvider.updateUI();
                                  },
                                );
                              }),

                              // Thông tin về sản phẩm
                              Text(
                                "About",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Montserrat'),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "${product.description}",
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Montserrat'),
                              ),
                              const SizedBox(height: 40),
                              Text(
                                "Specifications",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Montserrat'),
                              ),
                              const SizedBox(height: 10),
                              Table(
                                border: TableBorder.all(color: Colors.black),
                                children: [
                                  // Duyệt qua thông số kỹ thuật và tạo hàng bảng động
                                  ...product.specifications!.entries
                                      .map((entry) {
                                    return TableRow(
                                      children: [
                                        TableCell(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              entry.key,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                  fontFamily: 'Montserrat'),
                                            ),
                                          ),
                                        ),
                                        TableCell(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              entry.value ?? '',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                  fontFamily: 'Montserrat'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ],
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Nút thêm vào giỏ hàng
            Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    // Giá và điều khiển số lượng
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.offerPrice != 0
                              ? "${product.offerPrice} ₫"
                              : "${product.price} ₫",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: double.infinity, // Độ rộng full màn hình
                      height: 40, // Chiều cao của button
                      child: ElevatedButton(
                        onPressed: product.quantity != 0
                            ? () {
                                context.proDetailProvider
                                    .addToCart(product, context);
                                debugPrint(
                                    "Product added to cart: ${product.toJson()}");
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Màu nền của button
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(50), // Góc bo tròn
                          ),
                        ),
                        child: const Text(
                          "Add To Cart",
                          style: TextStyle(
                            color: Colors.black, // Màu chữ
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            fontSize: 16, // Kích thước chữ
                          ),
                        ),
                      ),
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
