class DetailsModel {
  String code;
  Data data;

  DetailsModel({this.code, this.data});

  DetailsModel.fromJson(Map<String, dynamic> json) {
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
  PersonalRcmdTab personalRcmdTab;
  HotSellTab hotSellTab;

  Data({this.personalRcmdTab, this.hotSellTab});

  Data.fromJson(Map<String, dynamic> json) {
    personalRcmdTab = json['personalRcmdTab'] != null
        ? new PersonalRcmdTab.fromJson(json['personalRcmdTab'])
        : null;
    hotSellTab = json['hotSellTab'] != null
        ? new HotSellTab.fromJson(json['hotSellTab'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.personalRcmdTab != null) {
      data['personalRcmdTab'] = this.personalRcmdTab.toJson();
    }
    if (this.hotSellTab != null) {
      data['hotSellTab'] = this.hotSellTab.toJson();
    }
    return data;
  }
}

class PersonalRcmdTab {
  List<ItemList> itemList;
  Null rcmdItemList;
  String rcmdVer;
  String title;
  int type;
  bool hasMore;

  PersonalRcmdTab(
      {this.itemList,
      this.rcmdItemList,
      this.rcmdVer,
      this.title,
      this.type,
      this.hasMore});

  PersonalRcmdTab.fromJson(Map<String, dynamic> json) {
    if (json['itemList'] != null) {
      itemList = new List<ItemList>();
      json['itemList'].forEach((v) {
        itemList.add(new ItemList.fromJson(v));
      });
    }
    rcmdItemList = json['rcmdItemList'];
    rcmdVer = json['rcmdVer'];
    title = json['title'];
    type = json['type'];
    hasMore = json['hasMore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itemList != null) {
      data['itemList'] = this.itemList.map((v) => v.toJson()).toList();
    }
    data['rcmdItemList'] = this.rcmdItemList;
    data['rcmdVer'] = this.rcmdVer;
    data['title'] = this.title;
    data['type'] = this.type;
    data['hasMore'] = this.hasMore;
    return data;
  }
}

class ItemList {
  int id;
  String name;
  int categoryId;
  String primaryPicUrl;
  String listPicUrl;
  double retailPrice;
  String activityPrice;
  bool soldOut;
  bool few;
  bool last;
  String simpleDesc;
  bool simpleDescClose;
  String extraPrice;
  bool newOnShelf;
  bool forSale;
  String specification;
  bool unShelf;
  bool limitedFlag;
  String limitedTag;
  String productPlace;
  List<ItemTagList> itemTagList;
  Null goodRate;
  Null heat;
  Null repoCount;
  String scenePicUrl;
  bool freshman;
  bool appExclusiveFlag;
  int accessTime;
  int promotionFlag;
  String specTag;
  Null comments;
  Null promBanner;
  Null promLogo;
  Null promDesc;
  bool limitedSingleProm;

  ItemList(
      {this.id,
      this.name,
      this.categoryId,
      this.primaryPicUrl,
      this.listPicUrl,
      this.retailPrice,
      this.activityPrice,
      this.soldOut,
      this.few,
      this.last,
      this.simpleDesc,
      this.simpleDescClose,
      this.extraPrice,
      this.newOnShelf,
      this.forSale,
      this.specification,
      this.unShelf,
      this.limitedFlag,
      this.limitedTag,
      this.productPlace,
      this.itemTagList,
      this.goodRate,
      this.heat,
      this.repoCount,
      this.scenePicUrl,
      this.freshman,
      this.appExclusiveFlag,
      this.accessTime,
      this.promotionFlag,
      this.specTag,
      this.comments,
      this.promBanner,
      this.promLogo,
      this.promDesc,
      this.limitedSingleProm});

  ItemList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['categoryId'];
    primaryPicUrl = json['primaryPicUrl'];
    listPicUrl = json['listPicUrl'];
    retailPrice = json['retailPrice'];
    activityPrice = json['activityPrice'];
    soldOut = json['soldOut'];
    few = json['few'];
    last = json['last'];
    simpleDesc = json['simpleDesc'];
    simpleDescClose = json['simpleDescClose'];
    extraPrice = json['extraPrice'];
    newOnShelf = json['newOnShelf'];
    forSale = json['forSale'];
    specification = json['specification'];
    unShelf = json['unShelf'];
    limitedFlag = json['limitedFlag'];
    limitedTag = json['limitedTag'];
    productPlace = json['productPlace'];
    if (json['itemTagList'] != null) {
      itemTagList = new List<ItemTagList>();
      json['itemTagList'].forEach((v) {
        itemTagList.add(new ItemTagList.fromJson(v));
      });
    }
    goodRate = json['goodRate'];
    heat = json['heat'];
    repoCount = json['repoCount'];
    scenePicUrl = json['scenePicUrl'];
    freshman = json['freshman'];
    appExclusiveFlag = json['appExclusiveFlag'];
    accessTime = json['accessTime'];
    promotionFlag = json['promotionFlag'];
    specTag = json['specTag'];
    comments = json['comments'];
    promBanner = json['promBanner'];
    promLogo = json['promLogo'];
    promDesc = json['promDesc'];
    limitedSingleProm = json['limitedSingleProm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['categoryId'] = this.categoryId;
    data['primaryPicUrl'] = this.primaryPicUrl;
    data['listPicUrl'] = this.listPicUrl;
    data['retailPrice'] = this.retailPrice;
    data['activityPrice'] = this.activityPrice;
    data['soldOut'] = this.soldOut;
    data['few'] = this.few;
    data['last'] = this.last;
    data['simpleDesc'] = this.simpleDesc;
    data['simpleDescClose'] = this.simpleDescClose;
    data['extraPrice'] = this.extraPrice;
    data['newOnShelf'] = this.newOnShelf;
    data['forSale'] = this.forSale;
    data['specification'] = this.specification;
    data['unShelf'] = this.unShelf;
    data['limitedFlag'] = this.limitedFlag;
    data['limitedTag'] = this.limitedTag;
    data['productPlace'] = this.productPlace;
    if (this.itemTagList != null) {
      data['itemTagList'] = this.itemTagList.map((v) => v.toJson()).toList();
    }
    data['goodRate'] = this.goodRate;
    data['heat'] = this.heat;
    data['repoCount'] = this.repoCount;
    data['scenePicUrl'] = this.scenePicUrl;
    data['freshman'] = this.freshman;
    data['appExclusiveFlag'] = this.appExclusiveFlag;
    data['accessTime'] = this.accessTime;
    data['promotionFlag'] = this.promotionFlag;
    data['specTag'] = this.specTag;
    data['comments'] = this.comments;
    data['promBanner'] = this.promBanner;
    data['promLogo'] = this.promLogo;
    data['promDesc'] = this.promDesc;
    data['limitedSingleProm'] = this.limitedSingleProm;
    return data;
  }
}

class ItemTagList {
  int type;
  String name;
  String itemTag;
  String itemTagType;
  bool freshmanExclusive;

  ItemTagList(
      {this.type,
      this.name,
      this.itemTag,
      this.itemTagType,
      this.freshmanExclusive});

  ItemTagList.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    itemTag = json['itemTag'];
    itemTagType = json['itemTagType'];
    freshmanExclusive = json['freshmanExclusive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['name'] = this.name;
    data['itemTag'] = this.itemTag;
    data['itemTagType'] = this.itemTagType;
    data['freshmanExclusive'] = this.freshmanExclusive;
    return data;
  }
}

class HotSellTab {
  List<ItemList> itemList;
  Null rcmdItemList;
  Null rcmdVer;
  String title;
  int type;
  bool hasMore;

  HotSellTab(
      {this.itemList,
      this.rcmdItemList,
      this.rcmdVer,
      this.title,
      this.type,
      this.hasMore});

  HotSellTab.fromJson(Map<String, dynamic> json) {
    if (json['itemList'] != null) {
      itemList = new List<ItemList>();
      json['itemList'].forEach((v) {
        itemList.add(new ItemList.fromJson(v));
      });
    }
    rcmdItemList = json['rcmdItemList'];
    rcmdVer = json['rcmdVer'];
    title = json['title'];
    type = json['type'];
    hasMore = json['hasMore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itemList != null) {
      data['itemList'] = this.itemList.map((v) => v.toJson()).toList();
    }
    data['rcmdItemList'] = this.rcmdItemList;
    data['rcmdVer'] = this.rcmdVer;
    data['title'] = this.title;
    data['type'] = this.type;
    data['hasMore'] = this.hasMore;
    return data;
  }
}

class ItemsList {
  int id;
  String name;
  int categoryId;
  String primaryPicUrl;
  String listPicUrl;
  double retailPrice;
  Null activityPrice;
  bool soldOut;
  bool few;
  bool last;
  String simpleDesc;
  bool simpleDescClose;
  String extraPrice;
  bool newOnShelf;
  bool forSale;
  String specification;
  bool unShelf;
  bool limitedFlag;
  String limitedTag;
  String productPlace;
  List<ItemTagList> itemTagList;
  Null goodRate;
  Null heat;
  Null repoCount;
  String scenePicUrl;
  bool freshman;
  bool appExclusiveFlag;
  int accessTime;
  int promotionFlag;
  Null specTag;
  Null comments;
  Null promBanner;
  Null promLogo;
  Null promDesc;
  bool limitedSingleProm;

  ItemsList(
      {this.id,
      this.name,
      this.categoryId,
      this.primaryPicUrl,
      this.listPicUrl,
      this.retailPrice,
      this.activityPrice,
      this.soldOut,
      this.few,
      this.last,
      this.simpleDesc,
      this.simpleDescClose,
      this.extraPrice,
      this.newOnShelf,
      this.forSale,
      this.specification,
      this.unShelf,
      this.limitedFlag,
      this.limitedTag,
      this.productPlace,
      this.itemTagList,
      this.goodRate,
      this.heat,
      this.repoCount,
      this.scenePicUrl,
      this.freshman,
      this.appExclusiveFlag,
      this.accessTime,
      this.promotionFlag,
      this.specTag,
      this.comments,
      this.promBanner,
      this.promLogo,
      this.promDesc,
      this.limitedSingleProm});

  ItemsList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['categoryId'];
    primaryPicUrl = json['primaryPicUrl'];
    listPicUrl = json['listPicUrl'];
    retailPrice = json['retailPrice'];
    activityPrice = json['activityPrice'];
    soldOut = json['soldOut'];
    few = json['few'];
    last = json['last'];
    simpleDesc = json['simpleDesc'];
    simpleDescClose = json['simpleDescClose'];
    extraPrice = json['extraPrice'];
    newOnShelf = json['newOnShelf'];
    forSale = json['forSale'];
    specification = json['specification'];
    unShelf = json['unShelf'];
    limitedFlag = json['limitedFlag'];
    limitedTag = json['limitedTag'];
    productPlace = json['productPlace'];
    if (json['itemTagList'] != null) {
      itemTagList = new List<ItemTagList>();
      json['itemTagList'].forEach((v) {
        itemTagList.add(new ItemTagList.fromJson(v));
      });
    }
    goodRate = json['goodRate'];
    heat = json['heat'];
    repoCount = json['repoCount'];
    scenePicUrl = json['scenePicUrl'];
    freshman = json['freshman'];
    appExclusiveFlag = json['appExclusiveFlag'];
    accessTime = json['accessTime'];
    promotionFlag = json['promotionFlag'];
    specTag = json['specTag'];
    comments = json['comments'];
    promBanner = json['promBanner'];
    promLogo = json['promLogo'];
    promDesc = json['promDesc'];
    limitedSingleProm = json['limitedSingleProm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['categoryId'] = this.categoryId;
    data['primaryPicUrl'] = this.primaryPicUrl;
    data['listPicUrl'] = this.listPicUrl;
    data['retailPrice'] = this.retailPrice;
    data['activityPrice'] = this.activityPrice;
    data['soldOut'] = this.soldOut;
    data['few'] = this.few;
    data['last'] = this.last;
    data['simpleDesc'] = this.simpleDesc;
    data['simpleDescClose'] = this.simpleDescClose;
    data['extraPrice'] = this.extraPrice;
    data['newOnShelf'] = this.newOnShelf;
    data['forSale'] = this.forSale;
    data['specification'] = this.specification;
    data['unShelf'] = this.unShelf;
    data['limitedFlag'] = this.limitedFlag;
    data['limitedTag'] = this.limitedTag;
    data['productPlace'] = this.productPlace;
    if (this.itemTagList != null) {
      data['itemTagList'] = this.itemTagList.map((v) => v.toJson()).toList();
    }
    data['goodRate'] = this.goodRate;
    data['heat'] = this.heat;
    data['repoCount'] = this.repoCount;
    data['scenePicUrl'] = this.scenePicUrl;
    data['freshman'] = this.freshman;
    data['appExclusiveFlag'] = this.appExclusiveFlag;
    data['accessTime'] = this.accessTime;
    data['promotionFlag'] = this.promotionFlag;
    data['specTag'] = this.specTag;
    data['comments'] = this.comments;
    data['promBanner'] = this.promBanner;
    data['promLogo'] = this.promLogo;
    data['promDesc'] = this.promDesc;
    data['limitedSingleProm'] = this.limitedSingleProm;
    return data;
  }
}