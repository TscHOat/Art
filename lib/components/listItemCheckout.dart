import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsian/components/checkoutItem.dart';
import 'package:skripsian/providers/cart_providers.dart';

class ListItemCheckout extends StatelessWidget {
  const ListItemCheckout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<CartProvider>(
        builder: (context, cartProvider, _) {
          return Column(
            children: [
              // Card(
              //   child: Text("text"),
              // ),
              for (var item in cartProvider.getCartItems())
                CheckoutItem(painting: item.productDetails),
            ],
          );
        },
      ),
    );
  }
}
