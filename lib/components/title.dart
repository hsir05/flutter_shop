import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  TitleWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black12)
        )
      ),
      child: Text(title, style: TextStyle(color: Colors.pink)),
    );
  }
}