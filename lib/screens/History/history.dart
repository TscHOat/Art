import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:skripsian/screens/History/historyCard.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Image.asset('assets/HeaderHistory.png'),
        ),
      ),
      body: Container(
        child: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              ListTile(
                title: HistoryCard(),
              ),
              ListTile(
                title: HistoryCard(),
              ),
              ListTile(
                title: HistoryCard(),
              ),
              ListTile(
                title: HistoryCard(),
              ),
            ],
          ).toList(),
        ),
      ),
    );
  }
}
