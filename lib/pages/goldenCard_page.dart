import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldenCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GoldenCardState();
  }
}

class _GoldenCardState extends State<GoldenCard> {

  List _imageList = []; //图片列表
  String _imageStr = 'assets/images/avatar.png';

  int _photoIndex = 0; //选择拍照还是相册的索引
  List _actionSheet = [
    {"name": "拍照", "icon": Icon(Icons.camera_alt)},
    {"name": "相册", "icon": Icon(Icons.photo)}
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(180, 40, 45, 1),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                    Navigator.pop(context);
                }),
            title: Text("回馈金卡"), 
            centerTitle: true),
        body: Container(
          width: ScreenUtil().setWidth(750),
          child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              RaisedButton(
                onPressed: _getActionSheet,
                child: Text("选择"),
              ),

              avatar(),

              _imageList.isNotEmpty ? Wrap(
                  spacing: 4.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: _getImageList(),
                ) : Text("暂无内容")

            ],
          ),
        ),
        )
        );
  }

  Widget avatar() {
    return InkWell(
      onTap: () {
        _getActionSheet();
      },
      child: Container(
            width: 70.0,
            height: 70.0,
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(_imageStr)),
          ),
        );
      }

  //图片列表的刻画
  List<Widget> _getImageList() {
    return _imageList.map((img) {
      return Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Stack(
          children: <Widget>[
            Container(
              child: Image.file( img, fit: BoxFit.cover, width: ScreenUtil().setWidth(350), height: ScreenUtil().setHeight(300), ),
            ),
            Positioned(
              right: 5.0,
              top: 5.0,
              child: GestureDetector(
                child: Container(
                    width: 20.0,
                    height: 20.0,
                    color: Colors.lightBlue,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 12.0,
                    ),
                  ),
                onTap: () {
                  setState(() {
                    _imageList.remove(img);
                  });
                },
              ),
            )
          ],
        ),
      );
    }).toList();
  }

  //拍照或者相册选取图片，只能单选
  Future _getImage() async {
    Navigator.of(context).pop();
    var image = await ImagePicker.pickImage(source: _photoIndex == 0 ? ImageSource.camera : ImageSource.gallery);
 
    //没有选择图片或者没有拍照
    if (image != null) {
      setState(() {
        _imageList.add(image);
        // _imageStr = image;
      });
    }
  }

  Future _getActionSheet() async {
    await showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _actionSheet.length,
              itemExtent: 50.0,
              itemBuilder: (innerCtx, i) {
                return ListTile(
                  title: Text(_actionSheet[i]["name"]),
                  leading: _actionSheet[i]["icon"],
                  onTap: () {
                    setState(() {
                      _photoIndex = i;
                    });
                    _getImage();
                  },
                );
              },
            ),
          );
        });
  }
}

