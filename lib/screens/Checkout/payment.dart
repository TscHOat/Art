import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skripsian/components/listItemCheckout.dart';
import 'package:skripsian/models/CheckoutModel.dart';
import 'package:skripsian/providers/cart_providers.dart';
import 'package:skripsian/screens/Checkout/components/inputField.dart';
import 'package:skripsian/screens/Checkout/confirmation.dart';

class PaymentPage extends StatelessWidget {
  final CheckoutModel data;
  const PaymentPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            EvaIcons.arrowCircleLeftOutline,
          ),
          iconSize: 30,
        ),
        backgroundColor: Colors.black,
        title: Center(
          child: Image.asset('assets/HeaderCheckout.png'),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(13),
                child: Center(
                  child: Text(
                    "Payment",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ListItemCheckout(),
              Consumer<CartProvider>(
                builder: (context, cartProvider, _) => Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Row(children: [
                              Expanded(child: Text("Sub Total")),
                              Text(
                                NumberFormat.simpleCurrency(
                                  name: 'Rp.',
                                ).format(
                                  cartProvider.getTotalAmount(),
                                ),
                              ),
                            ]),
                            Row(children: [
                              Expanded(child: Text("Insurance")),
                              Text("-"),
                            ]),
                            Row(children: [
                              Expanded(child: Text("Delivery")),
                              Text("Free"),
                            ]),
                          ],
                        ),
                      ),
                      Divider(),
                      Row(children: [
                        Expanded(child: Text("Total")),
                        Text(
                          NumberFormat.simpleCurrency(
                            name: 'Rp.',
                          ).format(
                            cartProvider.getTotalAmount(),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
              // Divider(),
              Container(
                margin: EdgeInsets.all(20),
                child: Form(
                  child: Column(
                    children: [
                      RoundedInputField(
                        text: "Credit / debit card",
                        hintText:
                            "Add credit/debit card number           MM/YY   CVC ",
                        onChanged: (val) {},
                        validator: (val) {},
                      ),
                      RoundedInputField(
                        text: "Name on card",
                        hintText: "Add phone number",
                        onChanged: (val) {},
                        validator: (val) {},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(child: Text("Shipper")),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Icon(EvaIcons.carOutline),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ARt Express",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Free Delivery",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuccessPage(data: data),
                      ),
                      (route) => route.isFirst);
                },
                child: Text("Pay"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  primary: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
