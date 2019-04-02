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
import 'package:fish_movie/widget/load_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nesp_flutter_sdk/com/nesp/sdk/flutter/system/system.dart';
import 'package:nesp_flutter_sdk/com/nesp/sdk/flutter/views/nesp_toast.dart';
import 'package:nesp_flutter_sdk/com/nesp/sdk/flutter/views/smart_drawer.dart';

part 'tab_main_video.dart';

///
///
/// @team NESP Technology
/// @author <a href="mailto:1756404649@qq.com">靳兆鲁 Email:1756404649@qq.com</a>
/// @time: Created 19-4-2 下午8:45
/// @project fish_movie
///*/

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
      AppUtils.getLocale(context).mainVideoTabName,
      AppUtils.getLocale(context).movieTabName,
      AppUtils.getLocale(context).soapTabName,
      AppUtils.getLocale(context).varTabName,
      AppUtils.getLocale(context).animeTabName,
    ];

    final _mainDrawerMenuData = [
      _MainDrawerMenuDataModel(
          id: 0,
          text: AppUtils.getLocale(context).drawerMenuVip,
          iconData: NespIcons.vip),
      _MainDrawerMenuDataModel(
          id: 1,
          text: AppUtils.getLocale(context).drawerMenuQQGroup,
          iconData: NespIcons.qq),
      _MainDrawerMenuDataModel(
          id: 2,
          text: AppUtils.getLocale(context).drawerMenuWeibo,
          iconData: NespIcons.weibo),
      _MainDrawerMenuDataModel(
          id: 3,
          text: AppUtils.getLocale(context).drawerMenuWeChat,
          iconData: NespIcons.weixin),
      _MainDrawerMenuDataModel(
          id: 4,
          text: AppUtils.getLocale(context).drawerMenuFeedback,
          iconData: NespIcons.feedback),
      _MainDrawerMenuDataModel(
          id: 5,
          text: AppUtils.getLocale(context).drawerMenuHelp,
          iconData: NespIcons.help),
      _MainDrawerMenuDataModel(
          id: 6,
          text: AppUtils.getLocale(context).drawerMenuCheckUpdate,
          iconData: NespIcons.check_update),
      _MainDrawerMenuDataModel(
          id: 7,
          text: AppUtils.getLocale(context).drawerMenuSettings,
          iconData: NespIcons.settings),
      _MainDrawerMenuDataModel(
          id: 8,
          text: AppUtils.getLocale(context).drawerMenuAbout,
          iconData: NespIcons.about),
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
              _drawMenuTabId = data.id;
              Navigator.of(context).pop();
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
                  clipText: AppUtils.getLocale(context).weChatPublicNum,
                  callBack: (isSuccess) => isSuccess
                      ? NespToast.showShortToast(
                          AppUtils.getLocale(context).copiedWeChatNum)
                      : NespToast.showShortToast(
                          AppUtils.getLocale(context).copyWeChatNumFailed));
            });
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
        title: Text(AppUtils.getLocale(context).appName),
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
          TabMainVideo(),
          TabMainVideo(),
          TabMainVideo(),
          TabMainVideo(),
          TabMainVideo(),
        ],
      ),
    );
  }
}

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
