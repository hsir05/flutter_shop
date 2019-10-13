import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../routers/application.dart';

class MemberPage  extends StatelessWidget {
  final List<Map> menuList = [
    {
      "icon":'assets/images/01.png',
      "name": '我的订单',
      "targetUrl": '/order'
    },
    {
      "icon": 'assets/images/03.png',
      "name": '售后服务',
      "targetUrl": '/afterServer'
    },
     {
      "icon": 'assets/images/09.png',
      "name": '地址管理',
      "targetUrl": '/afterServer'
    },
    {
      "icon": 'assets/images/02.png',
      "name": '周六一起拼'
    },
    {
      "icon":'assets/images/04.png',
      "name": '邀请返利'
    },
    {
      "icon": 'assets/images/05.png',
      "name": '回馈金卡'
    },
    {
      "icon": 'assets/images/06.png',
      "name": '优先购'
    },
    {
      "icon":'assets/images/07.png',
      "name": '积分中心'
    },
    {
      "icon": 'assets/images/08.png',
      "name": '会员俱乐部'
    },
   
      {
      "icon":'assets/images/10.png',
      "name": '帐号安全'
    },
    {
      "icon": 'assets/images/11.png',
      "name": '帮助与客服'
    },
    {
      "icon": 'assets/images/12.png',
      "name": '意见反馈'
    }
  ];
  final List<Map> capitalList = 
  [
    {
      "fundType": 1,
      "fundValue": "0",
      "fundName": "回馈金",
      "targetUrl": "/reward/index"
      },
      {
      "fundType": 2,
      "fundValue": "0",
      "fundName": "红包",
      "targetUrl": "/redpacket"
      },
      {
      "fundType": 3,
      "fundValue": "0",
      "fundName": "优惠券",
      "targetUrl": "/coupon"
      },
      {
      "fundType": 4,
      "fundValue": "0",
      "fundName": "津贴",
      "targetUrl": "/bonus/index"
      },
      {
      "fundType": 5,
      "fundValue": "0",
      "fundName": "礼品卡",
      "targetUrl": "/giftCard/list"
      }
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      body: ListView(
        children: <Widget>[
          _headTop(),
          _myCapital(context),
          Container(
            height: ScreenUtil().setHeight(20),
            color: Color.fromRGBO(244, 244, 244, 1),
          ),
          menuAreaList(context),

         Container(
           margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
           height: ScreenUtil().setHeight(100),
           child:  RaisedButton(
             onPressed: () {
                  mCupertinoAlertDialog(context);
             },
             color: Colors.white,
             elevation: 0,
             child:Text('退出登陆', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 16.0),)
          ),
         )
        ],
      )
    );
  }

  Widget _headTop() {
    return Container(
      height: ScreenUtil().setHeight(330),
      padding: EdgeInsets.only(top: 25, bottom: 25),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/membg.png"),
            fit: BoxFit.cover,
          ),
        ),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(190),
            height: ScreenUtil().setHeight(190),
            margin: EdgeInsets.only(left: 30.0, right: 15.0),
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage("assets/images/avatar.png")),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('清风明月', style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.white),),
              Text('普通用户', style: TextStyle(fontSize: ScreenUtil().setSp(25), color: Colors.white),)
            ],
          ),
          ),
          Container(
            width: ScreenUtil().setWidth(50),
            margin: EdgeInsets.only(right: 25.0),
            padding: EdgeInsets.all(2.0),
            color: Color.fromRGBO(187, 174, 148, 1),
            child: Image.asset("assets/images/qr.png"),
          )
        ],
      ),
    );
  }

  Widget _myCapital(context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('我的资产', style: TextStyle(fontSize: ScreenUtil().setSp(30),),),
          Divider(color: Color.fromRGBO(181, 178, 178, 1), height: 35.0,),
          Row(
            children: capitalList.map((item){
                return _gridViewItemUI(context, item);
              }).toList(),
          )
        ],
      ),
    );
  }

  Widget _gridViewItemUI(BuildContext context, item) {
      return InkWell(
        onTap: () {print('点击了导航');},
        child: Container(
          width: ScreenUtil().setWidth(130),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(item['fundValue'], style: TextStyle(fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.w600),),
            Text(item['fundName'], style: TextStyle(fontSize: ScreenUtil().setSp(28),))
          ],
        ),
        ),
      );
    }

  Widget menuAreaList(context) {
      return InkWell(
        onTap: () {print('menuItem');},
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: menuList.length,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return menuItem(context, menuList[index]);
            },
          )
      );
    }

  Widget menuItem(BuildContext context, item) {
    return InkWell(
      onTap: (){ 
        print(item['targetUrl']);
        Application.router.navigateTo(context, item['targetUrl']);
      },
      child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border:Border.all(width: 0.25, color: Color.fromRGBO(181, 178, 178, 1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 5.0),
              width: ScreenUtil().setWidth(65),
              height: ScreenUtil().setHeight(65),
              child: Image.asset(item['icon']),
            ),
          Text(item['name'])
        ],
      ),
    )
    );
  }

void mCupertinoAlertDialog(BuildContext context){
  showDialog(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        content:Text('确认退出'),
        actions:<Widget>[

          CupertinoDialogAction(
            child: Text('确认'),
            onPressed: (){
              print('yes...');
              Navigator.of(context).pop();
            },
          ),

          CupertinoDialogAction(
            child: Text('取消'),
            onPressed: (){
              print('no...');
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
 
}