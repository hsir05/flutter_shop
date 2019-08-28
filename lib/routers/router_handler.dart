import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/details_page.dart';

Handler detailsHandler = Handler(
  handlerFunc: (BuildContext contxt, Map<String, List<String>> params){
    String itemId = params['id'].first;
    print('index>details itemId is ${itemId}');
    return DetailsPage(itemId);
  }
);