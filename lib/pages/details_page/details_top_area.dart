import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/details_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsInfo=Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodInfo;
    return Container(
      color: Colors.white,
      child: Column(children: <Widget>[
        // _goodsImage(),
      ],),
    );
  }

  // 商品图片
  Widget _goodsImage(url) {
    return Image.network(url, width: ScreenUtil().setWidth(750));
  }
}