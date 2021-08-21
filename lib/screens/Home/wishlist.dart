import 'package:flutter/material.dart';
import 'package:skripsian/components/wishlistItem.dart';

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
        child: ListView(
          children: [
            WishlistItem(),
            WishlistItem(),
            WishlistItem(),
          ],
        ),
      ),
    );
  }
}
