import 'dart:developer';
import '../../../models/coupon.dart';
import '../../login_screen/provider/user_provider.dart';
import '../../../services/http_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/data/data_provider.dart';

import '../../../utility/constants.dart';
import '../../../utility/snack_bar_helper.dart';

class CartProvider extends ChangeNotifier {
  HttpService service = HttpService();
  final box = GetStorage();

  final UserProvider _userProvider;
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

  Coupon? couponApplied;
  double couponCodeDiscount = 0;
  String selectedPaymentOption = 'prepaid';

  CartProvider(this._userProvider);
  getCartItem() {
    myCartItems = flutterCart.cartItemsList;
    notifyListeners();
  }

  //TODO: should complete updateCart
  void updateCart(CartModel cartItem, int quantity) {
    quantity = cartItem.quantity + quantity;
    flutterCart.updateQuantity(cartItem.productId, cartItem.variants, quantity);
    notifyListeners();
  }

  //TODO: should complete getCartSubTotal
  double getCartSubTotal() {
    return flutterCart.subtotal;
  }

  clearCartItem() {
    flutterCart.clearCart();
    notifyListeners();
  }
  //TODO: should complete getGrandTotal

  //TODO: should complete getCartItems

  //TODO: should complete clearCartItems

  //TODO: should complete checkCoupon

  //TODO: should complete getCouponDiscountAmount

  //TODO: should complete submitOrder

  //TODO: should complete addOrder

  //TODO: should complete cartItemToOrderItem

  clearCouponDiscount() {
    couponApplied = null;
    couponCodeDiscount = 0;
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
