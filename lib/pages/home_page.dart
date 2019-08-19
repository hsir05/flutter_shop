import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';

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
         appBar: AppBar(title: Text('百姓生活+')),
         body: FutureBuilder(
           future: getHomePageContent(),
           builder: (context, snapshot) {
             if(snapshot.hasData) {
               var data = json.decode(snapshot.data.toString());
               List <Map> swiperDataList = (data['data']['slides'] as List).cast();
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
    return Container(
      height: 333.0,
      child: Swiper(
        itemBuilder: (BuildContext buildContext, int index){
          return Image.network("${swiperDataList[index]['image']}", fit: BoxFit.fill);
        },
        itemCount: swiperDataList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}