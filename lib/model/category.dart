class CategoryBigModel {
  int id; // 类别编号/
  String name; //类别名称
  List <dynamic> subCategoryList; //小类列表
  String focusBanner; //类别图片

  //构造函数
  CategoryBigModel({
    this.id,
    this.name,
    this.subCategoryList,
    this.focusBanner,
  });

 //工厂模式-用这种模式可以省略New关键字
  factory CategoryBigModel.fromJson(dynamic json) {
    return CategoryBigModel(
      id:json['id'],
      name:json['name'],
      focusBanner:json['focusBannerList'][0]['picUrl'],
      subCategoryList:json['subCategoryList']
    );
  }
}

class CategoryBigListModel {
  List<CategoryBigModel> data;
  CategoryBigListModel(this.data);
  factory CategoryBigListModel.formJson(List json){
    return CategoryBigListModel(
      json.map((i)=>CategoryBigModel.fromJson((i))).toList()
    );
  }
}
