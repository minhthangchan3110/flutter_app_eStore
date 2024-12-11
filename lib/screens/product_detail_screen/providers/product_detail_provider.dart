import 'package:admin_ecommerce/models/product.dart';
import 'package:admin_ecommerce/models/variant.dart';
import 'package:admin_ecommerce/utility/snack_bar_helper.dart';
import 'package:admin_ecommerce/utility/utility_extention.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/data/data_provider.dart'; // Đảm bảo bạn đã import DataProvider
import 'package:flutter_cart/flutter_cart.dart';

class ProductDetailProvider extends ChangeNotifier {
  final DataProvider _dataProvider;
  String? selectedVariant;
  var flutterCart = FlutterCart();
  ProductDetailProvider(this._dataProvider);

  // Getter để lấy tất cả variants từ DataProvider
  List<Variant> get allVariants => _dataProvider.allVariants;

  void addToCart(Product product, BuildContext context) {
    if (product.proVariantId != null &&
        product.proVariantId!.isNotEmpty &&
        selectedVariant == null) {
      // Hiển thị SnackBar lỗi khi không chọn biến thể
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a variant'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    double? price = product.offerPrice != product.price
        ? product.offerPrice
        : product.price;

    flutterCart.addToCart(
      cartModel: CartModel(
        productId: '${product.sId}',
        productName: '${product.name}',
        productImages: ['${product.images.safeElementAt(0)?.url}'],
        variants: [ProductVariant(price: price ?? 0, color: selectedVariant)],
        productDetails: '${product.description}',
      ),
    );

    selectedVariant = null;

    // Hiển thị SnackBar thành công khi thêm vào giỏ hàng
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item Added'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ),
    );

    notifyListeners();
  }

  // Phương thức để cập nhật giao diện
  void updateUI() {
    notifyListeners();
  }
}
