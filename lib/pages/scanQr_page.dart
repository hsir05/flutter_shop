import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flustars/flustars.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_shop/res/resources.dart';
import '../widgets/button.widget.dart';

class ScanQrPage extends StatefulWidget {
  @override
  _ScanQrPageState createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {
  String barcode = '';

  @override
  void initState() {
    scanQr(context);
    super.initState();
  }

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
            title: Text("扫描"), 
            centerTitle: true),
        body: Container(
          child: resultShow(barcode)
        ),
    );
  }

   Widget resultShow(data) {
    if (RegexUtil.isURL(data)) {
      return WebviewScaffold(
        url: data,
        withZoom: false, // 是否缩放 
        withLocalStorage: true,
        withJavascript: true,
        hidden: true,  // 等待页面加载时显示其他小部件 hiden配合initialChild使用
        initialChild: Center(
          child: CupertinoActivityIndicator(
              radius: 15.0,
              animating: true,
            ))
      );
    } if (RegexUtil.isMobileSimple(data)){
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 130.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
              Button(
                label: '电话号码:$data',
                onPressed: (context) async {
                    _launchURL('tel', data);
                },
              ),
            Gaps.vGap50,
            Button(
                label: '发送信息:$data',
                onPressed: (context) async {
                    _launchURL('sms', data);
                },
              ),
          ],
        )
        );
    }else {
        return Container(
          padding: EdgeInsets.all(20.0),
          child: Center(child: Text(data)),
        );
    }
  }

   void _launchURL(type, leaderPhone) async {
    String url='$type:'+leaderPhone;
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(
        msg: '不能访问...',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        fontSize: 14.0
      );
    }
  }

  Future scanQr(context) async {
    try {
      String barcode = await BarcodeScanner.scan();
        print('=========识别到二维码=========');
       setState(() {
        return this.barcode = barcode;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          return this.barcode = '暂无权限!';
        });
      } else {
        setState(() {
          return this.barcode = 'Unknown error: $e';
        });
      }
    } on FormatException{
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}