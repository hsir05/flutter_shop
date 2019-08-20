import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent='正在获取数据';

  @override
  void initState() {
    getHomePageContent().then((val){
      setState((){
        homePageContent=val.toString();
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text('严选', style: TextStyle(color: Colors.black),),
           backgroundColor:Colors.white
           ),
         body: FutureBuilder(
           future: getHomePageContent(),
           builder: (context, snapshot) {
             if(snapshot.hasData) {
              //  var data = json.decode(snapshot.data.toString());
               var data = snapshot.data['data']['focus'];
               List <Map> swiperDataList = (data as List).cast();
               return Column(
                 children: <Widget>[
                   SwiperDiy(swiperDataList: swiperDataList,)
                 ],
               );
             } else {
               return Center(child: Text('加载中....'),);
             }
           },
         ),
       ),
    );
  }
}

class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  SwiperDiy({Key key,this.swiperDataList}):super(key:key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext buildContext, int index){
          return Image.network("${swiperDataList[index]['img']}", fit: BoxFit.fill);
        },
        itemCount: swiperDataList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}