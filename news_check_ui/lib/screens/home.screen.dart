import 'package:flutter/material.dart';
import 'package:news_check/screens/textSearch.screen.dart';
import 'package:news_check/screens/urlSearch.screen.dart';

class HomeScreen extends StatelessWidget {
  static final route = '/';

  final _tabs = <Widget>[
    UrlSearchScreen(),
    TextSearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(200),
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image.asset(
                    'lib/assets/icon.png',
                    height: 120,
                  ),
                  Container(
                      child: Text("News Check", style: TextStyle(color: Colors.white, fontSize: 24),)
                  ),
                  TabBar(
                    tabs: <Widget>[
                      Tab(text: "URL Check",),
                      Tab(text: "Text Check",)
                    ],
                  )
                ],
              ),
            )),
        body: TabBarView(children: _tabs),
      ),
    );
  }
}
