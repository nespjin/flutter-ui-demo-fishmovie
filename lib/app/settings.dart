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

part of movie_app;

///
///
/// @team NESP Technology
/// @author <a href="mailto:1756404649@qq.com">靳兆鲁 Email:1756404649@qq.com</a>
/// @time: Created 19-4-2 下午7:08
/// @project fish_movie
///*/

class MovieSettings {
  static pushTheme(BuildContext context, int index) async {
    Store store = movieState(context);
    ThemeData themeData;
    List<MovieThemeColor> colors = getMovieThemeColors();
    themeData = getThemeData(colors[index].color);
    store.dispatch(new RefreshThemeDataAction(themeData));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(MovieSpKeys.themeColor, index);
  }

  static getThemeData(Color color) {
    return ThemeData(primarySwatch: color, platform: TargetPlatform.android);
  }

  static List<MovieThemeColor> getMovieThemeColors() {
    return [
      MovieThemeColor(id: 0, name: '官方蓝', color: MovieThemeColors.movieBlue),
      MovieThemeColor(id: 1, name: '棕  色', color: Colors.brown),
      MovieThemeColor(id: 2, name: '天空蓝', color: Colors.blue),
      MovieThemeColor(id: 3, name: '水鸭绿', color: Colors.teal),
      MovieThemeColor(id: 4, name: '琥珀黄', color: Colors.amber),
      MovieThemeColor(id: 5, name: '蓝灰色', color: Colors.blueGrey),
      MovieThemeColor(id: 6, name: '深橙色', color: Colors.deepOrange),
    ];
  }

  static changeLocale(BuildContext context, int index) async {
    if (index == null) return;
    Store<MovieState> store = movieState(context);
    Locale locale = store.state.platformLocale;
    switch (index) {
      case 0:
        locale = Locale('zh', 'CH');
        break;
      case 1:
        locale = Locale('en', 'US');
        break;
    }
    store.dispatch(RefreshLocaleDataAction(locale));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(MovieSpKeys.language, index);
  }
}

class MovieThemeColor {
  final String name;
  final Color color;
  final int id;

  MovieThemeColor({this.id, this.name, this.color});
}
