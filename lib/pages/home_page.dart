import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
// import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/adBanner.dart';
import '../components/recommend.dart';
// import '../components/leaderPhone.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>with AutomaticKeepAliveClientMixin {
  String homePageContent='正在获取数据';

  @override
  bool get wantKeepAlive =>true;
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
        //  appBar: AppBar(
        //    title: Text('严选', style: TextStyle(color: Colors.black),),
        //    backgroundColor:Colors.white
        //    ),
         body: FutureBuilder(
           future: getHomePageContent(),
           builder: (context, snapshot) {
             if(snapshot.hasData) {

               var data = snapshot.data['data'];
               List <Map> swiperDataList = (data['focus'] as List).cast();
              List <Map> navigatorList = (data['kingKongAreaV4'] as List).cast();
              String advertesPicture = data['operationCfg'][0]['picUrls'][0];
              // String leaderPhone = '18093189741';
              // String leaderImage = data['operationCfg'][0]['picUrls'][0];
              List <Map> recommendList = (data['timePurchaseItems']['itemList'] as List).cast();

               return SingleChildScrollView(
                 child: Column(
                 children: <Widget>[
                   SwiperDiy(swiperDataList: swiperDataList,),
                   TopNavigator(navigatorList:navigatorList),
                   AdBanner(advertesPicture:advertesPicture),
                  //  LeaderPhone(leaderPhone:leaderPhone, leaderImage:leaderImage)
                  Recommend(recommendList:recommendList),
                  
                 ],
               ),
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

// 轮播
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  SwiperDiy({Key key,this.swiperDataList}):super(key:key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top:20.0),
      height: ScreenUtil().setHeight(373),
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

// icon导航
class TopNavigator extends StatelessWidget {
  final List navigatorList;
  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(4.0),
        children: navigatorList.map((item){
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {print('点击了导航');},
      child: Column(
        children: <Widget>[
          Image.network(item['picUrls'][0], width: ScreenUtil().setWidth(95)),
          Text(item['title'])
        ],
      ),
    );
  }
}