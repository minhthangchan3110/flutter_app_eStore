import 'package:admin_ecommerce/core/data/data_provider.dart';
import 'package:admin_ecommerce/screens/product_favorites_screen/provider/favorite_provider.dart';
import 'package:admin_ecommerce/utility/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_ecommerce/screens/Splash/splash_screen.dart';
import 'package:admin_ecommerce/screens/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataProvider()),
        ChangeNotifierProvider(
            create: (context) => FavoriteProvider(context.dataProvider)),
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
