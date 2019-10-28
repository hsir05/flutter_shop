import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  TitleWidget({Key key, this.title}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
      ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
      return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(width: 0.5, color: Colors.black12),
          bottom: BorderSide(width: 0.5, color: Colors.black12)
        )
      ),
      child: Text(title, style: TextStyle(color: Colors.black87, fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.w700)),
    );
  }
}