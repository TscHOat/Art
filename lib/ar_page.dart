import 'dart:convert';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:skripsian/models/Painting.dart';

class ARPage extends StatefulWidget {
  final Painting painting;
  ARPage({Key? key, required this.painting}) : super(key: key);
  // final String title;

  @override
  _ARPageState createState() => _ARPageState();
}

class _ARPageState extends State<ARPage> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  late UnityWidgetController _unityWidgetController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: Icon(
            EvaIcons.arrowCircleLeftOutline,
          ),
          iconSize: 30,
        ),
        elevation: 0.0,
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            UnityWidget(
              fullscreen: false,
              onUnityCreated: onUnityCreated,
              onUnitySceneLoaded: onUnitySceneLoaded,
            ),
          ],
        ),
      ),
    );
  }

  void setLukisan() {
    this._unityWidgetController.postMessage(
          'InputManager',
          'setLukisan',
          jsonEncode(
            {
              'width': widget.painting.width.toString(),
              "height": widget.painting.height.toString(),
              "link": widget.painting.link
            },
          ),
        );
  }

  void onUnitySceneLoaded(SceneLoaded? sceneInfo) {
    setLukisan();
  }

  void onUnityCreated(controller) {
    this._unityWidgetController = controller;
    setLukisan();
  }
}
