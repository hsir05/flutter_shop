import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';


class DetailsInfoProvide with ChangeNotifier {
  var goodsInfo=null;
  // 从商品后台获取数据
  getGoodsInfo(String id){
    var formData = {'itemId': id};
    print(id);
    request('recItemDetailById', formData).then((val){
      print('========ok========');
      // goodsInfo = DetailsModel.fromJson(val);
      print(val);
      goodsInfo = val;
      notifyListeners();
    });
  }
 
  getRecGoodsInfo(String id){
    var formData = {'itemId': id};
    request('recItemDetailRecById', formData).then((val){
      notifyListeners();
    });
  }

}