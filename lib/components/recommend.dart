import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './title.dart';

class Recommend extends StatelessWidget {
  List<Map> recommendList=[];
  Recommend({Key key, this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = '推荐商品';
    return Container(
      child: Column(children: <Widget>[
        TitleWidget(title:title),
        _wrapList()
      ],),
    );
  }

  Widget _wrapList() {
    if (recommendList.length!= 0){
      List<Widget>listWidget = recommendList.map((val){
        if (val['type'] == 1) {
           return InkWell(
            onTap:(){print('点击了火爆商品');},
            child: 
            Container(
              width: ScreenUtil().setWidth(372),
              color:Colors.white,
              padding: EdgeInsets.all(5.0),
              margin:EdgeInsets.only(bottom:3.0),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(val['categoryItem']['listPicUrl'], width: ScreenUtil().setWidth(375),),
                  Text(val['categoryItem']['name'], maxLines:1, overflow:TextOverflow.ellipsis, style: TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(26))),
                  Text('￥${val['categoryItem']['retailPrice']}'),
                ])));
        }else if (val['type'] == 2)  {
           return InkWell(
            onTap:(){print('点击了火爆商品');},
            child: 
            Container(
              alignment:Alignment.centerLeft,
              width: ScreenUtil().setWidth(372),
              color:Colors.white,
              padding: EdgeInsets.all(5.0),
              margin:EdgeInsets.only(bottom:3.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(val['pinItem']['picUrl'], width: ScreenUtil().setWidth(375),),
                  Text(val['pinItem']['title'], maxLines:1, overflow:TextOverflow.ellipsis, style: TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(26))),
                  Row(
                    children: <Widget>[
                      Text('￥${val['pinItem']['price']}'),
                      Text(
                        '￥${val['pinItem']['originPrice']}',
                        style: TextStyle(color:Colors.black26,decoration: TextDecoration.lineThrough),
                      )
                    ],)
                ]))); 
        } else {
          return InkWell(
            onTap:(){print('点击了火爆商品');},
            child: 
            Container(
              alignment:Alignment.centerLeft,
              width: ScreenUtil().setWidth(372),
              color:Colors.white,
              padding: EdgeInsets.all(5.0),
              margin:EdgeInsets.only(bottom:3.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(val['indexRcmdPic']['picUrls'][0], width: ScreenUtil().setWidth(375),),
                  Text(val['indexRcmdPic']['title'], maxLines:1, overflow:TextOverflow.ellipsis, style: TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(26))),
                ]))); 
        }
      }).toList();
      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    }else {
      return Text('加载中...');
    }
  }
}