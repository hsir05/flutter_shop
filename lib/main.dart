import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import './provide/child_category.dart';
import './provide/counter.dart';
import 'index_page.dart';
// void main()=>runApp(MyApp());

void main(){
  var counter =Counter();
  var childCategory=ChildCategory();
  var providers  =Providers();
  providers.provide(Provider<Counter>.value(counter));
  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ChildCategory>.value(childCategory));
  runApp(ProviderNode(child:MyApp(),providers:providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title:'严选',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor:Colors.pink
        ),
        home:IndexPage()
      ),
    );
  }
}