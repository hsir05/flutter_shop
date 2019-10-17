import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:async';
import '../provide/details_info.dart';
import '../service/service_method.dart';


class DetailsPage extends StatelessWidget {
  final String itemId;
  DetailsPage(this.itemId);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white70,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black87,),
          onPressed: (){
            print('返回上一页');
            Navigator.pop(context);
          },
          ),
          title: Text('商品详情页', style: TextStyle(color: Colors.black87),),
      ),
      body: FutureBuilder(
        future: getGoodsInfo(itemId) ,
        builder: (context, snapshot){
          if(snapshot.hasData){
             var data = snapshot.data['data'];
             String name = data['name'];
             String retailPrice = data['retailPrice'];
             String itemDetail = data['itemDetail']['detailHtml'];
            List <String> swiperDataList = [];
            swiperDataList.add(data['primaryPicUrl']);
            swiperDataList.add(data['itemDetail']['picUrl1']);
            swiperDataList.add(data['itemDetail']['picUrl2']);
            swiperDataList.add(data['itemDetail']['picUrl3']);
            swiperDataList.add(data['itemDetail']['picUrl4']);

            

            return Container(
              child: ListView(children: <Widget>[
                  SwiperDiy(swiperDataList: swiperDataList,),
                  DetailName(name: name, retailPrice: retailPrice),
                  Container(child: Html(data: itemDetail),),

              ],)
            );
          } else {
             return Center(
               child: CupertinoActivityIndicator(
                radius: 15.0,
                animating: true,
              ),
             );
          }
        },
      ),
    );
  }

   Future getGoodsInfo(String id) async{
    var formData = {'itemId': id};
    return await request('recItemDetailById', formData);
  }

  Future _getBackInfo(BuildContext context) async{
    // await Provide.value<DetailsInfoProvide>(context).getRecGoodsInfo(itemId);
    return await Provide.value<DetailsInfoProvide>(context).getGoodsInfo(itemId);
  }
  
}

// 轮播
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  SwiperDiy({Key key,this.swiperDataList}):super(key:key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(730),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext buildContext, int index){
          return Image.network("${swiperDataList[index]}", fit: BoxFit.fill);
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

// 名称 推荐理由

class DetailName extends StatelessWidget {
  final String name;
  final String retailPrice;
  final List recommendReasons = [];
  DetailName({Key key,this.name, this.retailPrice}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[
            Text('¥', style: TextStyle(color: Color.fromRGBO(180, 40, 45, 1), fontWeight: FontWeight.w700)),
            Text(retailPrice, style: TextStyle(color: Color.fromRGBO(180, 40, 45, 1), fontSize: 24.0, fontWeight: FontWeight.w700),),
          ],),
          Text(name, style: TextStyle(color: Colors.black87, fontSize: 16.0, fontWeight: FontWeight.w700),),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(500),
                child: Text('推荐理由', style: TextStyle(fontSize: 12.0, color: Colors.black54),),
              ),
              Expanded(
                child: Text('好评率>', style: TextStyle(fontSize: 12.0, color: Colors.black54),),
              )
            ],
          )
        ],
      ),
    );
  }
}