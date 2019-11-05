import 'package:flutter/material.dart';
// import 'package:provide/provide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:async';
// import '../provide/details_info.dart';
import '../service/service_method.dart';
import '../tools/tools.dart';

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
            return Stack(
                    children: <Widget>[
                         ListView(children: <Widget>[
                                SwiperDiy(swiperDataList: swiperDataList,),
                                DetailName(name: name, retailPrice: retailPrice, recommendReasons: recommendReasons),
                                    // 购物返
                                data['shoppingReward'] == null ? Text('') : Container(
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
                                              Text( data['shoppingReward'] == null ? '' : data['shoppingReward']['name'], style: TextStyle(fontSize: ScreenUtil().setSp(30),)),
                                              Padding(
                                                padding: EdgeInsets.only(left: 12.0, right: 8.0),
                                                child: Text(data['shoppingReward'] == null ? '' :  data['shoppingReward']['rewardDesc'], style: TextStyle(fontSize: ScreenUtil().setSp(30),)),
                                              ),
                                              Text(data['shoppingReward'] == null ? '' : data['shoppingReward']['rewardValue'], style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Color.fromRGBO(180, 40, 45, 1)),)
                                            ],
                                          ),
                                          trailing: Icon(Icons.keyboard_arrow_right),
                                          onTap: () {
                                            _modalBottomSheetMenu(context,  data['shoppingRewardRule']);
                                          },
                                        )
                                  ),
                                  // 评论标题
                                Container(
                                  color: Colors.white,   
                                  padding: EdgeInsets.all(15.0),
                                  child: Title(leftTitle: "用户评价(${data['commentCount']})", rightTitle: "${data['itemStar']['goodCmtRate']}", fontSize:14.0),
                                ),
                                Divider(color: Colors.black12, height: 0,),
                                // 评论内容
                                // _comments(data['comments']),
                                _commentItem(data['comments'][0]),

                                Container(child: Html(data: itemDetail),), 
                            ],),
                       Positioned(
                        bottom: 0,
                        left: 0,
                        child: DetailsBottom()
                      )
                    ]);
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

    // 底部弹出
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
  
  // 评论内容
  Widget _comments(comments){
    if (comments.length !=0){
      return Column(
          children: comments.map((item){
            return _commentItem(item);
          })
        );
    } else {
      return Text('');
    }
  }

  Widget _commentItem(Map item) {
    String createTime = DateUtil.getFormartData(item['createTime'], 'yyyy-MM-dd hh:mm:ss');
    return Container(
      padding: EdgeInsets.only(top:10.0, bottom: 10.0, left: 5.0,right: 5.0),
      child: Column(
      children: <Widget>[
        Row(
            children: <Widget>[
              CircleAvatar(
                radius: 20.0,
                backgroundImage: item['frontUserAvatar'] == null ? AssetImage("assets/images/avatar.png") : NetworkImage(item['frontUserAvatar']) ,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Text(item['frontUserName']),
              ),
            item['star'] == null ? Text('') : _iconStarList(item['star'])
          ],
        ),

        Padding(
          padding: EdgeInsets.only(left:5.0, top:5.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Text(createTime, style: TextStyle(color: Colors.black54, fontSize: ScreenUtil().setSp(24)),),
              ),
              _skuInfoList(item['skuInfo']),
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.only(top:5.0, left: 5.0, bottom: 10.0, right: 5.0),
          alignment: Alignment.centerLeft,
          child: Text(item['content'], style:TextStyle(fontSize: ScreenUtil().setSp(26))),
        ),

        item['picList'] == null ? Text('') : _imgList(item['picList'])

      ],
    ));
  }
  
  Widget _skuInfoList(List skuInfo) {
    if (skuInfo.length != 0){
      List<Widget> listWidget = skuInfo.map((val){
          return Text(val, style: TextStyle(color: Colors.black54, fontSize: ScreenUtil().setSp(24)), softWrap: true);
      }).toList();
       return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text('');
    }
  }
  
  Widget _iconStarList(int star){
    if (star > 0){
      List<Widget> listWidget = [];
      for (int i = 1; i<= star; i++) {
        listWidget.add(
          Icon(Icons.star, color: Color.fromRGBO(255, 181, 73, 1), size: 18,)
        );
      } 
      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text('');
    }
  }
  // 评论图片
  Widget _imgList(List picList){
    if (picList.length > 0){
      return GridView.builder(
            shrinkWrap: true,
            itemCount: picList.length,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio:1,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Image.network(picList[index], fit: BoxFit.cover,),
              );
            },
          );
    } else {
      return Text('');
    }
  }

   Future getGoodsInfo(String id) async{
    var formData = {'itemId': id};
    return await request('recItemDetailById', formData);
  }
  
}
  // 底部按钮
class DetailsBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
       width:ScreenUtil().setWidth(750),
       color: Colors.white,
       height: ScreenUtil().setHeight(100),
       child: Row(
         children: <Widget>[
           InkWell(
             onTap: (){},
             child: Container(
                width: ScreenUtil().setWidth(110) ,
                alignment: Alignment.center,
                child:Icon(
                      Icons.shopping_cart,
                      size: 28,
                      color: Color.fromRGBO(180, 40, 45, 1),
                    ), 
              ) ,
           ),
           InkWell(
             onTap: (){},
             child: Container(
              decoration: BoxDecoration(
                 border: Border(
                    left: BorderSide(width: 1.0, color: Colors.black12),
                 )
              ),
               alignment: Alignment.center,
               width: ScreenUtil().setWidth(340),
               height: ScreenUtil().setHeight(100),
               child: Text(
                 '加入购物车',
                 style: TextStyle(fontSize: ScreenUtil().setSp(28)),
               ),
             ) ,
           ),
           InkWell(
             onTap: (){},
             child: Container(
               alignment: Alignment.center,
               width: ScreenUtil().setWidth(300),
               height: ScreenUtil().setHeight(100),
               color: Color.fromRGBO(180, 40, 45, 1),
               child: Text(
                 '马上购买',
                 style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(28)),
               ),
             ) ,
           ),
         ],
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
      height: ScreenUtil().setHeight(725),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext buildContext, int index){
          return Image.network("${swiperDataList[index]}", fit: BoxFit.fill);
        },
        itemCount: swiperDataList.length,
        // pagination: SwiperPagination(), 分页指示器点形式
        autoplay: true,
        
        pagination: SwiperPagination( // 分页指示器分数形式
            alignment: Alignment.bottomRight, // 分页指示器位置
            builder: FractionPaginationBuilder(
                color: Colors.black,
                fontSize: 14.0,
                activeFontSize: 14.0,
                activeColor: Color.fromRGBO(180, 40, 45, 1)
            )
        )
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
      padding: EdgeInsets.only(top:10.0, left: 10.0, right: 10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[
            Text('¥', style: TextStyle(color: Color.fromRGBO(180, 40, 45, 1), fontWeight: FontWeight.w700)),
            Text(retailPrice, style: TextStyle(color: Color.fromRGBO(180, 40, 45, 1), fontSize: 24.0, fontWeight: FontWeight.w700),),
          ],),
          Text(name, style: TextStyle(color: Colors.black87, fontSize: 16.0, fontWeight: FontWeight.w700),),

          Title(leftTitle: '推荐理由', rightTitle: '好评率', fontSize:12.0),
          
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
                        Text(item, overflow: TextOverflow.ellipsis,)
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

class Title extends StatelessWidget {
  final String leftTitle;
  final String rightTitle;
  final double fontSize;

  Title({Key key,this.leftTitle, this.rightTitle, this.fontSize}):super(key:key);


  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child:   Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(460),
                  child: Text(leftTitle, style: TextStyle(fontSize: fontSize, color: Colors.black54),),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(rightTitle, style: TextStyle(fontSize: fontSize, color: Colors.black54)),
                        Icon(Icons.keyboard_arrow_right, size: 18.0, color: Colors.black54,)
                      ],
                    ),
                  ),
                )
              ],
            ),
      );
  }
}