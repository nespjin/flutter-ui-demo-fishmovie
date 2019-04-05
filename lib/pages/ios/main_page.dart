/*
 * Copyright (c) 2019  NESP Technology Corporation. All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms and conditions of the GNU General Public License,
 * version 2, as published by the Free Software Foundation.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License.See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * If you have any questions or if you find a bug,
 * please contact the author by email or ask for Issues.
 *
 * Author:JinZhaolu <1756404649@qq.com>
 */

import 'package:fish_movie/app/movie_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nesp_flutter_sdk/com/nesp/sdk/flutter/views/views.dart';

class IosApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: getLocale(context).appName,
      theme: CupertinoThemeData(
//        primaryColor: Color(0x007AFFFF),
        primaryColor: Colors.blue,
      ),
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  _HomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<_HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home), title: Text('主页')),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search), title: Text('搜索')),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person), title: Text('我的')),
      ]),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
                defaultTitle: '主页',
                builder: (BuildContext context) => _tabPageHome());
            break;
          case 1:
            return CupertinoTabView(
                defaultTitle: '搜索',
                builder: (BuildContext context) {
                  return Center(
                    child: Text('搜索'),
                  );
                });
            break;
          case 2:
            return CupertinoTabView(
                defaultTitle: '我的',
                builder: (BuildContext context) {
                  return Center(
                    child: Text('我的'),
                  );
                });
            break;
        }
      },
    );
  }
}

class _tabPageHome extends StatefulWidget {
  @override
  _tabPageHomeState createState() => _tabPageHomeState();
}

class _tabPageHomeState extends State<_tabPageHome> {
  int currentItem = 0;

  final Map<int, Widget> tabTitles = const <int, Widget>{
    0: Text('首页'),
    1: Text('电影'),
    2: Text('电视剧'),
    3: Text('综艺'),
    4: Text('动漫'),
  };

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('主页'),
      ),
      child: DefaultTextStyle(
          style: CupertinoTheme.of(context).textTheme.textStyle,
          child: SafeArea(
              child: Column(children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
            ),
            SizedBox(
              width: 500.0,
              child: CupertinoSegmentedControl<int>(
                children: tabTitles,
                onValueChanged: (int newValue) {
                  setState(() {
                    currentItem = newValue;
                  });
                },
                groupValue: currentItem,
              ),
            ),
            Expanded(
              child: Center(
                child: currentItem == 0 ? mainTabPage : tabTitles[currentItem],
              ),
            ),
          ]))),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget mainTabPage = GridView.count(
    primary: false,
    padding: const EdgeInsets.all(0.0),
    mainAxisSpacing: 8.0,
    //竖向间距
    crossAxisCount: 3,
    //横向Item的个数
    crossAxisSpacing: 8.0,
    //横向间距
    children: getVideoItemViews(50000),
  );
}

List<Widget> getVideoItemViews(int sum) {
  List<Widget> result = List<Widget>();
  for (int i = 0; i < sum; i++) {
    result.add(Center(
      child: CupertinoButton(
          color: Colors.blue,
          child: Text('首页 $i'),
          onPressed: () {
            NespToast.showShortToast('Click $i');
          }),
    ));
  }

  return result;
}
