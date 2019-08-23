import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
// import 'dart:convert';
import '../model/category.dart';
import '../provide/child_category.dart';
import '../service/service_method.dart';

class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List list=[];
  var listIndex = 0;

@override
void initState() {
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Provide<ChildCategory>(
      builder: (context,child,childCategory){
        return Container(
            width: ScreenUtil().setWidth(180),
            decoration: BoxDecoration(border: Border(right: BorderSide(width: 1,color: Colors.black12))),
            child: ListView.builder(
              itemCount: childCategory.childCategoryList.length,
              itemBuilder:  (context, index){
                return _leftInkWel(childCategory.childCategoryList, index);
              },
            ),
          );
      });
  }

  Widget _leftInkWel(List cateList, int index){
    return InkWell(
      onTap:(){
        setState(() {
           listIndex=index;
         });
        var childList = cateList[index].subCategoryList;
        var rightTopBanUrl = cateList[index].focusBannerList[0].picUrl;
        print(childList);
        print(rightTopBanUrl);
        Provide.value<ChildCategory>(context).getChildCategory(childList, rightTopBanUrl);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10.0,top: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black12)
          )
        ),
        child: Text(cateList[index].name,style: TextStyle(fontSize:ScreenUtil().setSp(28)),),
      ),
    );
  }
}