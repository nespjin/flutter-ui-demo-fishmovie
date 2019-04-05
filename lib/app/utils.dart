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
/// @time: Created 19-4-2 下午8:16
/// @project fish_movie
///*/

MovieStringBase getLocale(BuildContext context) {
  return MovieLocalizations.of(context).currentLocalized();
}

//

///替换
pushReplacementNamed(BuildContext context, String routeName) {
  Navigator.pushReplacementNamed(context, routeName);
}

///切换无参数页面
pushNamed(BuildContext context, String routeName) {
  Navigator.pushNamed(context, routeName);
}

///主页
goHomePage(BuildContext context) {
  Navigator.pushReplacementNamed(context, HomePage.NAME);
}

goSettingsPage(BuildContext context) {
  pushNamed(context, SettingsPage.NAME);
}

goSearchPage(BuildContext context) {
//  showSearch(context: context, delegate:searchBarDelegate,query: '');
///showSearch() is Official implementation
  pushNamed(context, SearchPage.NAME);
}

bool pop<T extends Object>(BuildContext context, [T result]) {
  return Navigator.of(context).pop<T>(result);
}

Store<MovieState> movieState(BuildContext context) {
  return StoreProvider.of(context);
}

class InitMovieApp {
  static initLocale(BuildContext context) async {
    int index = await getStrongLocale();
     MovieSettings.changeLocale(context, index);
  }

  static initThemeColor(BuildContext context) async {
    int index = await getStrongThemeColor();
     MovieSettings.pushTheme(context, index);
  }
}

Future<int> getStrongLocale() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  int index = sharedPreferences.getInt(MovieSpKeys.language);
  return (index == null) ? 0 : index;
}

Future<int> getStrongThemeColor() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  int index = sharedPreferences.getInt(MovieSpKeys.themeColor);
  return (index == null) ? 0 : index;
}

///个人中心
//    goPerson(BuildContext context, String userName) {
//    NavigatorRouter(context, new PersonPage(userName));
//  }

Future<bool> checkMovieAppUpdate(BuildContext context) async {
  showAlertLoadingDialog(context, text: getLocale(context).checkingUpdate);
  await Future.delayed(Duration(seconds: 3));
  pop(context);
  NespToast.showShortToast(getLocale(context).isLastVersion);
  return true;
}


  launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

//class searchBarDelegate extends SearchDelegate<String> {
//  @override
//  List<Widget> buildActions(BuildContext context) {
//    return [IconButton(icon: Icon(Icons.search), onPressed: (){})];
//  }
//
//  @override
//  Widget buildLeading(BuildContext context) {
//    return IconButton(icon: Icon(Icons.arrow_back), onPressed: ()=> pop(context));
//  }
//
//  @override
//  Widget buildResults(BuildContext context) {
//    return Text('result');
//  }
//
//  @override
//  Widget buildSuggestions(BuildContext context) {
//    return Text('suggestion');
//  }
//
//
//  @override
//  ThemeData appBarTheme(BuildContext context) {
//    // TODO: implement appBarTheme
//    return super.appBarTheme(context);
//  }
//}
