import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
   final List<Map> list = [
    {
      "icon": Icons.timer,
      "name": '头像'
    },
    {
      "icon": Icons.timer,
      "name": '夜间模式'
    },
    {
      "icon": Icons.category,
      "name": '检查更新'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(180, 40, 45, 1),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                    Navigator.pop(context);
                }),
            title: Text("设置"), 
            centerTitle: true),
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