import 'dart:ui';

import 'package:fish_movie/assets/icons.dart';
import 'package:fish_movie/assets/images.dart';
import 'package:fish_movie/model/user.dart';
import 'package:fish_movie/data/user_data.dart';
import 'package:fish_movie/res/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nesp_flutter_sdk/com/nesp/sdk/flutter/views/nesp_toast.dart';
import 'package:nesp_flutter_sdk/com/nesp/sdk/flutter/views/smart_drawer.dart';

class AndroidApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringRes.app_name,
      theme: ThemeData(
//        primaryColor: Color(0x007AFFFF),
        primarySwatch: Colors.blue,
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
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabsName.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(StringRes.app_name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Open shopping cart',
            onPressed: () {
              //go search page
              NespToast.showLongToast('go search page');
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabsName.map((String name) {
            return new Tab(
              text: name,
            );
          }).toList(),
        ),
      ),
      drawer: _mainDrawer,
      body: TabBarView(
        controller: _tabController,
        children: _tabsName.map((String name) {
          return new Padding(
            padding: const EdgeInsets.all(16.0),
            child: new Text(name),
          );
        }).toList(),
      ),
    );
  }
}

BuildContext buildContext;

SmartDrawer _mainDrawer = SmartDrawer(
  widthPercent: 0.8,
  child: ListView(
    padding: EdgeInsets.zero,
    children: _mainDrawerItems(),
  ),
);

List<Widget> _mainDrawerItems() {
  List<Widget> result = List<Widget>();

  //Add Drawer Header
  result.add(UserAccountsDrawerHeader(
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fitWidth,
        image: UserData.user.drawerBackgroundImage,
      ),
    ),
    accountEmail: Text(
      UserData.user.email,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    accountName: Text(UserData.user.name),
    currentAccountPicture: CircleAvatar(
      backgroundImage: UserData.user.avatarImage,
    ),
  ));

  _mainDrawerMenuData.forEach((_MainDrawerMenuDataModel data) {
    //Add Drawer Menu Widget
    result.add(_MainDrawerMenuWidget(
        iconData: data.iconData,
        text: data.text,
        onTab: () {
          NespToast.showShortToast(data.text);
          Navigator.of(buildContext).pop();
        }));
  });

  return result;
}


final _tabsName = ['首页', '电影', '电视剧', '综艺', '动漫'];

final _mainDrawerMenuData = [
  _MainDrawerMenuDataModel(id: 0, text: '会员中心', iconData: NespIcons.vip),
  _MainDrawerMenuDataModel(id: 1, text: 'QQ群', iconData: NespIcons.qq),
  _MainDrawerMenuDataModel(id: 2, text: '微博', iconData: NespIcons.weibo),
  _MainDrawerMenuDataModel(id: 3, text: '微信公众号', iconData: NespIcons.weixin),
  _MainDrawerMenuDataModel(id: 4, text: '反馈', iconData: NespIcons.feedback),
  _MainDrawerMenuDataModel(id: 5, text: '帮助', iconData: NespIcons.help),
  _MainDrawerMenuDataModel(
      id: 6, text: '检查更新', iconData: NespIcons.check_update),
  _MainDrawerMenuDataModel(id: 7, text: '关于小丑鱼', iconData: NespIcons.about),
];

class _MainDrawerMenuDataModel {
  const _MainDrawerMenuDataModel({
    this.id,
    this.text,
    this.iconData,
  });

  final int id;
  final IconData iconData;
  final String text;
}

class _MainDrawerMenuWidget extends StatelessWidget {
  const _MainDrawerMenuWidget({
    Key key,
    this.iconUrl,
    this.text,
    this.iconData,
    this.onTab,
    this.onLongPress,
  }) : super(key: key);

  final String iconUrl;
  final String text;
  final IconData iconData;
  final VoidCallback onTab;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      onTap: this.onTab,
      onLongPress: this.onLongPress,
      title: Text(text),
      leading: iconUrl == null ? Icon(this.iconData) : AssetImage(iconUrl),
    );
  }
}
