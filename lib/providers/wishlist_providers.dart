import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:skripsian/models/Painting.dart';

class WishlistProvder extends ChangeNotifier {
  final List<Painting> _items = [];
  List<Painting> get items => _items;
  // WishlistProvder(this._items);
  void addItem(Painting item) async {
    _items.add(item);
    notifyListeners();
  }

  void removeItems() async {
    _items.clear();
    notifyListeners();
  }

  void removeItem(id) async {
    _items.asMap().forEach((key, value) {
      if (value.id == id) {
        _items.removeAt(key);
        notifyListeners();
      }
    });
  }

  bool isOnWishlist(id) {
    for (var item in _items) if (item.id == id) return true;
    return false;
  }

  Painting? getItem(int id) {
    for (var item in _items) if (item.id == id) return item;
    return null;
  }

  List<Painting> getItems() => _items;

  int? getTotalItem() {
    return _items.length;
  }

  double? getTotalAmount() {
    double totalAmount = 0.0;
    for (var item in _items) totalAmount += item.price;
    return totalAmount;
  }
}
