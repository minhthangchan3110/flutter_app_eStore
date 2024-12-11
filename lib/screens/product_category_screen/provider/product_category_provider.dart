import '../../../models/brand.dart';
import '../../../models/category.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/data/data_provider.dart';
import '../../../models/product.dart';
import '../../../models/sub_category.dart';

class ProductByCategoryProvider extends ChangeNotifier {
  final DataProvider _dataProvider;
  Category? mySelectedCategory;
  SubCategory? mySelectedSubCategory;
  List<SubCategory> subCategories = [];
  List<Brand> brands = [];
  List<Brand> selectedBrands = [];
  List<Product> filteredProduct = [];

  ProductByCategoryProvider(this._dataProvider);

  //TODO: should complete filterInitialProductAndSubCategory

  filterInitialProductAndSubCategory(Category selectedCategory) {
    mySelectedSubCategory = SubCategory(name: 'All');
    mySelectedCategory = selectedCategory;
    subCategories = _dataProvider.subCategories
        .where((element) => element.categoryId?.sId == selectedCategory.sId)
        .toList();
    subCategories.insert(0, SubCategory(name: 'All'));
    filteredProduct = _dataProvider.products
        .where((element) => element.proCategoryId?.sId == selectedCategory.sId)
        .toList();
    notifyListeners();
  }

  //TODO: should complete filterProductBySubCategory
  filterProductBySubCategory(SubCategory subCategory) {
    mySelectedSubCategory = subCategory;
    if (subCategory.name?.toLowerCase() == 'all') {
      filteredProduct = _dataProvider.products
          .where((element) =>
              element.proCategoryId?.sId == mySelectedCategory?.sId)
          .toList();
      brands = [];
    } else {
      filteredProduct = _dataProvider.products
          .where((element) => element.proSubCategoryId?.sId == subCategory.sId)
          .toList();
      brands = _dataProvider.brands
          .where((element) => element.subcategoryId?.sId == subCategory.sId)
          .toList();
    }
    notifyListeners();
  }

  //TODO: should complete filterProductByBrand
  void filterProductByBrand() {
    if (selectedBrands.isEmpty) {
      filteredProduct = _dataProvider.products
          .where((product) =>
              product.proSubCategoryId?.sId == mySelectedSubCategory?.sId)
          .toList();
    } else {
      filteredProduct = _dataProvider.products
          .where((product) =>
              product.proSubCategoryId?.sId == mySelectedSubCategory?.sId &&
              selectedBrands
                  .any((brand) => product.proBrandId?.sId == brand.sId))
          .toList();
    }
    notifyListeners();
  }
  //TODO: should complete sortProducts

  void sortProducts({required bool ascending}) {
    filteredProduct.sort((a, b) {
      if (ascending) {
        return a.price!.compareTo(b.price ?? 0);
      } else {
        return b.price!.compareTo(a.price ?? 0);
      }
    });
    notifyListeners();
  }

  void updateUI() {
    notifyListeners();
  }
}
