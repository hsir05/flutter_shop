import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import '../widgets/button.widget.dart';


class VipPage extends StatefulWidget {
  @override
  _VipPageState createState() => new _VipPageState();
}

class _VipPageState extends State<VipPage> {
  String debugLable = 'Unknown';
final JPush jpush = new JPush();
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    

    // Platform messages may fail, so we use a try/catch PlatformException.
    jpush.getRegistrationID().then((rid) {
      setState(() {
          debugLable = "flutter getRegistrationID: $rid";
        });
    });

    jpush.setup(
      appKey: "a1703c14b186a68a66ef86c1",
      channel: "theChannel",
      production: false,
      debug: true,
      );
    jpush.applyPushAuthority(new NotificationSettingsIOS(
      sound: true,
      alert: true,
      badge: true));

    try {
      
      jpush.addEventHandler(
        onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotification: $message");
        setState(() {
            debugLable = "flutter onReceiveNotification: $message";
          });
      },
      onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification: $message");
        setState(() {
            debugLable = "flutter onOpenNotification: $message";
          });
      },
      onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
        setState(() {
            debugLable = "flutter onReceiveMessage: $message";
          });
      },
      );

    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      debugLable = platformVersion;
    });
  }


// 编写视图
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
            title: Text("会员俱乐部"), 
            centerTitle: true),
        body: Column(
            children: <Widget>[
               Text('result: $debugLable\n'), 
               Center(
                 child: Container(
                    width: 150.0,
                    child: Button(
                      label: '发送本地通知',
                      onPressed: (context) async {
                            // 三秒后出发本地推送
                          var fireDate = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch + 3000);
                          var localNotification = LocalNotification(
                              id: 234,
                              title: '严选通知',
                              buildId: 1,
                              content: '我成功发送了一条通知',
                              fireTime: fireDate,
                              subtitle: '',
                              badge: 1,
                              extra: {"fa": "0"}
                            );
                            jpush.sendLocalNotification(localNotification).then((res) {
                              setState(() {
                                  debugLable = res;
                                });
                            });
                      },
                    ),
                  ),
               ),
               Container(
                    width: 150.0,
                    child: Button(
                      label: '清除通知',
                      onPressed: (context) async {
                            jpush.clearAllNotifications();
                      },
                    ),
                  )
            ],
          )
      );
    
  }
}

