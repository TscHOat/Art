import 'package:flutter_cart/model/cart_model.dart';
import 'package:skripsian/models/Painting.dart';

class CheckoutModel {
  final List<CartItem> items;
  late String fullName;
  late String phoneNumber;
  late String email;
  late String country;
  late String address;
  late String cardNumber;
  late String nameOnCard;
  CheckoutModel(this.items);
  int getTotalPrice() {
    int _total_price = 0;
    for (var item in this.items) {
      int _temp = item.productDetails.price;
      _total_price += _temp;
    }
    return _total_price;
  }
}
