class CategoryModel {
  String code;
  Data data;

  CategoryModel({this.code, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<CategoryList> categoryList;

  Data({this.categoryList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['categoryList'] != null) {
      categoryList = new List<CategoryList>();
      json['categoryList'].forEach((v) {
        categoryList.add(new CategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categoryList != null) {
      data['categoryList'] = this.categoryList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryList {
  int id;
  String name;
  String frontName;
  List<SubCategoryList> subCategoryList;
  List<FocusBannerList> focusBannerList;
  int type;
  List<CategoryGroupList> categoryGroupList;

  CategoryList(
      {this.id,
      this.name,
      this.frontName,
      this.subCategoryList,
      this.focusBannerList,
      this.type,
      this.categoryGroupList});

  CategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    frontName = json['frontName'];
    if (json['subCategoryList'] != null) {
      subCategoryList = new List<SubCategoryList>();
      json['subCategoryList'].forEach((v) {
        subCategoryList.add(new SubCategoryList.fromJson(v));
      });
    }
    if (json['focusBannerList'] != null) {
      focusBannerList = new List<FocusBannerList>();
      json['focusBannerList'].forEach((v) {
        focusBannerList.add(new FocusBannerList.fromJson(v));
      });
    }
    type = json['type'];
    if (json['categoryGroupList'] != null) {
      categoryGroupList = new List<CategoryGroupList>();
      json['categoryGroupList'].forEach((v) {
        categoryGroupList.add(new CategoryGroupList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['frontName'] = this.frontName;
    if (this.subCategoryList != null) {
      data['subCategoryList'] =
          this.subCategoryList.map((v) => v.toJson()).toList();
    }
    if (this.focusBannerList != null) {
      data['focusBannerList'] =
          this.focusBannerList.map((v) => v.toJson()).toList();
    }
    data['type'] = this.type;
    if (this.categoryGroupList != null) {
      data['categoryGroupList'] =
          this.categoryGroupList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategoryList {
  int id;
  String name;
  String frontName;
  String bannerUrl;
  String prettyBannerUrl;
  int superCategoryId;

  SubCategoryList(
      {this.id,
      this.name,
      this.frontName,
      this.bannerUrl,
      this.prettyBannerUrl,
      this.superCategoryId});

  SubCategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    frontName = json['frontName'];
    bannerUrl = json['bannerUrl'];
    prettyBannerUrl = json['prettyBannerUrl'];
    superCategoryId = json['superCategoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['frontName'] = this.frontName;
    data['bannerUrl'] = this.bannerUrl;
    data['prettyBannerUrl'] = this.prettyBannerUrl;
    data['superCategoryId'] = this.superCategoryId;
    return data;
  }
}

class FocusBannerList {
  int id;
  String picUrl;
  String targetUrl;

  FocusBannerList({this.id, this.picUrl, this.targetUrl});

  FocusBannerList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    picUrl = json['picUrl'];
    targetUrl = json['targetUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['picUrl'] = this.picUrl;
    data['targetUrl'] = this.targetUrl;
    return data;
  }
}

class CategoryGroupList {
  int id;
  String name;
  List<CategoryList> categoryList;

  CategoryGroupList({this.id, this.name, this.categoryList});

  CategoryGroupList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['categoryList'] != null) {
      categoryList = new List<CategoryList>();
      json['categoryList'].forEach((v) {
        categoryList.add(new CategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.categoryList != null) {
      data['categoryList'] = this.categoryList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}