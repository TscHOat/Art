import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.black,
      child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Status",
                            style: TextStyle(fontSize: 11),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Success",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Total",
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Rp. 5.000.000",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Date Transaction",
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Friday, 07/02/2021",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Payment",
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "BCA - Credit Card",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // alignment: Alignment.topRight,
                            child: Text(
                              "Address",
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Jl Matahari No 30. Meruya. Jakarta Barat \nDKI Jakarta",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                height: 110,
                child: Row(
                  children: [
                    Container(
                      child: Image.network(
                          "http://192.168.1.7:8000" + "/images/IMG_7155.JPG"),
                      width: 140,
                      height: 110,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: Text(
                              "Sudut Kota",
                              style: TextStyle(fontSize: 11),
                            )),
                            Container(
                                child: Text("Oil on Canvas | 60 x 70cm | 2020",
                                    style: TextStyle(fontSize: 11))),
                            Container(
                                child: Text("By Atika Haryadi",
                                    style: TextStyle(fontSize: 11))),
                            Expanded(
                                child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Text("Rp 5.000.000"),
                            ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
