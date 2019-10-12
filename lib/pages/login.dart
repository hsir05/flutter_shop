import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../routers/application.dart';
import './searchBar.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _hasdeleteIcon = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(180, 40, 45, 1),
        leading: IconButton(
                  icon: Icon(Icons.home),
                  tooltip: 'search',
                  onPressed: () {
                    Application.router.navigateTo(context,"/");
                  }),
        title: Text("网易严选"),
        centerTitle: true,
          actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search),
                  tooltip: 'search',
                  onPressed: () {
                    showSearch(context: context,delegate: SearchBarDelegate());
                  }),
            IconButton(
                icon: Icon(Icons.shopping_cart),
                tooltip: 'cart',
                onPressed: () {
                  // do nothing
                })
        ],
      ),
      body:Container(
        child: Column(
          children: <Widget>[
            Center(child: Padding(
              padding: EdgeInsets.only(top:ScreenUtil().setHeight(170), bottom: ScreenUtil().setHeight(170)),
              child: Image.asset("assets/images/yanxuan.png",width: 150.0,),
            )),

            Container(
              width: ScreenUtil().setWidth(640),
              height: ScreenUtil().setHeight(100),
              child: RaisedButton.icon(
                  label: Text('手机号快捷登陆',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w300, color: Colors.white)),
                  icon: Icon(Icons.phone_iphone, color: Colors.white,),
                  elevation: 0,
                  color: Color.fromRGBO(221, 26, 33, 1),
                  onPressed: () {print('cion');},
                ),
            ),
            
            Container(
              width: ScreenUtil().setWidth(640),
              height: ScreenUtil().setHeight(100),
              margin: EdgeInsets.only(top: 15.0),
              child:  RaisedButton.icon(
                  label: Text('邮箱账号登陆',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w300, color: Color.fromRGBO(221, 26, 33, 1))),
                  icon: Icon(Icons.email, color: Color.fromRGBO(221, 26, 33, 1),),
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color.fromRGBO(221, 26, 33, 1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(2)),
                  onPressed: () {
                    Navigator.push(context,new  MaterialPageRoute(
                      builder:(context) =>Login())
                    );
                  },
                ),
            ),

            Container(
              height: ScreenUtil().setHeight(90),
              width: ScreenUtil().setWidth(640),
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(270)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                RaisedButton.icon( 
                  label: labelText('微信'),
                   splashColor: Colors.transparent,
                  icon: Image.asset("assets/images/wechat.png",width: ScreenUtil().setWidth(46),),
                  elevation: 0,
                  color: Colors.transparent,
                  onPressed: () {print('cion');},
                ),

                vertLine(),

                RaisedButton.icon(
                  label: labelText('QQ'),
                   splashColor: Colors.transparent,
                  icon: Image.asset("assets/images/qqchat.png",width: ScreenUtil().setWidth(46)),
                  elevation: 0,
                  color: Colors.transparent,
                  onPressed: () {print('cion');},
                ),

                vertLine(),

                 RaisedButton.icon(
                  label: labelText('微博'),
                  icon: Image.asset("assets/images/weibo.png",width: ScreenUtil().setWidth(46),),
                  elevation: 0,
                  splashColor: Colors.transparent,
                  color: Colors.transparent,
                  onPressed: () {print('cion');},
                ),
              ],),
            )
          ],
        ),
      )
    );
  }

Widget vertLine() {
    return Container(
        height: ScreenUtil().setHeight(40),
        width: 1.0,
        color: Color.fromRGBO(127, 127, 127, 1),
      );
  }
  Widget labelText(String text) {
    return Text(text, style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w300, color: Color.fromRGBO(127, 127, 127, 1),));
  }
  
}