import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import '../model/category.dart';
import '../service/service_method.dart';

class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List list=[];

@override
void initState() {
  _getCategory();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(border: Border(right: BorderSide(width: 1,color: Colors.black12))),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder:  (context, index){
          return _leftInkWel(index);
        },
      ),
    );
  }

  Widget _leftInkWel(int index){
    return InkWell(
      onTap:(){},
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10.0,top: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black12)
          )
        ),
        child: Text(list[index].name,style: TextStyle(fontSize:ScreenUtil().setSp(28)),),
      ),
    );
  }

  void _getCategory()async{
    await request('getCategory',null).then((val){
          CategoryBigListModel category = CategoryBigListModel.formJson(val['data']['categoryList']);
           print('_____++++++++++_______val____++++++++++___');
          print(category.data);
          setState(() {
            list =category.data;
          });
    });
  }

}