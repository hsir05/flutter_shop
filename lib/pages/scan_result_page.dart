import 'package:flutter/material.dart';

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
            centerTitle: true),
        body: Container(
          child: Center(child: Padding (
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(barcode, textAlign: TextAlign.center,),
            ),)
        )
    );
  }
}

