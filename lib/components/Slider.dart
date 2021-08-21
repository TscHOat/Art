import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skripsian/models/HotItem.dart';
import 'package:skripsian/models/Painting.dart';
import 'package:skripsian/network_utils/api.dart';

class HotItemSlider extends StatefulWidget {
  const HotItemSlider({Key? key}) : super(key: key);

  @override
  _HotItemSliderState createState() => _HotItemSliderState();
}

class _HotItemSliderState extends State<HotItemSlider> {
  Future<List<Painting>> _getHotItems() async {
    var data = await Network().getData('/getHotItem');
    var jsonData = json.decode(data.body);
    List<Painting> hotItems = [];
    for (var hotItem in jsonData)
      hotItems.add(Painting.getDataFromJson(hotItem));
    return hotItems;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getHotItems(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null)
          return Container(
            height: 250,
            color: Colors.black,
            child: Center(
              child: Text('Loading...'),
            ),
          );
        else {
          return CarouselSlider(
            items: [
              for (var item in snapshot.data)
                Container(
                  child: Image.network(
                    item.link,
                    fit: BoxFit.cover,
                  ),
                )
            ],
            options: CarouselOptions(
              height: 250.0,
              disableCenter: true,
            ),
          );
        }
      },
    );
  }
}
