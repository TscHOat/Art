import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skripsian/components/ItemGrid.dart';
import 'package:skripsian/models/Painting.dart';
import 'package:skripsian/network_utils/api.dart';

class ListItem extends StatefulWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  Future<List<Painting>> _getPaintings() async {
    var data = await Network().getData('/getPaintings');
    var jsonData = json.decode(data.body);
    List<Painting> paintings = [];
    for (var painting in jsonData) {
      paintings.add(Painting.getDataFromJson(painting));
    }
    return paintings;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getPaintings(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null)
            return Expanded(
              child: Text('Loading...'),
            );
          else
            return Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 5,
                childAspectRatio: 1,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                children: [
                  for (var item in snapshot.data) ItemGrid(item: item),
                ],
              ),
            );
        });
  }
}
