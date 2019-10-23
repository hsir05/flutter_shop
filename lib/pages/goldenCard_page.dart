import 'package:flutter/material.dart';
// import 'package:amap_base/amap_base.dart';
import './location.screen.dart';

class GoldenCard extends StatefulWidget {
  @override
  _GoldenCardState createState() => _GoldenCardState();
}

class _GoldenCardState extends State<GoldenCard> {
//  final _amapLocation = AMapLocation();
//   var _result = '定位中...';

//    @override
//   void initState() {
//      print('定位开始前');
//      _initLocation();
//     super.initState();
//   }

//  @override
//     void dispose() {
//        _amapLocation.stopLocate();
//       super.dispose();
//     }

//      //初始化定位监听
//   void _initLocation() async {
//     _amapLocation.init();
//    print('开始定位中');
//     final options = LocationClientOptions(
//       isOnceLocation: false,
//       locatingWithReGeocode: true,
//     );

//     if (await Permissions().requestPermission()) {
//       _amapLocation.startLocate(options).listen((_) => setState(() {
//             _result =
//                 '坐标：${_.longitude}，${_.latitude} @ ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}';
//           }));
//     } else {
//       setState(() {
//         _result = "无定位权限";
//       });
//     }
//   } 

   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(180, 40, 45, 1),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                tooltip: 'search',
                onPressed: () {
                    Navigator.pop(context);
                }),
            title: Text("回馈金卡"), 
            centerTitle: true),
        body: LocationDemo()
    );
  }
}

