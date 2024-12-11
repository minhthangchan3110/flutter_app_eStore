import 'dart:convert';

import 'package:admin_ecommerce/models/api_responsive.dart';
import 'package:admin_ecommerce/models/variant.dart';
import 'package:admin_ecommerce/utility/snack_bar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:get/get.dart';

import '../../../models/category.dart';
import '../../models/brand.dart';
import '../../models/order.dart';
import '../../models/poster.dart';
import '../../models/product.dart';
import '../../models/sub_category.dart';

import '../../services/http_services.dart';
import '../../utility/constants.dart';

class DataProvider extends ChangeNotifier {
  HttpService service = HttpService();

  List<Category> _allCategories = [];
  List<Category> _filteredCategories = [];
  List<Category> get categories => _filteredCategories;

  List<SubCategory> _allSubCategories = [];
  List<SubCategory> _filteredSubCategories = [];
  List<SubCategory> get subCategories => _filteredSubCategories;

  List<Brand> _allBrands = [];
  List<Brand> _filteredBrands = [];
  List<Brand> get brands => _filteredBrands;

  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];
  List<Product> get products => _filteredProducts;
  List<Product> get allProducts => _allProducts;

  List<Poster> _allPosters = [];
  List<Poster> _filteredPosters = [];
  List<Poster> get posters => _filteredPosters;

  List<Order> _allOrders = [];
  List<Order> _filteredOrders = [];
  List<Order> get orders => _filteredOrders;

  List<Variant> _allVariants = [];
  List<Variant> _filteredVariants = [];
  List<Variant> get variants => _filteredVariants;

  // Getter để lấy tất cả variants
  List<Variant> get allVariants => _allVariants;
  DataProvider() {
    // Gọi các phương thức để tải dữ liệu ban đầu nếu cần
    getAllPosters();
    getAllCategory();
    getAllProducts();
    getAllSubCategory();
    getAllBrands();
    getAllVariants();

    // Các phương thức khác cần thiết có thể gọi ở đây
  }

  Future<List<Poster>> getAllPosters({bool showSnack = false}) async {
    try {
      Response response = await service.getItems(endpointUrl: 'posters');
      if (response.isOk) {
        ApiResponse<List<Poster>> apiResponse =
            ApiResponse<List<Poster>>.fromJson(
                response.body,
                (json) => (json as List)
                    .map((item) => Poster.fromJson(item))
                    .toList());
        _allPosters = apiResponse.data ?? [];
        _filteredPosters = List.from(_allPosters);
        notifyListeners();
        if (showSnack) SnackBarHelper.showSuccessSnackBar(apiResponse.message);
        return _allPosters; // Trả về danh sách các danh mục đã tải
      }
    } catch (e) {
      if (showSnack) SnackBarHelper.showErrorSnackBar(e.toString());
      rethrow; // Nếu muốn vẫn giữ lại lỗi ngoại lệ
    }
    return []; // Trả về danh sách rỗng nếu không có dữ liệu hoặc xảy ra lỗi
  }

  void filterPosters(String keyword) {
    if (keyword.isEmpty) {
      _filteredPosters = List.from(_allPosters);
    } else {
      final lowerKeyword = keyword.toLowerCase();
      _filteredPosters = _allPosters.where((poster) {
        return (poster.posterName ?? '').toLowerCase().contains(lowerKeyword);
      }).toList();
    }
    notifyListeners();
  }

  Future<List<Category>> getAllCategory({bool showSnack = false}) async {
    try {
      Response response = await service.getItems(endpointUrl: 'categories');
      if (response.isOk) {
        ApiResponse<List<Category>> apiResponse =
            ApiResponse<List<Category>>.fromJson(
                response.body,
                (json) => (json as List)
                    .map((item) => Category.fromJson(item))
                    .toList());
        _allCategories = apiResponse.data ?? [];
        _filteredCategories = List.from(_allCategories);
        notifyListeners();
        if (showSnack) SnackBarHelper.showSuccessSnackBar(apiResponse.message);
        return _allCategories; // Trả về danh sách các danh mục đã tải
      }
    } catch (e) {
      if (showSnack) SnackBarHelper.showErrorSnackBar(e.toString());
      rethrow; // Nếu muốn vẫn giữ lại lỗi ngoại lệ
    }
    return []; // Trả về danh sách rỗng nếu không có dữ liệu hoặc xảy ra lỗi
  }

  void filterCategories(String keyword) {
    if (keyword.isEmpty) {
      _filteredCategories = List.from(_allCategories);
    } else {
      final lowerKeyword = keyword.toLowerCase();
      _filteredCategories = _allCategories.where((category) {
        return (category.name ?? '').toLowerCase().contains(lowerKeyword);
      }).toList();
    }
    notifyListeners();
  }

  Future<List<SubCategory>> getAllSubCategory({bool showSnack = false}) async {
    try {
      Response response = await service.getItems(endpointUrl: 'subcategories');
      if (response.isOk) {
        ApiResponse<List<SubCategory>> apiResponse =
            ApiResponse<List<SubCategory>>.fromJson(
                response.body,
                (json) => (json as List)
                    .map((item) => SubCategory.fromJson(item))
                    .toList());
        _allSubCategories = apiResponse.data ?? [];
        _filteredSubCategories = List.from(_allSubCategories);
        notifyListeners();
        if (showSnack) SnackBarHelper.showSuccessSnackBar(apiResponse.message);
        return _allSubCategories; // Trả về danh sách các danh mục đã tải
      }
    } catch (e) {
      if (showSnack) SnackBarHelper.showErrorSnackBar(e.toString());
      rethrow; // Nếu muốn vẫn giữ lại lỗi ngoại lệ
    }
    return []; // Trả về danh sách rỗng nếu không có dữ liệu hoặc xảy ra lỗi
  }

  void filterSubCategories(String keyword) {
    if (keyword.isEmpty) {
      _filteredSubCategories = List.from(_allSubCategories);
    } else {
      final lowerKeyword = keyword.toLowerCase();
      _filteredSubCategories = _allSubCategories.where((subcategory) {
        return (subcategory.name ?? '').toLowerCase().contains(lowerKeyword);
      }).toList();
    }
    notifyListeners();
  }

  Future<List<Brand>> getAllBrands({bool showSnack = false}) async {
    try {
      Response response = await service.getItems(endpointUrl: 'brands');
      if (response.isOk) {
        ApiResponse<List<Brand>> apiResponse =
            ApiResponse<List<Brand>>.fromJson(
                response.body,
                (json) => (json as List)
                    .map((item) => Brand.fromJson(item))
                    .toList());
        _allBrands = apiResponse.data ?? [];
        _filteredBrands = List.from(_allBrands);
        notifyListeners();
        if (showSnack) SnackBarHelper.showSuccessSnackBar(apiResponse.message);
        return _allBrands; // Trả về danh sách các danh mục đã tải
      }
    } catch (e) {
      if (showSnack) SnackBarHelper.showErrorSnackBar(e.toString());
      rethrow; // Nếu muốn vẫn giữ lại lỗi ngoại lệ
    }
    return []; // Trả về danh sách rỗng nếu không có dữ liệu hoặc xảy ra lỗi
  }

  void filterBrands(String keyword) {
    if (keyword.isEmpty) {
      _filteredBrands = List.from(_allBrands);
    } else {
      final lowerKeyword = keyword.toLowerCase();
      _filteredBrands = _allBrands.where((brand) {
        return (brand.name ?? '').toLowerCase().contains(lowerKeyword);
      }).toList();
    }
    notifyListeners();
  }

  Future<void> getAllProducts({bool showSnack = false}) async {
    try {
      Response response = await service.getItems(endpointUrl: 'products');
      if (response.isOk) {
        ApiResponse<List<Product>> apiResponse =
            ApiResponse<List<Product>>.fromJson(
                response.body,
                (json) => (json as List)
                    .map((item) => Product.fromJson(item))
                    .toList());
        _allProducts = apiResponse.data ?? [];
        _filteredProducts = List.from(_allProducts);
        notifyListeners();
        if (showSnack) SnackBarHelper.showSuccessSnackBar(apiResponse.message);
      }
    } catch (e) {
      if (showSnack) SnackBarHelper.showErrorSnackBar(e.toString());
      rethrow; // Nếu muốn vẫn giữ lại lỗi ngoại lệ
    }
    // Trả về danh sách rỗng nếu không có dữ liệu hoặc xảy ra lỗi
  }

  void filterProducts(String keyword) {
    if (keyword.isEmpty) {
      _filteredProducts = List.from(_allProducts);
    } else {
      final lowerKeyword = keyword.toLowerCase();

      _filteredProducts = _allProducts.where((product) {
        final productNameContainsKeyword =
            (product.name ?? '').toLowerCase().contains(lowerKeyword);
        final categorynameContainsKeyword = product.proSubCategoryId?.name
                ?.toLowerCase()
                .contains(lowerKeyword) ??
            false;
        final subCategoryNameContainsKeyword = product.proSubCategoryId?.name
                ?.toLowerCase()
                .contains(lowerKeyword) ??
            false;

        return productNameContainsKeyword ||
            categorynameContainsKeyword ||
            subCategoryNameContainsKeyword;
      }).toList();
    }
  }

  Future<void> getAllOrders() async {
    try {
      final response = await service.getItems(endpointUrl: 'orders');
      if (response.statusCode == 200) {
        List<dynamic> responseBody = response.body;
        _allOrders = responseBody.map((item) => Order.fromJson(item)).toList();
        _filteredOrders = _allOrders;
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching orders: $e');
    }
  }

  // Phương thức lọc danh mục con theo categoryId
  Future<List<Variant>> getAllVariants({bool showSnack = false}) async {
    try {
      Response response = await service.getItems(endpointUrl: 'variants');
      if (response.isOk) {
        ApiResponse<List<Variant>> apiResponse =
            ApiResponse<List<Variant>>.fromJson(
                response.body,
                (json) => (json as List)
                    .map((item) => Variant.fromJson(item))
                    .toList());
        _allVariants = apiResponse.data ?? [];
        _filteredVariants = List.from(_allVariants);
        notifyListeners();
        if (showSnack) SnackBarHelper.showSuccessSnackBar(apiResponse.message);
        return _allVariants; // Trả về danh sách các variants đã tải
      }
    } catch (e) {
      if (showSnack) SnackBarHelper.showErrorSnackBar(e.toString());
      rethrow; // Nếu muốn vẫn giữ lại lỗi ngoại lệ
    }
    return []; // Trả về danh sách rỗng nếu không có dữ liệu hoặc xảy ra lỗi
  }

  void filterVariants(String keyword) {
    if (keyword.isEmpty) {
      _filteredVariants = List.from(_allVariants);
    } else {
      final lowerKeyword = keyword.toLowerCase();
      _filteredVariants = _allVariants.where((variant) {
        return (variant.name ?? '').toLowerCase().contains(lowerKeyword);
      }).toList();
    }
    notifyListeners();
  }

  // Phương thức tính tỷ lệ chiết khấu
  double calculateDiscountPercentage(num originalPrice, num? discountedPrice) {
    if (originalPrice <= 0) {
      throw ArgumentError('Original price must be greater than zero.');
    }

    num finalDiscountedPrice = discountedPrice ?? originalPrice;

    if (finalDiscountedPrice > originalPrice) {
      return originalPrice.toDouble();
    }

    double discount =
        ((originalPrice - finalDiscountedPrice) / originalPrice) * 100;

    return discount;
  }
}
