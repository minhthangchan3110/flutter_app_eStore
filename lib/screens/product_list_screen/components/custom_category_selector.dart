import 'package:admin_ecommerce/screens/product_category_screen/product_category_screen.dart';
import 'package:admin_ecommerce/utility/animations/open_container_wrapper.dart';

import 'package:flutter/material.dart';
import '../../../models/category.dart';

class CategorySelector extends StatelessWidget {
  final List<Category> categories;

  const CategorySelector({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                // Điều hướng đến màn hình khác
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductByCategoryScreen(selectedCategory: category),
                  ),
                );
              },
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Image.network(
                        category.image?.replaceAll('localhost', '10.0.2.2') ??
                            '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 55,
                    child: Text(
                      category.name ?? '',
                      style: TextStyle(
                        color:
                            category.isSelected ? Colors.black : Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
