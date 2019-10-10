import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> testList =[];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Container(
          height: 500.0,
          child: ListView.builder(
            itemCount: testList.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(testList[index])
              );
            },
          ),
        ),
             RaisedButton(
            onPressed: () {_add();},
            child:Text('增加')
          ),
          RaisedButton(
            onPressed: () {_clear();},
            child:Text('清空')
          ),
      ],),
    );
  }

  void _add() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String temp = '世界如此之大';
    testList.add(temp);
    prefs.setStringList('testInfo', testList);
      _show();
  }

  void _show() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getStringList('testInfo') != null){
        testList=prefs.getStringList('testInfo');
      }
    });
  }

  void _clear() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.clear(); //全部清空
    prefs.remove('testInfo'); //删除key键
    setState(() {
      testList=[];
    });
  }
}