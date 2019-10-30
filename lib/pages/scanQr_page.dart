import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/services.dart';
import '../tools/tools.dart';

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
          child: webviewShow(barcode)
        ),
    );
  }

   Widget webviewShow(data) {
    if (Util.isWebsite(data)) {
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
    } else {
        return Container(
          padding: EdgeInsets.all(20.0),
          child: Center(child: Text(data)),
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