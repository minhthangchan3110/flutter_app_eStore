import 'package:admin_ecommerce/core/data/data_provider.dart';
import 'package:admin_ecommerce/screens/product_list_screen/components/custom_app_bar.dart';
import 'package:admin_ecommerce/screens/product_list_screen/components/custom_category_selector.dart';
import 'package:admin_ecommerce/screens/product_list_screen/components/custom_poster.dart';
import 'package:admin_ecommerce/widgets/product_grid_view.dart';
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
      backgroundColor: Colors.grey[100],
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to Store",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Lets gets somethings?",
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                ),
                const PosterSection(),
                Text(
                  "Top categories",
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Consumer<DataProvider>(
                  builder: (context, dataProvider, child) {
                    return CategorySelector(
                      categories: dataProvider.categories,
                    );
                  },
                ),
                Consumer<DataProvider>(
                  builder: (context, dataProvider, child) {
                    return ProductGridView(
                      items: dataProvider.products,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
