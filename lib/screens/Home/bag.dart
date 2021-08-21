import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skripsian/components/cartItem.dart';
import 'package:skripsian/models/CheckoutModel.dart';
import 'package:skripsian/providers/cart_providers.dart';
import 'package:skripsian/screens/Checkout/shipping.dart';

class Bag extends StatefulWidget {
  const Bag({Key? key}) : super(key: key);

  @override
  _BagState createState() => _BagState();
}

class _BagState extends State<Bag> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Center(
          child: Image.asset('assets/HeaderBag.png'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 500,
              child: Consumer<CartProvider>(
                builder: (context, cartProvider, _) => ListView(
                  children: [
                    for (var item in cartProvider.getCartItems())
                      CartItemComponent(item: item),
                  ],
                ),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Consumer<CartProvider>(
                builder: (context, cartProvider, _) {
                  cartProvider.printCartValue();
                  return Row(
                    children: [
                      Expanded(
                        child: Text(
                            "Sub-total (${cartProvider.getTotalItem().toString()} item)"),
                      ),
                      Text(
                        NumberFormat.simpleCurrency(
                          name: 'Rp.',
                        ).format(
                          cartProvider.getTotalAmount(),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Row(
                children: [
                  Icon(EvaIcons.carOutline),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shiping Cost",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "From ARt",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "Free delivery",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: Text("Total"),
                        ),
                        Consumer<CartProvider>(
                          builder: (context, cartProvider, _) => Text(
                            NumberFormat.simpleCurrency(
                              name: 'Rp.',
                            ).format(
                              cartProvider.getTotalAmount(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Consumer<CartProvider>(
                      builder: (context, cartProvider, _) {
                        return ElevatedButton(
                          onPressed: () {
                            if (!cartProvider.cartIsEmpty())
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckoutPage(
                                    data: new CheckoutModel(
                                      cartProvider.getCartItems(),
                                    ),
                                  ),
                                ),
                              );
                          },
                          child: Text("Checkout"),
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
