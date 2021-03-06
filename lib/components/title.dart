import 'package:flutter/material.dart';
import 'package:flutter_shop/res/resources.dart';
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
          top: BorderSide(width: 0.5, color: Colours.line ),
          bottom: BorderSide(width: 0.5, color: Colours.line)
        ) 
      ),
      child: Text(title, style: TextStyles.textBold18),
    );
  }
}