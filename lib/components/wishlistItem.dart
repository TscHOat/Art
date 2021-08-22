import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsian/components/addToCartButton.dart';
import 'package:skripsian/models/Painting.dart';
import 'package:skripsian/providers/cart_providers.dart';
import 'package:skripsian/providers/wishlist_providers.dart';

class WishlistItem extends StatelessWidget {
  final Painting item;
  const WishlistItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Image.network(
            item.link,
            width: 160,
            height: 125,
            fit: BoxFit.cover,
            // color: Colors.black,
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 150,
            width: 225,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
                Text(
                  [item.type, ("${item.height} x ${item.width}"), item.year]
                      .join(" | "),
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Rp. 5,000,000",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Consumer<CartProvider>(
                        builder: (context, cartProvider, _) {
                          bool temp;
                          if ("${cartProvider.getSpecificItemFromCartProvider(item.id)}" ==
                              "null")
                            temp = true;
                          else
                            temp = false;
                          return ElevatedButton(
                            onPressed: () {
                              if (temp)
                                cartProvider.addToCart(item);
                              else
                                cartProvider.deleteItemFromCart(
                                    cartProvider.findItemIndexFromCartProvider(
                                            item.id) ??
                                        -1);
                            },
                            child: Text(temp ? "Add to bag" : "Remove"),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              primary: Colors.black,
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                            ),
                          );
                        },
                      ),
                      Consumer<WishlistProvder>(
                        builder: (context, wishlistProvider, child) =>
                            IconButton(
                          icon: Icon(EvaIcons.trashOutline),
                          onPressed: () {
                            wishlistProvider.removeItem(item.id);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
