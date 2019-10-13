import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../index_page.dart';
import '../pages/details_page.dart';
import '../pages/order_page.dart';
import '../pages/afterServer_page.dart';
// import '../pages/searchBar.dart';

Handler homeHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return IndexPage();
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

// Handler searchHandler = Handler(
//   handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return SearchBarDelegate();
// });