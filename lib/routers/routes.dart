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
  static String scanQr = '/scanQr';  
  static String setting = '/setting';
  static String theme = '/theme';

  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params ){
        print('错误====路由未找到');
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
    router.define(scanQr, handler: scanQrHandler); 
    router.define(setting, handler: settingHandler); 
    router.define(theme, handler: themeHandler); 
  }
}