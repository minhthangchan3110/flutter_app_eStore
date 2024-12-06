import 'package:admin_ecommerce/core/data/data_provider.dart';
import 'package:admin_ecommerce/screens/product_list_screen/components/custom_app_bar.dart';
import 'package:admin_ecommerce/screens/product_list_screen/components/custom_poster.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello Sina",
                ),
                Text(
                  "Lets gets somethings?",
                ),
                const PosterSection(),
                Text(
                  "Top categories",
                ),
                const SizedBox(height: 5),
                // Consumer<DataProvider>(
                //   builder: (context, dataProvider, child) {
                //     return CategorySelector(
                //       categories: dataProvider.categories,
                //     );
                //   },
                // ),
                // Consumer<DataProvider>(
                //   builder: (context, dataProvider, child) {
                //     return ProductGridView(
                //       items: dataProvider.allProducts,
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
