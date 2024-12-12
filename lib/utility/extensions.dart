import 'package:admin_ecommerce/core/data/data_provider.dart';
import 'package:admin_ecommerce/screens/login_screen/provider/user_provider.dart';
import 'package:admin_ecommerce/screens/product_cart_screen/provider/cart_provider.dart';
import 'package:admin_ecommerce/screens/product_category_screen/provider/product_category_provider.dart';
import 'package:admin_ecommerce/screens/product_detail_screen/providers/product_detail_provider.dart';
import 'package:admin_ecommerce/screens/product_favorites_screen/provider/favorite_provider.dart';

// import '../screen/login_screen/provider/user_provider.dart';
// import '../screen/product_cart_screen/provider/cart_provider.dart';
// import '../screen/profile_screen/provider/profile_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// import '../core/data/data_provider.dart';

// import '../screen/product_details_screen/provider/product_detail_provider.dart';

extension Providers on BuildContext {
  DataProvider get dataProvider =>
      Provider.of<DataProvider>(this, listen: false);
  ProductByCategoryProvider get proByCProvider =>
      Provider.of<ProductByCategoryProvider>(this, listen: false);
  FavoriteProvider get favoriteProvider =>
      Provider.of<FavoriteProvider>(this, listen: false);
  CartProvider get cartProvider =>
      Provider.of<CartProvider>(this, listen: false);
  ProductDetailProvider get proDetailProvider =>
      Provider.of<ProductDetailProvider>(this, listen: false);
  UserProvider get userProvider =>
      Provider.of<UserProvider>(this, listen: false);
}
