import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import '../routers/application.dart';
import './searchBar.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({ Key key }) : super(key: key);
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with SingleTickerProviderStateMixin {

  final List<Tab> myTabs = <Tab>[
    Tab(text: '全部'),
    Tab(text: '待付款'),
    Tab(text: '待发货'),
    Tab(text: '已发货'),
    Tab(text: '待评价'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
 void dispose() {
   _tabController.dispose();
   super.dispose();
 }

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
              onPressed: () {})
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          isScrollable: true,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/noInfo.png', width: 130.0,),
                Text('还没有任何订单呢')
              ],
            )
            );
        }).toList(),
      )
    );
  }
}