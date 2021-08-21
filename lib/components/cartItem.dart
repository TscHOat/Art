import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skripsian/providers/cart_providers.dart';

class CartItemComponent extends StatelessWidget {
  final CartItem item;
  const CartItemComponent({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Image.network(
            item.productDetails.link,
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
                  item.productDetails.title,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
                Text(
                  [
                    item.productDetails.type,
                    ("${item.productDetails.height} x ${item.productDetails.width}"),
                    item.productDetails.year
                  ].join(" | "),
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  NumberFormat.simpleCurrency(
                    name: 'Rp.',
                  ).format(item.productDetails.price),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Consumer<CartProvider>(
                      builder: (context, cartProvider, _) {
                        return IconButton(
                          icon: Icon(EvaIcons.trashOutline),
                          onPressed: () {
                            cartProvider.deleteItemFromCart(
                              cartProvider.findItemIndexFromCartProvider(
                                      item.productDetails.id) ??
                                  -1,
                            );
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
