import 'package:flutter/material.dart';

class GoldenCard extends StatefulWidget {
  @override
  _GoldenCardState createState() => _GoldenCardState();
}

class _GoldenCardState extends State<GoldenCard> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(180, 40, 45, 1),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                    Navigator.pop(context);
                }),
            title: Text("回馈金卡"), 
            centerTitle: true),
        body: Container(
          child: Center(child: Text('回馈金卡'),)
        )
    );
  }
}

