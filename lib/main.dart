import 'package:admin_ecommerce/core/data/data_provider.dart';
import 'package:admin_ecommerce/screens/product_cart_screen/provider/cart_provider.dart';
import 'package:admin_ecommerce/screens/product_category_screen/provider/product_category_provider.dart';
import 'package:admin_ecommerce/screens/product_detail_screen/providers/product_detail_provider.dart';
import 'package:admin_ecommerce/screens/product_favorites_screen/provider/favorite_provider.dart';
import 'package:admin_ecommerce/utility/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:admin_ecommerce/screens/Splash/splash_screen.dart';
import 'package:admin_ecommerce/screens/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  var cart = FlutterCart();
  await cart.initializeCart(isPersistenceSupportEnabled: true);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataProvider()),
        ChangeNotifierProvider(
            create: (context) =>
                ProductByCategoryProvider(context.dataProvider)),
        ChangeNotifierProvider(
            create: (context) => FavoriteProvider(context.dataProvider)),
        ChangeNotifierProvider(
            create: (context) => ProductDetailProvider(context.dataProvider)),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // Đây là trang chính khi khởi động
    );
  }
}
