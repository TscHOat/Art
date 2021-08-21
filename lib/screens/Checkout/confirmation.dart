import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:skripsian/models/CheckoutModel.dart';

class SuccessPage extends StatelessWidget {
  final CheckoutModel data;
  const SuccessPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Column(
                  children: [
                    Icon(
                      EvaIcons.checkmarkCircleOutline,
                      size: 70,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Order Successfull"),
                  ],
                ),
              ),
              Divider(),
              Container(
                child: Center(
                  child: Text(
                    "Recipt",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var item in data.items)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(item.productDetails.title),
                          Text(item.productDetails.type),
                        ],
                      )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Payment Method"),
                    Text("Debit Card"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                            "Shipping",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "ARt Express",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(data.fullName),
                    Text(data.phoneNumber),
                    Text(data.address),
                    Text(data.country),
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    NumberFormat.simpleCurrency(
                      name: 'Rp.',
                    ).format(data.getTotalPrice()),
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    SystemChrome.setEnabledSystemUIOverlays([]);
                    Navigator.pop(context);
                  },
                  child: Text("Checkout"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    primary: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
