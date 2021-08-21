import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsian/models/Painting.dart';
import 'package:skripsian/providers/cart_providers.dart';

class AddToCartButton extends StatefulWidget {
  final Painting painting;
  const AddToCartButton({Key? key, required this.painting}) : super(key: key);

  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  @override
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, _) {
        bool temp;
        // print(
        //     "${cartProvider.getSpecificItemFromCartProvider(widget.painting.id)}" ==
        //         "null");
        if ("${cartProvider.getSpecificItemFromCartProvider(widget.painting.id)}" ==
            "null")
          temp = true;
        else
          temp = false;
        return ElevatedButton(
          onPressed: () {
            if (temp)
              cartProvider.addToCart(widget.painting);
            else
              cartProvider.deleteItemFromCart(cartProvider
                      .findItemIndexFromCartProvider(widget.painting.id) ??
                  -1);
          },
          // onPressed: _isInCart != 0
          //     ? null
          //     : () {
          //         _cartProvider.addToCart(widget.item);
          //         setState(() {});
          //       },
          child: Text(temp ? "Add to bag" : "remove from bag"),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            primary: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
        );
      },
    );
  }
}
