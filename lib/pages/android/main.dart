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

import 'dart:ui';

import 'package:fish_movie/app/movie_app.dart';
import 'package:fish_movie/data/movie_data.dart';
import 'package:fish_movie/pages/android/home_page/home_page.dart';
import 'package:fish_movie/pages/android/search_page/search_page.dart';
import 'package:fish_movie/pages/android/settings_page/settings_page.dart';
import 'package:fish_movie/pages/movie_localizations_page.dart';
import 'package:fish_movie/res/movie_res.dart';
import 'package:fish_movie/state/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nesp_flutter_sdk/com/nesp/sdk/flutter/io/io.dart';
import 'package:redux/redux.dart';

bool _isFirstRunApp = true;

class AndroidApp extends StatelessWidget {
  /// 创建Store，引用 MovieState 中的 appReducer 实现 Reducer 方法
  /// initialState 初始化 State
  final store = Store<MovieState>(
    appReducer,
    initialState: MovieState(
        user: UserData.userMe,
        themeData: MovieSettings.getThemeData(MovieThemeColors.movieBlue),
        locale: Locale('zh', 'CH')),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: StoreBuilder<MovieState>(
        builder: (context, store) {
          return MaterialApp(
            ///多语言实现代理
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              MovieLocalizationsDelegate.delegate,
            ],
            locale: store.state.locale,
            supportedLocales: [store.state.locale],
            theme: store.state.themeData,
            routes: {
              HomePage.NAME: (context) {
                store.state.platformLocale = Localizations.localeOf(context);
                return MovieLocalizationsPage(
                  child: HomePage(),
                );
              },
              SettingsPage.NAME: (context) {
                return MovieLocalizationsPage(
                  child: SettingsPage(),
                );
              } ,
              SearchPage.NAME: (context) {
                return MovieLocalizationsPage(
                  child: SearchPage(),
                );
              }
            },
          );
        },
      ),
    );
  }
}
