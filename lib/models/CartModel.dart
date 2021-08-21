import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:skripsian/models/Painting.dart';

class CartModel extends ChangeNotifier {
  final List<Painting> _items = [];
  UnmodifiableListView<Painting> get items => UnmodifiableListView(_items);

  int get totalPrice => getTotalPrice();

  int getTotalPrice() {
    int _total_price = 0;
    for (var item in this._items) {
      _total_price += item.price;
    }
    return _total_price;
  }

  void add(Painting item) {
    _items.add(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
