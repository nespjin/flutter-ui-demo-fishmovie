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

part of state;


///
/// @team NESP Technology
/// @author <a href="mailto:1756404649@qq.com">靳兆鲁 Email:1756404649@qq.com</a>
/// @time: Created 19-4-2 下午4:47
/// @project fish_movie
///
/// 全局Redux store对象 ，保存State数据
///
///   Store<MovieState> store = StoreProvider.of(context);
class MovieState {
  ///用户
  User user;

  ///主题
  ThemeData themeData;

  ///语言
  Locale locale;

  ///当前手机平台默认语言
  Locale platformLocale;

  BuildContext context;

  MovieState({this.user, this.themeData, this.locale,this.context});
}

MovieState appReducer(MovieState state, action) {
  return MovieState(
    themeData: themeDataReducer(state.themeData, action),
    user: userDataReducer(state.user, action),
    locale: localeDataReducer(state.locale, action),
    context: contextReducer(state.context,action),
   );
}
