import 'package:flutter/material.dart';
import './home_page.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(180, 40, 45, 1),
        leading: IconButton(
                  icon: Icon(Icons.home),
                  tooltip: 'search',
                  onPressed: () {
                     Navigator.push(context,new  MaterialPageRoute(
                      builder:(context) =>HomePage())
                    );
                  }),
        title: Text("网易严选"),
        centerTitle: true,
          actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search),
                  tooltip: 'search',
                  onPressed: () {
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
              padding: EdgeInsets.only(top:100.0, bottom: 100.0),
              child: Image.asset("assets/images/yanxuan.png",width: 150.0,),
            )),

            Container(
              width: 350.0,
              height: 60.0,
              child: RaisedButton.icon(
                  label: Text('手机号快捷登陆',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w300, color: Colors.white)),
                  icon: Icon(Icons.phone_iphone, color: Colors.white,),
                  elevation: 0,
                  color: Color.fromRGBO(221, 26, 33, 1),
                  onPressed: () {print('cion');},
                ),
            ),
            Container(
              width: 350.0,
              height: 60.0,
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
              height: 60.0,
              width: 300.0,
              margin: EdgeInsets.only(top: 150.0),
              child: Row(children: <Widget>[
                RaisedButton.icon(
                  label: Text('微信',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w300, color: Color.fromRGBO(127, 127, 127, 1),)),
                  icon: Image.asset("assets/images/wechat.png",width: 26.0,),
                  elevation: 0,
                  color: Colors.transparent,
                  onPressed: () {print('cion');},
                ),
                Container(
                  height: 20.0,
                  width: 1.0,
                  color: Color.fromRGBO(127, 127, 127, 1),
                ),
                RaisedButton.icon(
                  label: Text('QQ',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w300, color: Color.fromRGBO(127, 127, 127, 1),)),
                  icon: Image.asset("assets/images/qqchat.png",width: 26.0,),
                  elevation: 0,
                  color: Colors.transparent,
                  onPressed: () {print('cion');},
                ),
                Container(
                  height: 20.0,
                  width: 1.0,
                  color: Color.fromRGBO(127, 127, 127, 1),
                ),
                 RaisedButton.icon(
                  label: Text('微博',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w300, color: Color.fromRGBO(127, 127, 127, 1),)),
                  icon: Image.asset("assets/images/weibo.png",width: 26.0,),
                  elevation: 0,
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
}