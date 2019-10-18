import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

import 'package:provide/provide.dart';
import'./leftCategoryNav.dart';
import '../model/category.dart';
import '../provide/child_category.dart';
import '../service/service_method.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
    List list=[];

  @override
  void initState() {
    _getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _isLoadFinish(context),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return Container(
              child: Row(children: <Widget>[
                LeftCategoryNav(),

               Flexible(
                 child: Column(children: <Widget>[
                  RightTopBanner(),
                  Expanded(
                    child: RightList(),
                  )
                 ],),
               )

              ],)
            );
          } else { 
            return Center(
                child: CupertinoActivityIndicator(
                    radius: 15.0,
                    animating: false,
                  ),
                );
          }
        });
  }

  void _getCategory(){
     request('getCategory',null).then((val){
        CategoryModel category = CategoryModel.fromJson(val);
        setState(() {
          list = category.data.categoryList;
        });
      });
  }

  Future _isLoadFinish(context) async{
    Provide.value<ChildCategory>(context).getChildCategory(list);
    Provide.value<ChildCategory>(context).changeChildIndex(0, list[0].focusBannerList[0].picUrl);
      return 'end';
  }
}

// 左侧大类
class LeftCateoryNav extends StatefulWidget {
  @override
  _LeftCateoryNavState createState() => _LeftCateoryNavState();
}
class _LeftCateoryNavState extends State<LeftCateoryNav> {
  var listIndex = 0;
  List list = [];

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
                return _leftInkWel(Provide.value<ChildCategory>(context).childCategoryList, index);
              },
            ),
          );
      });
  }

    Widget _leftInkWel(List list, int index){
    return InkWell(
      onTap:(){
        setState(() {
           listIndex=index;
         });
        // var childList = list[index].subCategoryList;
        // var rightTopBanUrl = list[index].focusBannerList[0].picUrl;
        // Provide.value<ChildCategory>(context).getChildCategory(childList, rightTopBanUrl);
        // Provide.value<ChildCategory>(context).childCategoryList
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
        child: Text(list[index].name,style: TextStyle(fontSize:ScreenUtil().setSp(28)),),
      ),
    );
  }
}
// 右侧顶部banner
class RightTopBanner extends StatefulWidget {
  @override
  _RightTopBannerState createState() => _RightTopBannerState();
}

class _RightTopBannerState extends State<RightTopBanner> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Provide<ChildCategory>(
      builder: (context,child,childCategory){
        return Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.only(left:10.0, right: 10.0),
          width: ScreenUtil().setWidth(570),
          height: ScreenUtil().setHeight(200),
          child: Image.network(childCategory.rightTopBanUrl, fit: BoxFit.fill),
        );
      }
    );
  }
}

// 右侧列表
class RightList extends StatefulWidget {
  @override
  _RightListState createState() => _RightListState();
}

class _RightListState extends State<RightList> {
  @override
  Widget build(BuildContext context) {
      return Provide<ChildCategory>(
        builder: (context,child,childCategory){
          var ind = childCategory.childIndex;
          return ListView(
            shrinkWrap: true,
            children: <Widget>[
              _rightWrapList(childCategory.childCategoryList[ind].subCategoryList),
            ],
          );
          // return Container(
          //   width: ScreenUtil().setWidth(570),
          //   height: ScreenUtil().setHeight(900),
          //   padding: EdgeInsets.all(10.0),
          //   color: Colors.black12,
          //   child: _rightWrapList(childCategory.childCategoryList[ind].subCategoryList),
          // );
        });
  }

  Widget _rightWrapList(List list) {
    List<Widget>listWidget = list.map((val){
      return InkWell(
        onTap: (){print('点击了');},
        child: Container(
          width: ScreenUtil().setWidth(175),
          height: ScreenUtil().setHeight(230),
          child: Column(
            children: <Widget>[
              Image.network(val.bannerUrl, width: ScreenUtil().setWidth(170), fit: BoxFit.fill,),
              Text(val.name, overflow: TextOverflow.ellipsis,)
            ],
          ),
        ),
      );
    }).toList();

    return Wrap(
      spacing: 2,
      children: listWidget,
    );
  }
}