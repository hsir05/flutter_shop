import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../service/service_method.dart';
import '../components/adBanner.dart';
import '../components/special.dart';
// import '../components/leaderPhone.dart';
import '../components/floorTitle.dart';
// import '../components/floorContent.dart';
import '../components/recommend.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>with AutomaticKeepAliveClientMixin {
  String homePageContent='正在获取数据';
  int lastItemId = 0;
  int size = 30;
  List<Map> recomList=[];

  @override
  bool get wantKeepAlive =>true;
  void initState() {
    _getRecommend();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
     
         body: FutureBuilder(
           future: request('homePageContext', null),
           builder: (context, snapshot) {
             if(snapshot.hasData) {
               var data = snapshot.data['data'];
               List <Map> swiperDataList = (data['focus'] as List).cast();
              List <Map> navigatorList = (data['kingKongAreaV4'] as List).cast();
              String advertesPicture = data['operationCfg'][0]['picUrls'][0];
              List <Map> specialList = (data['timePurchaseItems']['itemList'] as List).cast();
              String floor1Title =data['operationCfg'][0]['picUrls'][0];//楼层1的标题图片
              // List<Map> floor2 = (data['categoryItemsV4'][1]['itemList'] as List).cast(); //楼层1商品和图片 

               return EasyRefresh(
                 footer: MaterialFooter(),
                 header: MaterialHeader(),
                 child: ListView(
                 children: <Widget>[
                   SwiperDiy(swiperDataList: swiperDataList,),
                   TopNavigator(navigatorList:navigatorList),
                   AdBanner(advertesPicture:advertesPicture),
                  Special(specialList:specialList),
                  FloorTitle(picture_address:floor1Title),
                  // FloorContent(floorGoodsList:floor2),
                  Recommend(recommendList:recomList)
                 ],
               ),
               onLoad: ()async{
                  print('开始加载更多');
                  Fluttertoast.showToast(
                    msg: "正在加载更多数据...",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    // backgroundColor: Colors.pink,
                    // textColor: Colors.white,
                    fontSize: 14.0
                  );

                   var timer;
                    timer = Timer.periodic(
                      const Duration(milliseconds: 2000), (Void) {
                          var option={
                          'size':size,
                          'lastItemId':lastItemId
                        };
                        request('recommendData', option).then((data){
                            List<Map> newRecomList = (data['data']['rcmdItemList'] as List).cast();
                            setState(() {
                                recomList.addAll(newRecomList);
                                lastItemId = newRecomList[newRecomList.length - 1]['id']; 
                              });
                        });
                        (timer as Timer).cancel();
                      });
                },
               );
             } else {
               return Center(
                child: CupertinoActivityIndicator(
                    radius: 15.0,
                    animating: false,
                  ),
                );
             }
           },
         ),
       ),
    );
  }

  void _getRecommend(){
    var option={
      'size':size,
      'lastItemId':lastItemId
    }; 
    request('recommendData', option).then((data){
        List<Map> newRecomList = (data['data']['rcmdItemList'] as List).cast();
        print(newRecomList[newRecomList.length - 1]['id']);
         setState(() {
            recomList.addAll(newRecomList);
            lastItemId = newRecomList[newRecomList.length - 1]['id']; 
          });
    }); 
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
        physics: NeverScrollableScrollPhysics(),
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
          Image.network(item['picUrls'][0], width: ScreenUtil().setWidth(95), height: ScreenUtil().setHeight(95),),
          Text(item['title'])
        ],
      ),
    );
  }
}