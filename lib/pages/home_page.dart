import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
// import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/adBanner.dart';
import '../components/special.dart';
// import '../components/leaderPhone.dart';
import '../components/floorTitle.dart';
import '../components/floorContent.dart';

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
              List <Map> specialList = (data['timePurchaseItems']['itemList'] as List).cast();
              // List <Map> manufList = (data['manufactureItems']['manufactureItems']['itemList'] as List).cast();


              String floor1Title =data['operationCfg'][0]['picUrls'][0];//楼层1的标题图片
              String floor2Title =data['operationCfg'][0]['picUrls'][0];//楼层1的标题图片
              String floor3Title =data['operationCfg'][0]['picUrls'][0];//楼层1的标题图片
              List<Map> floor1 = (data['categoryItemsV4'][0]['itemList'] as List).cast(); //楼层1商品和图片 
              List<Map> floor2 = (data['categoryItemsV4'][1]['itemList'] as List).cast(); //楼层1商品和图片 
              List<Map> floor3 = (data['categoryItemsV4'][2]['itemList'] as List).cast(); //楼层1商品和图片 


               return SingleChildScrollView(
                 child: Column(
                 children: <Widget>[
                   SwiperDiy(swiperDataList: swiperDataList,),
                   TopNavigator(navigatorList:navigatorList),
                   AdBanner(advertesPicture:advertesPicture),
                  //  LeaderPhone(leaderPhone:leaderPhone, leaderImage:leaderImage)
                  Special(specialList:specialList),

                  FloorTitle(picture_address:floor1Title),
                  FloorContent(floorGoodsList:floor1),
                  FloorTitle(picture_address:floor2Title),
                  FloorContent(floorGoodsList:floor2),
                  FloorTitle(picture_address:floor3Title),
                  FloorContent(floorGoodsList:floor3),
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