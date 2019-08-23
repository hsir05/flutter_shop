import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloorContent extends StatelessWidget {
  final List floorGoodsList;
  FloorContent({Key key, this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      child: Column(
        children: <Widget>[
            // _firstRow(),
            _otherGoods(),
        ],
      ),
    );
  }

  Widget _firstRow() {
    return Row(children: <Widget>[
      _goodsItem(floorGoodsList[0]),
      Column(children: <Widget>[
         _goodsItem(floorGoodsList[1]),
        _goodsItem(floorGoodsList[2]),
      ],)
    ],);
  }

  Widget _otherGoods() {
    return Row(children: <Widget>[
      _goodsItem(floorGoodsList[0]),
      _goodsItem(floorGoodsList[1]),
      // _goodsItem(floorGoodsList[4])
    ],);
  }

  Widget _goodsItem(Map goods) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: (){print('你点击楼层');},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Image.network(goods['primaryPicUrl'], height: ScreenUtil().setHeight(365),),
          Padding(
            padding: EdgeInsets.only(left:10.0, top: 10.0, bottom: 10.0),
            child: Text(goods['name'], maxLines:1, overflow: TextOverflow.ellipsis,),
          ),
          Padding(
            padding: EdgeInsets.only(left:10.0, bottom: 10.0),
            child: Text('¥${goods['retailPrice']}'),
          )
        ],),
      ),
    );
  }

}


