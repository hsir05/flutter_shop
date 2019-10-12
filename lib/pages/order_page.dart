import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../routers/application.dart';
import './searchBar.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(180, 40, 45, 1),
        leading: IconButton(
                  icon: Icon(Icons.home),
                  tooltip: 'search',
                  onPressed: () {
                     Application.router.navigateTo(context,"/");
                  }),
        title: Text("我的订单"),
        centerTitle: true,
          actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search),
                  tooltip: 'search',
                  onPressed: () {
                    showSearch(context: context,delegate: SearchBarDelegate());
                  }),
            IconButton(
                icon: Icon(Icons.shopping_cart),
                tooltip: 'cart',
                onPressed: () {
                  // do nothing
                })
        ],
      ),
      body: Container(
        child: Text('data'),
      )
      );
  }
}