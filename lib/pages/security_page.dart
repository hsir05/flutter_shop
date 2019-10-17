import 'package:flutter/material.dart';
import './searchBar.dart';

class SecurityCenter extends StatelessWidget {
  final List<Map> list = [
    {
      "icon": Icons.timer,
      "name": '修改登陆密码'
    },
    {
      "icon": Icons.timer,
      "name": '绑定手机号码'
    },
    {
      "icon": Icons.category,
      "name": '启用支付密码'
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
        title: Text("账号安全"),
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