import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:amap_base/amap_base.dart';
import './provide/child_category.dart';
import './provide/counter.dart';
// import './provide/details_info.dart';
import 'index_page.dart';
import 'package:fluro/fluro.dart';
import './routers/routes.dart';
import './routers/application.dart';

void main() async{
   await AMap.init('d090f6298f62ef936c3e9e9865cc2f34');
  var counter =Counter();
  var childCategory=ChildCategory();
  // var detailsInfoProvide= DetailsInfoProvide();
  var providers  =Providers();
  providers.provide(Provider<Counter>.value(counter));
  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ChildCategory>.value(childCategory));
    // ..provide(Provider<DetailsInfoProvide>.value(detailsInfoProvide));

  runApp(ProviderNode(child:MyApp(),providers:providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

     final router = Router();
    Routes.configureRoutes(router);
    Application.router=router;

    return Container(
      child: MaterialApp(
        title:'严选',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Application.router.generator,
        theme: ThemeData(
          primaryColor:Color.fromRGBO(180, 40, 45, 1)
        ),
        home:IndexPage()
      ),
    );
  }
}