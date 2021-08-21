import 'package:flutter/material.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:flutter_cart/model/cart_response_wrapper.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:skripsian/models/Painting.dart';

class CartProvider extends ChangeNotifier {
  var flutterCart = FlutterCart();
  late CartResponseWrapper cartResponseWrapper;
  addToCart(Painting _productElement, {int funcQuantity = 0}) async {
    cartResponseWrapper = flutterCart.addToCart(
        productId: _productElement.id,
        unitPrice: _productElement.price,
        productName: _productElement.title,
        quantity: funcQuantity == 0 ? 1 : funcQuantity,
        productDetailsObject: _productElement);
    notifyListeners();
  }

  bool cartIsEmpty() {
    return flutterCart.cartItem.length == 0;
  }

  deleteItemFromCart(int index) async {
    cartResponseWrapper = flutterCart.deleteItemFromCart(index);
    notifyListeners();
  }

  decrementItemFromCartProvider(int index) async {
    cartResponseWrapper = flutterCart.decrementItemFromCart(index);
    notifyListeners();
  }

  int? findItemIndexFromCartProvider(cartId) {
    int? index = flutterCart.findItemIndexFromCart(cartId);
    return index;
  }

  CartItem? getSpecificItemFromCartProvider(id) {
    CartItem? cartItem = flutterCart.getSpecificItemFromCart(id);
    // if (cartItem != null) {
    //   print(
    //       "Name ${cartItem.productDetails.name} Quantity ${cartItem.quantity}");
    //   return cartItem;
    // }
    return cartItem;
  }

  List<CartItem> getCartItems() {
    return flutterCart.cartItem;
  }

  printCartValue() {
    flutterCart.cartItem.forEach((f) => {
          print(f.productId),
          print(f.quantity),
        });
  }

  deleteAllCartProvider() {
    flutterCart.deleteAllCart();
  }

  double? getTotalAmount() {
    return flutterCart.getTotalAmount() ?? 0;
  }

  int? getTotalItem() {
    return flutterCart.getCartItemCount() ?? 0;
  }
}
