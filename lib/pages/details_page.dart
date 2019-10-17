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
             List recommendReasons = data['recommendReasons'];
            List <String> swiperDataList = [];
            swiperDataList.add(data['primaryPicUrl']);
            swiperDataList.add(data['itemDetail']['picUrl1']);
            swiperDataList.add(data['itemDetail']['picUrl2']);
            swiperDataList.add(data['itemDetail']['picUrl3']);
            swiperDataList.add(data['itemDetail']['picUrl4']);
            
            return Container(
              child: ListView(children: <Widget>[
                  SwiperDiy(swiperDataList: swiperDataList,),
                  DetailName(name: name, retailPrice: retailPrice, recommendReasons: recommendReasons),
                      // 购物返
                   Container(
                      decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(width: 12.0, color: Color.fromRGBO(244, 244, 244, 1)),
                              bottom: BorderSide(width: 12.0, color: Color.fromRGBO(244, 244, 244, 1)),
                              ),
                          ),
                      child:  ListTile(
                            title: Row(
                              children: <Widget>[
                                Text(data['shoppingReward']['name'], style: TextStyle(fontSize: ScreenUtil().setSp(30),)),
                                Padding(
                                  padding: EdgeInsets.only(left: 15.0, right: 8.0),
                                  child: Text(data['shoppingReward']['rewardDesc'], style: TextStyle(fontSize: ScreenUtil().setSp(30),)),
                                ),
                                Text(data['shoppingReward']['rewardValue'], style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Color.fromRGBO(180, 40, 45, 1)),)
                              ],
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              _modalBottomSheetMenu(context,  data['shoppingRewardRule']);
                            },
                          )
                  ),
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


void _modalBottomSheetMenu(BuildContext context, Map shoppingRewardRule){
        showModalBottomSheet(
            context: context,
            builder: (builder){
              return Container(
                height: ScreenUtil().setHeight(700),
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(child: 
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(shoppingRewardRule['title'], style: TextStyle(fontSize: ScreenUtil().setSp(38), fontWeight: FontWeight.w700),),
                        ),),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Row(children: <Widget>[
                             Padding(padding: EdgeInsets.only(right: 5.0),child:  Icon(Icons.account_circle, size: 16,),),
                            Text(shoppingRewardRule['ruleList'][0]['title'],style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700), textAlign: TextAlign.left)
                          ],),
                        ),
                        Text(shoppingRewardRule['ruleList'][0]['content'], style: TextStyle(color: Colors.black),)
                      ],
                    )
                    ),
              );
            }
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
      height: ScreenUtil().setHeight(725),
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
  final List recommendReasons;
  DetailName({Key key,this.name, this.retailPrice, this.recommendReasons}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[
            Text('¥', style: TextStyle(color: Color.fromRGBO(180, 40, 45, 1), fontWeight: FontWeight.w700)),
            Text(retailPrice, style: TextStyle(color: Color.fromRGBO(180, 40, 45, 1), fontSize: 24.0, fontWeight: FontWeight.w700),),
          ],),
          Text(name, style: TextStyle(color: Colors.black87, fontSize: 16.0, fontWeight: FontWeight.w700),),
          Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child:   Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(500),
                  child: Text('推荐理由', style: TextStyle(fontSize: 12.0, color: Colors.black54),),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text('好评率>', style: TextStyle(fontSize: 12.0, color: Colors.black54),),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:15.0, bottom:  15.0, left: 8.0, right: 8.0),
            color: Color.fromRGBO(244, 244, 244, 1),
            child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: recommendReasons.map((item){
                    return Row(
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(15),
                          height: ScreenUtil().setHeight(15),
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left:8.0, right: 8.0),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Color.fromRGBO(180, 40, 45, 1)),
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                        ),
                        Text(item)
                      ],
                    );
                  }).toList()
              ),
          ),
          
        ],
      ),
    );
  }
}