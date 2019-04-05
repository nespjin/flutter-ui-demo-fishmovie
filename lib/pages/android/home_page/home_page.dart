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
library home_page;

import 'package:fish_movie/app/movie_app.dart';
import 'package:fish_movie/assets/assets.dart';
import 'package:fish_movie/data/movie_data.dart';
import 'package:fish_movie/model/movie_model.dart';
import 'package:fish_movie/res/movie_res.dart';
import 'package:fish_movie/widget/load_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nesp_flutter_sdk/com/nesp/sdk/flutter/system/system.dart';
import 'package:nesp_flutter_sdk/com/nesp/sdk/flutter/views/smart_drawer.dart';
import 'package:nesp_flutter_sdk/com/nesp/sdk/flutter/views/views.dart';

part 'tab_videos_page.dart';

///
///
/// @team NESP Technology
/// @author <a href="mailto:1756404649@qq.com">靳兆鲁 Email:1756404649@qq.com</a>
/// @time: Created 19-4-2 下午8:45
/// @project fish_movie
///
///
/// 该页面设计的有点差，最好不要用[StatefulWidget]作为根Widget,最好使用[StatelessWidget]包含多个[StatefulWidget]作为Page
///
/// 这样可以通过局部刷新，没必要用根布局刷新，数据量大会卡
///*/
bool _isFirstRunApp = true;

class HomePage extends StatefulWidget {
  static var NAME = '/';

  HomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

var _drawMenuTabId = -1;

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (_isFirstRunApp) {
      //初始化APP
      InitMovieApp.initLocale(context);
      InitMovieApp.initThemeColor(context);
      _isFirstRunApp = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _tabsName = [
      getLocale(context).mainVideoTabName,
      getLocale(context).movieTabName,
      getLocale(context).soapTabName,
      getLocale(context).varTabName,
      getLocale(context).animeTabName,
    ];

    final _mainDrawerMenuData = [
      _MainDrawerMenuDataModel(
          id: 0,
          text: getLocale(context).drawerMenuVip,
          iconData: MovieIcons.vip),
      _MainDrawerMenuDataModel(
          id: 1,
          text: getLocale(context).drawerMenuQQGroup,
          iconData: MovieIcons.qq),
      _MainDrawerMenuDataModel(
          id: 2,
          text: getLocale(context).drawerMenuWeibo,
          iconData: MovieIcons.weibo),
      _MainDrawerMenuDataModel(
          id: 3,
          text: getLocale(context).drawerMenuWeChat,
          iconData: MovieIcons.weixin),
      _MainDrawerMenuDataModel(
          id: 4,
          text: getLocale(context).drawerMenuFeedback,
          iconData: MovieIcons.feedback),
      _MainDrawerMenuDataModel(
          id: 5,
          text: getLocale(context).drawerMenuHelp,
          iconData: MovieIcons.help),
      _MainDrawerMenuDataModel(
          id: 6,
          text: getLocale(context).drawerMenuCheckUpdate,
          iconData: MovieIcons.check_update),
      _MainDrawerMenuDataModel(
          id: 7,
          text: getLocale(context).drawerMenuSettings,
          iconData: MovieIcons.settings),
      _MainDrawerMenuDataModel(
          id: 8,
          text: getLocale(context).drawerMenuAbout,
          iconData: MovieIcons.about),
    ];

    List<Widget> _mainDrawerItems() {
      List<Widget> result = List<Widget>();

      //Add Drawer Header
      result.add(UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: UserData.userMe.drawerBackgroundImage,
          ),
        ),
        accountEmail: Text(
          UserData.userMe.email,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        accountName: Text(UserData.userMe.name),
        currentAccountPicture: CircleAvatar(
          backgroundImage: UserData.userMe.avatarImage,
        ),
      ));

      _mainDrawerMenuData.forEach((_MainDrawerMenuDataModel data) {
        //Add Drawer Menu Widget
        result.add(
          _MainDrawerMenuWidget(
            iconData: data.iconData,
            text: data.text,
            onTab: () {
              switch (data.id) {
                case 6:
                  checkMovieAppUpdate(context);
                  return;
                case 7:
                  goSettingsPage(context);
                  return;
                case 8:
                  showAboutDialog(
                      context: context,
                      children: <Widget>[
                        Text(
                          'Github Repository',
                          style: TextStyle(color: Colors.grey),
                        ),
                        GestureDetector(
                          child: Text(
                            'https://github.com/ns-jin/flutter-ui-demo-fishmovie',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.lightBlue,
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () {
                            launchURL(
                                'https://github.com/ns-jin/flutter-ui-demo-fishmovie');
                          },
                        ),
                        Text(
                          '正式版网址',
                          style: TextStyle(color: Colors.grey),
                        ),
                        GestureDetector(
                          child: Text(
                            'https://nesp.gitee.io/movie',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.lightBlue,
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () {
                            launchURL('https://nesp.gitee.io/movie');
                          },
                        ),
                      ],
                      applicationName: MovieAppInfo.name(context),
                      applicationLegalese: Movie_License,
                      applicationVersion: MovieAppInfo.versionName);
                  return;
              }
              _drawMenuTabId = data.id;
              pop(context);
            },
          ),
        );
      });

      return result;
    }

    SmartDrawer _mainDrawer = SmartDrawer(
      widthPercent: 0.8,
      callback: (isOpen) {
        if (isOpen || _drawMenuTabId == -1) return;
        switch (_drawMenuTabId) {
          case 1:
            MovieSocial.joinQQGroup();
            break;
          case 2:
            MovieSocial.openWeibo();
            break;
          case 3:
            MovieSocial.openWeixin(onThen: (isSuccess) {
              if (!isSuccess) return;
              ClipBoardManager.copyToClipBoard(
                  clipText: MovieStringBase.weChatPublicNum,
                  callBack: (isSuccess) => isSuccess
                      ? NespToast.showLongToast(
                          getLocale(context).copiedWeChatNum)
                      : NespToast.showLongToast(
                          getLocale(context).copyWeChatNumFailed));
            });
            break;
          case 6:
//            checkAppUpdate(context);
            break;
          default:
            NespToast.showShortToast('This page is not implement');
            break;
        }
        _drawMenuTabId = -1;
      },
      child: ListView(
        padding: EdgeInsets.zero,
        children: _mainDrawerItems(),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(getLocale(context).appName),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              //go search page
              goSearchPage(context);
            },
          ),
        ],
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: _tabsName.map((String name) {
            return Tab(
              text: name,
            );
          }).toList(),
        ),
      ),
      drawer: _mainDrawer,
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          TabVideosPage(),
          TabVideosPage(),
          TabVideosPage(),
          TabVideosPage(),
          TabVideosPage(),
        ],
      ),
    );
  }
}

//_body = IndexedStack(
//children: <Widget>[
//TabVideosPage(),
//TabVideosPage(),
//TabVideosPage(),
//TabVideosPage(),
//TabVideosPage(),
//],
//index: _currentPageIndex,
//);
//
//int _currentPageIndex = 0;

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
