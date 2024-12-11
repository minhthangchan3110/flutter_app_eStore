import 'dart:developer';
import 'package:flutter_cart/flutter_cart.dart';

import '../../../services/http_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../core/data/data_provider.dart';

import '../../../utility/constants.dart';
import '../../../utility/snack_bar_helper.dart';

class CartProvider extends ChangeNotifier {
  HttpService service = HttpService();
  final box = GetStorage();
  // final UserProvider _userProvider;
  var flutterCart = FlutterCart();
  List<CartModel> myCartItems = [];

  final GlobalKey<FormState> buyNowFormKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController couponController = TextEditingController();
  bool isExpanded = false;

  // Coupon? couponApplied;
  // double couponCodeDiscount = 0;

  // CartProvider(this._userProvider);

  //TODO: should complete updateCart

  //TODO: should complete getCartSubTotal

  //TODO: should complete getGrandTotal

  //TODO: should complete getCartItems

  //TODO: should complete clearCartItems

  //TODO: should complete checkCoupon

  //TODO: should complete getCouponDiscountAmount

  //TODO: should complete submitOrder

  //TODO: should complete addOrder

  //TODO: should complete cartItemToOrderItem

  clearCouponDiscount() {
    // couponApplied = null;
    // couponCodeDiscount = 0;
    couponController.text = '';
    notifyListeners();
  }

  void retrieveSavedAddress() {
    phoneController.text = box.read(PHONE_KEY) ?? '';
    streetController.text = box.read(STREET_KEY) ?? '';
    cityController.text = box.read(CITY_KEY) ?? '';
    stateController.text = box.read(STATE_KEY) ?? '';
    postalCodeController.text = box.read(POSTAL_CODE_KEY) ?? '';
    countryController.text = box.read(COUNTRY_KEY) ?? '';
  }

  void updateUI() {
    notifyListeners();
  }
}
