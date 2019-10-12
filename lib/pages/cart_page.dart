import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './login.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color.fromRGBO(180, 40, 45, 1),
        title: Text("购物车"),
      ),
      body: noLogin(),
    );
  }

  Widget noLogin () {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Image.asset("assets/images/noCart.png",width: ScreenUtil().setWidth(150),)),
          Center(child: Text('去添加点什么吧', style: TextStyle(fontSize: 16.0, color:Colors.black38))),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child:  MaterialButton(
                color: Color.fromRGBO(221, 26, 33, 1), minWidth: ScreenUtil().setWidth(640), height: ScreenUtil().setHeight(100),
                textColor: Colors.white,
                child: Text('登陆',style: TextStyle(fontSize: 16.0, color: Colors.white)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder:(context) =>Login())
                  );
                }
              )
          ),
      ],);
  }

}