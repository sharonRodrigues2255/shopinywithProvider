import 'package:flutter/material.dart';
import 'package:shoppingprovider/model/cart_model.dart';

class CartController extends ChangeNotifier {
  List<CartModel> cartItemLIst = [];

  int quantity = 1;

  addquantity() {
    quantity = quantity + 1;
    notifyListeners();
  }

  subsquantity() {
    if (quantity > 1) {
      quantity = quantity - 1;
    }
    notifyListeners();
  }

  addtoCart(CartModel value) {
    cartItemLIst.add(value);
    notifyListeners();
  }

  removeFromCart(int index) {
    cartItemLIst.removeAt(index);
    notifyListeners();
  }
}
