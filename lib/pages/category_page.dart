import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';
import '../model/category.dart';
import'./leftCategoryNav.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    // _getCategory();
    return Container(
      child: LeftCategoryNav()
    );
  }

  void _getCategory()async{
    await request('getCategory', null).then((val){
      print('_____++++++++++_______val____++++++++++___');
      CategoryBigListModel list = CategoryBigListModel.formJson(val['data']['categoryList']);
      list.data.forEach((item)=>print(item.name));
    });
  }
}