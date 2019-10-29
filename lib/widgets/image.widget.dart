import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageNet extends StatelessWidget {
  const ImageNet({
    Key key,
    @required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return url != null ? Image.network(url, width: ScreenUtil().setWidth(375),height: ScreenUtil().setHeight(360)) : Image.network('assets/images/bg.png') ;
  }
}