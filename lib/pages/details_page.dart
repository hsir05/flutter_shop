import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:async';
import '../provide/details_info.dart';
import '../service/service_method.dart';


class DetailsPage extends StatelessWidget {
  final String itemId;
  DetailsPage(this.itemId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
            List <String> swiperDataList = [];
            swiperDataList.add(data['primaryPicUrl']);
            swiperDataList.add(data['itemDetail']['picUrl1']);
            swiperDataList.add(data['itemDetail']['picUrl2']);
            swiperDataList.add(data['itemDetail']['picUrl3']);
            swiperDataList.add(data['itemDetail']['picUrl4']);
            // List <Map> swiperDataList = (data['focus'] as List).cast();

            return Container(
              child: Column(children: <Widget>[
                SwiperDiy(swiperDataList: swiperDataList,),
              ],),
            );
          } else {
             return SpinKitFadingCircle(
                    color: Colors.black26,
                    size: 50.0,
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