import 'package:flutter/material.dart';
import 'package:skripsian/models/Painting.dart';
import 'package:intl/intl.dart';
import 'package:skripsian/screens/detail_item.dart';

class ItemGrid extends StatelessWidget {
  final Painting item;
  const ItemGrid({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              child: AspectRatio(
                aspectRatio: 3 / 2,
                child: Image.network(
                  item.link,
                  fit: BoxFit.cover,
                  height: 100,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: RichText(
                textAlign: TextAlign.left,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                strutStyle: StrutStyle(fontSize: 17),
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 17),
                  text: item.title,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                NumberFormat.simpleCurrency(
                  name: 'Rp.',
                ).format(item.price),
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailItemPage(painting: item),
            ),
          );
        },
      ),
      // color: Colors.yellowAccent,
    );
  }
}
