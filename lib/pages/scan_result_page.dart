import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../tools/tools.dart';

class SacnResult  extends StatelessWidget {
  final String barcode;
  SacnResult(this.barcode);
 
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
          title: Text("扫描结果"), 
          centerTitle: true
        ),
        body: Container(
          child: webviewShow(barcode)
        )
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
}

