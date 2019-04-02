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
/// @time: Created 19-4-2 下午11:36
/// @project fish_movie
///*/

class MovieSocial {
  static joinQQGroup({Function onException(var e)}) {
    try {
      FlutterNespSocial.joinQQGroup(
        androidKey: '5nmSah5Y5M70eVb28ipvxKHdxW65LhWn',
        iosKey:
            '75c80ad1d9ace96cbf74ca1bb64cd5d4ecfe1883c0c60055525318789d7d5ce5',
        groupUin: '783677527',
      );
    } catch (e) {
      print(e);
      onException(e);
    }
  }

  static openWeibo({Function onException(var e)}) {
    try {
      FlutterNespSocial.openWeiboUser(
        uid: '3619635672',
      );
    } catch (e) {
      print(e);
      onException(e);
    }
  }

  static openWeixin(
      {Function onException(var e), Function onThen(bool isSuccess)}) {
    try {
      FlutterNespSocial.openOtherApp(
        androidPackageName: 'com.tencent.mm',
        androidClassName: 'com.tencent.mm.ui.LauncherUI',
      ).then((isSuccess) {
        onThen(isSuccess);
      });
    } catch (e) {
      print(e);
      onException(e);
    }
  }
}
