import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/res/resources.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluro/fluro.dart';
import './title.dart';
import '../routers/application.dart';
import '../widgets/image.widget.dart';

class Recommend extends StatelessWidget {
 
  List<Map> recommendList=[];
  Recommend({Key key, this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    String title = '为你推荐';
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
              print('点击了火爆商品1');
                if (val['id'] == null){
                  toast('暂无数据...'); 
                }else {
                  Application.router.navigateTo(context,"/detail?id=${val['id']}", transition: TransitionType.cupertinoFullScreenDialog);
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
                ImageNet(url: val['categoryItem']['listPicUrl']),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(val['categoryItem']['name'], maxLines:1, overflow:TextOverflow.ellipsis, style: TextStyle(color: Colors.black87, fontSize: ScreenUtil().setSp(26))),
                ),
                Padding( 
                  padding: EdgeInsets.only(left:5.0),
                  child: Text('￥${val['categoryItem']['retailPrice']}', style: TextStyle(color: Colours.app_main),),
                  )
              ])));
        }else if (val['type'] == 2)  {
           return InkWell(
            onTap:(){
               print('点击了火爆商品2');
               print(val['id']);
              if (val['id'] == null){
               toast('暂无数据...');
              }else {
                Application.router.navigateTo(context,"/detail?id=${val['id']}", transition: TransitionType.cupertinoFullScreenDialog);
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
                  child:Text(val['pinItem']['title'], maxLines:1, overflow:TextOverflow.ellipsis, style: TextStyle(color: Colors.black87, fontSize: ScreenUtil().setSp(26)))),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Row(
                    children: <Widget>[
                      Text('￥${val['pinItem']['price']}', style: TextStyle(color: Colours.app_main)),
                      Text(  '￥${val['pinItem']['originPrice']}',
                        style: TextStyle(color:Colors.black26,decoration: TextDecoration.lineThrough),
                      )
                    ],),
                  )
                ]))); 
        } else {
          return InkWell(
            onTap:(){
              print('点击了火爆商品3');
              print(val['id']);
                if (val['id'] == null){
                  toast('暂无数据...');
                }else {
                  Application.router.navigateTo(context,"/detail?id=${val['id']}", transition: TransitionType.cupertinoFullScreenDialog);
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
                  Image.network(val['indexRcmdPic']['picUrls'][0], width: ScreenUtil().setWidth(360),height: ScreenUtil().setHeight(350)),
                  Padding(
                    padding: EdgeInsets.only(left:5.0, top: 5.0,),
                    child: Text(val['indexRcmdPic']['title'], maxLines:1, overflow:TextOverflow.ellipsis, style: TextStyle(color: Colors.black54, fontSize: ScreenUtil().setSp(26))),
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

  void toast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        fontSize: 14.0
      );
  }
}