import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:skripsian/models/Painting.dart';

class WishlistProvder extends ChangeNotifier {
  final List<Painting> _items = [];
  UnmodifiableListView<Painting> get items => UnmodifiableListView(_items);

  void addItem(Painting item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItems() {
    _items.clear();
    notifyListeners();
  }

  void removeItem(int id) {
    _items.asMap().forEach((key, value) {
      if (value.id == id) _items.removeAt(key);
    });
    notifyListeners();
  }

  Painting? item(int id) {
    for (var item in _items) if (item.id == id) return item;
    return null;
  }
}
