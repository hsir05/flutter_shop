import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';
import '../model/category.dart';
import'./leftCategoryNav.dart';
import'./rightCategoryNav.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: <Widget>[
        LeftCategoryNav(),
        Column(children: <Widget>[
          RightCategoryNav()
        ],)
      ],)
    );
  }

  void _getCategory()async{
    await request('getCategory', null).then((val){
      CategoryBigListModel list = CategoryBigListModel.formJson(val['data']['categoryList']);
      list.data.forEach((item)=>print(item.name));
    });
  }
}