import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './title.dart';

class Special extends StatelessWidget {
  final List specialList;
  Special({Key key, this.specialList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = '特约商品';
    return Container(
      height: ScreenUtil().setHeight(380),
      margin: EdgeInsets.only(top:10.0),
      child: Column(children: <Widget>[
        // _titleWidget(),
        TitleWidget(title:title),
        _specialList()
      ],),
    );
  }

  //推荐商品标题
  // Widget _titleWidget() {
  //   return Container(
  //     alignment: Alignment.centerLeft,
  //     padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       border: Border(
  //         bottom: BorderSide(width: 0.5, color: Colors.black12)
  //       )
  //     ),
  //     child: Text('特约商品', style: TextStyle(color: Colors.pink)),
  //   );
  // }

  // 推荐商品
  Widget _item(index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 0.5, color: Colors.black12)
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(specialList[index]['listPicUrl']),
            Text('￥${specialList[index]['actualPrice']}'),
            Text('￥${specialList[index]['retailPrice']}', style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),)
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