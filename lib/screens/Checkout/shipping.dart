import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skripsian/components/listItemCheckout.dart';
import 'package:skripsian/models/CheckoutModel.dart';
import 'package:skripsian/screens/Checkout/components/inputField.dart';
import 'package:skripsian/screens/Checkout/components/roundedTextArea.dart';
import 'package:skripsian/screens/Checkout/payment.dart';

class CheckoutPage extends StatelessWidget {
  final CheckoutModel data;
  const CheckoutPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            SystemChrome.setEnabledSystemUIOverlays([]);
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
      body: Form(
        key: _formKey,
        child: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(13),
                  child: Center(
                    child: Text(
                      "Shipping",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                ListItemCheckout(),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      RoundedInputField(
                        text: "Full name",
                        hintText: "Add full name",
                        onChanged: (val) {
                          SystemChrome.setEnabledSystemUIOverlays(
                              [SystemUiOverlay.top]);
                        },
                        validator: (val) {
                          // if(val.isEmpty())return "Please Fill name",?
                          print("cie keluar");
                          data.fullName = val;
                        },
                      ),
                      RoundedInputField(
                        text: "Phone Number",
                        hintText: "Add phone number",
                        onChanged: (val) {},
                        validator: (val) {
                          data.phoneNumber = val;
                        },
                      ),
                      RoundedInputField(
                        text: "Email",
                        hintText: "Add email",
                        onChanged: (val) {},
                        validator: (val) {
                          data.email = val;
                        },
                      ),
                      RoundedInputField(
                        text: "Country ",
                        hintText: "Add country",
                        onChanged: (val) {},
                        validator: (val) {
                          data.country = val;
                        },
                      ),
                      RoundedTextArea(
                        hintText: "Address",
                        text: "Address",
                        onChanged: (val) {},
                        validator: (val) {
                          data.address = val;
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Shipper"),
                      SizedBox(width: 10),
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
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      SystemChrome.setEnabledSystemUIOverlays([]);
                      if (_formKey.currentState!.validate())
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentPage(data: data),
                          ),
                        );
                    },
                    child: Text("Checkout"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      primary: Colors.black,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
