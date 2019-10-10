import 'package:flutter/material.dart';
import './searchBar.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _hasdeleteIcon = false;
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: Icon(Icons.search),
          onTap: (){
            showSearch(context: context,delegate: SearchBarDelegate());
          },
        )
      ),
    );
  }
}
