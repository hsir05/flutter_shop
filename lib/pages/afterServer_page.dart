import 'package:flutter/material.dart';
import './searchBar.dart';

class AfterServer extends StatelessWidget {
  final List<Map> list = [
    {
      "icon": Icons.timer,
      "name": '申请退款'
    },
    {
      "icon": Icons.timer,
      "name": '申请换货'
    },
    {
      "icon": Icons.category,
      "name": '仅退款'
    },
    {
      "icon": Icons.timer,
      "name": '申请维修'
    },
    {
      "icon": Icons.note,
      "name": '售后记录'
    },
    {
      "icon": Icons.star_half,
      "name": '价格保护'
    },
    {
      "icon": Icons.remove_red_eye,
      "name": '发票服务'
    },
    {
      "icon": Icons.person,
      "name": '在线客服'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        backgroundColor: Color.fromRGBO(180, 40, 45, 1),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            tooltip: 'search',
            onPressed: () {
                Navigator.pop(context);
            }),
        title: Text("售后服务"),
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
              onPressed: () {})
        ]),
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                ListTile(
                    leading: Icon(list[index]['icon'], color: Color.fromRGBO(221, 116, 86, 1),),
                    title: Text((list[index]['name'])),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      print(list[index]);
                    },
                  ),
                  Divider()
              ],
            );
          }
        )
    );
  }
}