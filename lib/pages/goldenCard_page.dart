import 'package:flutter/material.dart';
import './location.screen.dart';

class GoldenCard extends StatefulWidget {
  @override
  _GoldenCardState createState() => _GoldenCardState();
}

class _GoldenCardState extends State<GoldenCard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(180, 40, 45, 1),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                tooltip: 'search',
                onPressed: () {
                    Navigator.pop(context);
                }),
            title: Text("回馈金卡"), 
            centerTitle: true),
        body: LocationDemo()
    );
  }
}

