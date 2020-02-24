import 'package:flutter/material.dart';
import 'package:amap_base/amap_base.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:city_pickers/city_pickers.dart';
import '../widgets/button.widget.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> with AutomaticKeepAliveClientMixin{
  final _amapLocation = AMapLocation();
  List<Location> _result = [];

  String _addressResult = '';

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
     _initLocation();
    super.initState();
  }

 @override
  void dispose() {
      _amapLocation.stopLocate();
    super.dispose();
  }

    show(context) async {
    Result temp  = await CityPickers.showCityPicker(
      context: context,
      height: 400,
    );
    setState(() {
      _addressResult = "${temp.toString()}";
    });
  }

  void _initLocation() async {
   _amapLocation.init();  
    final options = LocationClientOptions( isOnceLocation: true, locatingWithReGeocode: true,);

    if (await Permissions().requestPermission()) { 
      _amapLocation.getLocation(options)
            .then(_result.add)
             .then((_) => setState(() {}));
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
            title: Text("地址管理"), 
            centerTitle: true),
        body: Container(
          child: Column(
            children: <Widget>[
              Button(
                label: '地址联动',
                onPressed: (context) {
                  show(context);
                },
              ),

              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(_addressResult),
              ),

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

