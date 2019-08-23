import 'package:flutter/material.dart';
import '../model/category.dart';

class ChildCategory with ChangeNotifier {
  List<CategoryList> childCategoryList = [];
   String rightTopBanUrl = 'https://yanxuan-static.nosdn.127.net/hxm/yanxuan-wap/p/20161201/style/img/icon-normal/indexLogo-a90bdaae6b.png';
   int childIndex = 0;

  getChildCategory(List list){
    childCategoryList=list;
    // rightTopBanUrl=banUrl;
    childIndex = 0;
    notifyListeners();
  }

  changeChildIndex(index, String banUrl){
    childIndex = index;
    rightTopBanUrl=banUrl;
    notifyListeners();
  }
}
