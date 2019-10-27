import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './title.dart';
import '../routers/application.dart';

class Recommend extends StatelessWidget {
  List<Map> recommendList=[];
  Recommend({Key key, this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = '推荐商品';
    return Container(
      child: Column(children: <Widget>[
        TitleWidget(title:title),
        _wrapList(context)
      ],),
    );
  }

  Widget _wrapList(context) {
    if (recommendList.length!= 0){
      List<Widget>listWidget = recommendList.map((val){
        if (val['type'] == 1) {
           return InkWell(
            onTap:(){
              print('点击了火爆商品');
                if (val['id'] != null){
                  Fluttertoast.showToast(
                      msg: "暂无数据...",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIos: 1,
                      fontSize: 14.0
                    );
                }else {
                  Application.router.navigateTo(context,"/detail?id=${val['id']}");
                }
              },
            child: 
            Container(
              width: ScreenUtil().setWidth(372),
              color:Colors.white,
              padding: EdgeInsets.all(5.0),
              margin:EdgeInsets.only(bottom:3.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                val['categoryItem']['listPicUrl'] == null ? Image.network('assets/images/bg.png') : Image.network(val['categoryItem']['listPicUrl'], width: ScreenUtil().setWidth(375),height: ScreenUtil().setHeight(360)),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(val['categoryItem']['name'], maxLines:1, overflow:TextOverflow.ellipsis, style: TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(26))),
                ),
                  Padding(
                  padding: EdgeInsets.only(left:5.0),
                  child: Text('￥${val['categoryItem']['retailPrice']}'),
                  )
              ])));
        }else if (val['type'] == 2)  {
           return InkWell(
            onTap:(){
               print('点击了火爆商品');
              if (val['id'] != null){
                Fluttertoast.showToast(
                    msg: "暂无数据...",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    fontSize: 14.0
                  );
              }else {
                Application.router.navigateTo(context,"/detail?id=${val['id']}");
              }
            },
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
                  val['pinItem']['picUrl'] == null ? Image.network('assets/images/bg.png') : Image.network(val['pinItem']['picUrl'], width: ScreenUtil().setWidth(375), height: ScreenUtil().setHeight(360),),
                   Padding(
                  padding: EdgeInsets.all(5.0),
                  child:Text(val['pinItem']['title'], maxLines:1, overflow:TextOverflow.ellipsis, style: TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(26)))),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Row(
                    children: <Widget>[
                      Text('￥${val['pinItem']['price']}'),
                      Text(  '￥${val['pinItem']['originPrice']}',
                        style: TextStyle(color:Colors.black26,decoration: TextDecoration.lineThrough),
                      )
                    ],),
                  )
                ]))); 
        } else {
          return InkWell(
            onTap:(){
              print('点击了火爆商品');
              // Application.router.navigateTo(context,"/detail?id=${val['id']}");
                if (val['id'] != null){
                  Fluttertoast.showToast(
                      msg: "暂无数据...",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIos: 1,
                      fontSize: 14.0
                    );
                }else {
                  Application.router.navigateTo(context,"/detail?id=${val['id']}");
                }
            },
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
                  Image.network(val['indexRcmdPic']['picUrls'][0], width: ScreenUtil().setWidth(375),height: ScreenUtil().setHeight(360)),
                  Padding(
                    padding: EdgeInsets.only(left:5.0, top: 5.0,),
                    child: Text(val['indexRcmdPic']['title'], maxLines:1, overflow:TextOverflow.ellipsis, style: TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(26))),
                  )
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