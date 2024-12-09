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

  DataProvider() {
    // Gọi các phương thức để tải dữ liệu ban đầu nếu cần
    getAllPosters();
    getAllCategories();
    getAllProducts();
    // Các phương thức khác cần thiết có thể gọi ở đây
  }

  Future<void> getAllPosters() async {
    try {
      final response = await service.getItems(endpointUrl: 'posters');
      if (response.statusCode == 200) {
        // Kiểm tra xem body có phải là Map hay không
        if (response.body is Map<String, dynamic>) {
          // Truy xuất mảng 'data' từ đối tượng JSON trả về
          var responseBody = response.body['data'];

          // Chuyển đổi mảng thành List<Poster>
          _allPosters = List<Poster>.from(
              responseBody.map((item) => Poster.fromJson(item)));
          _filteredPosters = _allPosters;
          notifyListeners();
        } else {
          print('Unexpected response format');
        }
      }
    } catch (e) {
      print('Error fetching posters: $e');
    }
  }

  Future<void> getAllCategories() async {
    try {
      final response = await service.getItems(endpointUrl: 'categories');
      if (response.statusCode == 200) {
        // Parse JSON body
        var responseBody = response.body;

        if (responseBody is Map<String, dynamic> &&
            responseBody.containsKey('data')) {
          List<dynamic> data = responseBody['data'];

          _allCategories = data.map((item) => Category.fromJson(item)).toList();
          _filteredCategories = _allCategories;
          notifyListeners();
        } else {
          print('Unexpected response format for categories');
        }
      } else {
        print('Failed to fetch categories: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  Future<void> getAllSubCategories() async {
    try {
      final response = await service.getItems(endpointUrl: 'sub-categories');
      if (response.statusCode == 200) {
        List<dynamic> responseBody = response.body;
        _allSubCategories =
            responseBody.map((item) => SubCategory.fromJson(item)).toList();
        _filteredSubCategories = _allSubCategories;
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching sub-categories: $e');
    }
  }

  Future<void> getAllBrands() async {
    try {
      final response = await service.getItems(endpointUrl: 'brands');
      if (response.statusCode == 200) {
        List<dynamic> responseBody = response.body;
        _allBrands = responseBody.map((item) => Brand.fromJson(item)).toList();
        _filteredBrands = _allBrands;
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching brands: $e');
    }
  }

  Future<void> getAllProducts() async {
    try {
      final response = await service.getItems(endpointUrl: 'products');
      if (response.statusCode == 200) {
        // Parse JSON body
        var responseBody = response.body;

        if (responseBody is Map<String, dynamic> &&
            responseBody.containsKey('data')) {
          List<dynamic> data = responseBody['data'];

          // Ánh xạ từng item trong mảng 'data' thành Product
          _allProducts = data.map((item) => Product.fromJson(item)).toList();
          _filteredProducts = _allProducts;
          notifyListeners();
        } else {
          print('Unexpected response format for products');
        }
      } else {
        print('Failed to fetch products: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching products: $e');
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

  // Phương thức để tính tỷ lệ chiết khấu
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

  // Các phương thức lọc (filter) có thể được thêm sau nếu cần
  // Ví dụ filterCategories, filterSubCategories, filterBrands...
}
