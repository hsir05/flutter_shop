import 'package:flutter/material.dart';
import 'package:flutter_shop/res/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './title.dart';

class Special extends StatelessWidget {
  final List specialList;
  Special({Key key, this.specialList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = '限时抢购';
    return Container(
      height: ScreenUtil().setHeight(470),
      margin: EdgeInsets.only(top:10.0),
      child: Column(children: <Widget>[
        TitleWidget(title:title),
        _specialList() 
      ],),
    );
  }

  // 限时抢购
  Widget _item(index) {
    return InkWell(
      onTap: () {},
      child: Container(
        // height: ScreenUtil().setHeight(400),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 0.5, color: Colours.line)
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(specialList[index]['listPicUrl'], height: ScreenUtil().setHeight(220),),
            Row(children: <Widget>[
              Text('￥${specialList[index]['actualPrice']}'),
              Text('￥${specialList[index]['retailPrice']}', style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),)
            ],)
          ],
        ),
      ),
    );
  }

  // 横向列表
  Widget _specialList() {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specialList.length,
        itemBuilder: (context, index) {
          return _item(index);
        },
      ),
    );
  }
}