import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../index_page.dart';
import '../pages/details_page.dart';
import '../pages/order_page.dart';
import '../pages/afterServer_page.dart';
import '../pages/security_page.dart'; 
import '../pages/goldenCard_page.dart'; 
import '../pages/address_page.dart'; 
import '../pages/vip_page.dart'; 
import '../pages/scanQr_page.dart';
import '../pages/setting_page.dart';
import '../pages/theme_page.dart';


Handler homeHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>>params) {
  return IndexPage();
});

Handler settingHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>>params) {
  return Setting();
});

Handler detailsHandler = Handler(
  handlerFunc: (BuildContext contxt, Map<String, List<String>> params){
    String itemId = params['id'].first;
    return DetailsPage(itemId);
  }
);
 
Handler orderHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return OrderPage();
});

Handler afterServerHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AfterServer();
});

Handler securityCenterHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SecurityCenter();
});

Handler goldenCardHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return GoldenCard();
});

Handler addressHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AddressPage();
});

Handler vipHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return VipPage();
});

Handler scanQrHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ScanQrPage();
});

Handler themeHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ThemePage();
});