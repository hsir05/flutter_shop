import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes{
  static String root='/';
  static String detailsPage = '/detail';
  static String orderPage = '/order';
  static String afterServerPage = '/afterServer';
  static String securityCenter = '/securityCenter';
  static String goldenCard = '/goldenCard';
  static String address = '/address'; 
  static String vip = '/vip'; 
  static String cameraApp = '/cameraApp'; 


  // static String searchPage = '/search';
  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params){
        print('ERROR====>ROUTE WAS NOT FONUND!!!');
      }
    );
    router.define(root, handler:homeHandler);

    router.define(detailsPage, handler:detailsHandler);

    router.define(orderPage, handler:orderHandler);

    router.define(afterServerPage, handler:afterServerHandler);

    router.define(securityCenter, handler:securityCenterHandler);

    router.define(goldenCard, handler:goldenCardHandler);

    router.define(address, handler:addressHandler);

    router.define(vip, handler:vipHandler);

    router.define(cameraApp, handler:cameraAppHandler);

    // router.define(searchPage, handler:searchHandler);
    
  }
}