import 'package:admin_ecommerce/core/data/data_provider.dart';
import 'package:admin_ecommerce/screens/product_list_screen/components/app_bar.dart';
import 'package:admin_ecommerce/screens/product_list_screen/components/containers/circular_container.dart';
import 'package:admin_ecommerce/screens/product_list_screen/components/containers/primary_header_container.dart';
import 'package:admin_ecommerce/screens/product_list_screen/components/custom_app_bar.dart';
import 'package:admin_ecommerce/screens/product_list_screen/components/custom_category_selector.dart';
import 'package:admin_ecommerce/screens/product_list_screen/curved_edgets.dart/custom_curved_edges.dart';
import 'package:admin_ecommerce/screens/product_list_screen/components/custom_poster.dart';
import 'package:admin_ecommerce/screens/product_list_screen/curved_edgets.dart/custom_curved_edgets_widget.dart';
import 'package:admin_ecommerce/widgets/custom_search.dart';
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to eStore',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Hello Minh Thang',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomSearch(
                    text: 'Search in Store',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Top categories",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Consumer<DataProvider>(
                        builder: (context, dataProvider, child) {
                          return CategorySelector(
                            categories: dataProvider.categories,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: const PosterSection(),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Consumer<DataProvider>(
                  builder: (context, dataProvider, child) {
                    return ProductGridView(
                      items: dataProvider.products,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
