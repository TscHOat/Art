import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsian/components/wishlistItem.dart';
import 'package:skripsian/providers/wishlist_providers.dart';

class Wishlist extends StatefulWidget {
  Wishlist({Key? key}) : super(key: key);
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Center(
          child: Image.asset('assets/HeaderWishlist.png'),
        ),
      ),
      body: Container(
        child: Consumer<WishlistProvder>(
            builder: (context, wishlistProvider, child) => ListView(
                  children: [
                    for (var item in wishlistProvider.getItems())
                      WishlistItem(item: item),
                  ],
                )),
      ),
    );
  }
}
