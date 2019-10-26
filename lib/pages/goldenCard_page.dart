import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GoldenCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GoldenCardState();
  }
}

class _GoldenCardState extends State<GoldenCard> {

  List _imageList = []; //图片列表
  String _imageStr = 'assets/images/membg.png';

  int _photoIndex = 0; //选择拍照还是相册的索引
  List _actionSheet = [
    {"name": "拍照", "icon": Icon(Icons.camera_alt)},
    {"name": "相册", "icon": Icon(Icons.photo)}
  ];

  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              RaisedButton(
                onPressed: _getActionSheet,
                child: Text("选择"),
              ),

              avatar(),

              _imageList.isNotEmpty ? Wrap(
                  spacing: 10.0,
                  children: _getImageList(),
                ) : Text("暂无内容")

            ],
          ),
        ));
  }

  Widget avatar() {
    return Container(
      height: 50.0,
      padding: EdgeInsets.only(top: 25, bottom: 25),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_imageStr),
            fit: BoxFit.cover,
          ),
        ),
      child:Container(width:200.0, height: 300.0,child: Text('data'),));
  }

  //图片列表的刻画
  List<Widget> _getImageList() {
    return _imageList.map((img) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          children: <Widget>[
            
            Image.file( img, fit: BoxFit.cover, width: 100.0, height: 70.0, ),
            
            Positioned(
              right: 5.0,
              top: 5.0,
              child: GestureDetector(
                child: Container(
                    width: 15.0,
                    height: 15.0,
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

