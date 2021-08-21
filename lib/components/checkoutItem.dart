import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skripsian/models/Painting.dart';

class CheckoutItem extends StatelessWidget {
  final Painting painting;
  const CheckoutItem({Key? key, required this.painting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 122,
        padding: EdgeInsets.all(20),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              painting.link,
              width: 103,
              height: 83,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      [painting.title].join(),
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      [painting.artist].join(),
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      [
                        painting.type,
                        (painting.height.toString() +
                            "x" +
                            painting.width.toString() +
                            " cm"),
                        painting.year,
                      ].join(" | "),
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(NumberFormat.simpleCurrency(
                          name: 'Rp.',
                        ).format(painting.price)),
                      ),
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
