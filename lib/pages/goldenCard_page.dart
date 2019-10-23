import 'package:flutter/material.dart';
import 'package:amap_base/amap_base.dart';

import 'package:fluttertoast/fluttertoast.dart';
// import './location.screen.dart';
// import '../widgets/button.widget.dart';

class GoldenCard extends StatefulWidget {
  @override
  _GoldenCardState createState() => _GoldenCardState();
}

class _GoldenCardState extends State<GoldenCard> {
  final _amapLocation = AMapLocation();
  List<Location> _result = [];

    @override
   bool get wantKeepAlive => true;

   @override
  void initState() {
     print('定位开始前');
     _initLocation();
    super.initState();
  }

 @override
    void dispose() {
       _amapLocation.stopLocate();
      super.dispose();
    }

  void _initLocation() async {
   _amapLocation.init();
    final options = LocationClientOptions( isOnceLocation: true, locatingWithReGeocode: true,);

    if (await Permissions().requestPermission()) { 
      
      _amapLocation.getLocation(options)
            .then(_result.add)
            .then((_) => setState(() {
            }));
    } else {
      Fluttertoast.showToast(
            msg: "权限不足...",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            fontSize: 14.0
          );
    }
  } 

   

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
        // body: LocationDemo()
        body: Container(
          child: Column(
            children: <Widget>[
               Flexible(
                child: ListView(
                  children:  _result.map((location) => _ResultItem(location)).toList(),
                ),
          ),
            ],
          ),
        )
    );
  }
}

class _ResultItem extends StatelessWidget {
  final Location _data;

  const _ResultItem(this._data, {Key key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            DateTime.now().toIso8601String(),
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            '${_data.toJson()}',
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

