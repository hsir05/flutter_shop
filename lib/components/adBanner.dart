import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdBanner extends StatelessWidget {
  final String advertesPicture;
  AdBanner({Key key, this.advertesPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Image.network(advertesPicture,),
    );
  }
}
