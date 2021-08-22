import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skripsian/ar_page.dart';
import 'package:skripsian/components/addToCartButton.dart';
import 'package:skripsian/models/Painting.dart';
import 'package:skripsian/providers/cart_providers.dart';
import 'package:skripsian/providers/wishlist_providers.dart';

class DetailItemPage extends StatelessWidget {
  final Painting painting;
  const DetailItemPage({
    Key? key,
    required this.painting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          painting.link,
          color: Color.fromRGBO(255, 255, 255, .75),
          colorBlendMode: BlendMode.lighten,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0),
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                EvaIcons.arrowCircleLeftOutline,
                size: 40,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
            child: Column(
              children: [
                Image.network(
                  painting.link,
                  height: 225,
                  width: double.infinity,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  height: 15,
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    icon: new Image.asset('assets/icon-scan.png'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ARPage(painting: painting),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          painting.title,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          [
                            painting.type,
                            painting.height.toString() +
                                ' x ' +
                                painting.width.toString() +
                                'cm'
                          ].join(' | '),
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          [painting.artist].join(''),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 150,
                        // padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          [painting.description].join(''),
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          [
                            NumberFormat.simpleCurrency(
                              name: 'Rp.',
                            ).format(painting.price)
                          ].join(''),
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 75,
                      ),
                      Container(
                          // color: Colors.black,
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Consumer<WishlistProvder>(
                              builder: (context, wishlistProvider, child) {
                            bool isOnWishlist =
                                wishlistProvider.isOnWishlist(painting.id);
                            return SizedBox(
                              width: 50,
                              height: 50,
                              child: IconButton(
                                padding: new EdgeInsets.all(0.0),
                                onPressed: () {
                                  if (!isOnWishlist)
                                    wishlistProvider.addItem(painting);
                                  else
                                    wishlistProvider.removeItem(painting.id);
                                },
                                icon: Icon(
                                  (isOnWishlist
                                      ? EvaIcons.heart
                                      : EvaIcons.heartOutline),
                                  size: 50,
                                  color: (isOnWishlist
                                      ? Colors.red
                                      : Colors.black),
                                ),
                              ),
                            );
                          }),
                          SizedBox(
                            width: 20,
                          ),
                          Consumer<CartProvider>(
                            builder: (context, cartProvider, child) =>
                                AddToCartButton(painting: painting),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.all(25),
          ),
        )
      ],
    );
  }
}
