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
    bool isClick = false;
    isClick = (index == listIndex) ? true : false;
    return InkWell(
      onTap:(){
        setState(() {
           listIndex=index;
         });
        var rightTopBanUrl = cateList[index].focusBannerList[0].picUrl;
        Provide.value<ChildCategory>(context).changeChildIndex(index, rightTopBanUrl);
      },
      child: Container(
        alignment: Alignment.centerLeft,
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 2.0),
        decoration: BoxDecoration(
          // color: isClick ? Color.fromRGBO(236, 236, 236, 1.0) : Colors.white,
          color: Colors.white,
          // border: Border(
          //   bottom: BorderSide(width: 1, color: Colors.black12)
          // )
        ),
        child: leftTextItem(isClick, cateList[index].name, )
      ),
    );
  }

  Widget leftTextItem(bool isClick, String name) {
    if (isClick) {
      return Row(
        children: <Widget>[
          Container(
            width: 2.0,
            height: ScreenUtil().setHeight(60),
            margin: EdgeInsets.only(right: 8.0),
            color: Color.fromRGBO(171, 43, 43, 1.0),
          ),
          Text(
          name,
          style: TextStyle(fontSize:ScreenUtil().setSp(28), color: Color.fromRGBO(171, 43, 43, 1.0)),)
        ],
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Text(
        name,
          style: TextStyle(fontSize:ScreenUtil().setSp(28), color: Color.fromRGBO(51, 51, 51, 1.0) ),),
      );
    }
  }
}