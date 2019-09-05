import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import '../provide/details_info.dart';

class DetailsPage extends StatelessWidget {
  final String itemId;
  DetailsPage(this.itemId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            print('返回上一页');
            Navigator.pop(context);
          },
          ),
          title: Text('商品详情页'),
      ),
      body: FutureBuilder(
        future: _getBackInfo(context),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Container(
              child: Column(children: <Widget>[

              ],),
            );
          } else {
             return SpinKitFadingCircle(
                    color: Colors.black26,
                    size: 50.0,
                  );
          }
        },
      ),
    );
  }

  Future _getBackInfo(BuildContext context)async{
    await Provide.value<DetailsInfoProvide>(context).getRecGoodsInfo(itemId);
    return await Provide.value<DetailsInfoProvide>(context).getGoodsInfo(itemId);
  }
}