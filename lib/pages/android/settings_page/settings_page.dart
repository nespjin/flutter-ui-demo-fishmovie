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
library settings_page;

import 'package:fish_movie/app/movie_app.dart';
import 'package:fish_movie/res/movie_res.dart';
import 'package:flutter/material.dart';
import 'package:nesp_flutter_sdk/com/nesp/sdk/flutter/views/views.dart';

///
///
/// @team NESP Technology
/// @author <a href="mailto:1756404649@qq.com">靳兆鲁 Email:1756404649@qq.com</a>
/// @time: Created 19-4-3 下午3:21
/// @project fish_movie
///*/

class SettingsPage extends StatelessWidget {
  static final String NAME = '/settings_page';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(getLocale(context).settingsPageTitle),
      ),
      body: SettingsBody(),
    );
  }
}

int _languageSelectValue;
int _colorSelectValue;

class SettingsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
       child:_CustomSettingsGroup(),
    );
  }
}

class _CustomSettingsGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _SettingsGroup(
      title: '个性化',
      children: <Widget>[
        _SettingsItem(
          title: getLocale(context).settingsItemChangeLang,
          subTitle: '更改区域语言',
          onTab: () => showSingleSelectDialog(context,
              singleSelectDialogDefaultValue: getStrongLocale,
              singleSelectDialogTitle:
                  getLocale(context).settingsItemChangeLang,
              singleSelectDialogData: [
                SingleSelectDialogDataItem(
                    name: getLocale(context).settingsChangeLangChinese, id: 0),
                SingleSelectDialogDataItem(
                    name: getLocale(context).settingsChangeLangEnglish, id: 1)
              ],
              onSingleSelectDialogSelect: (index) {
                _languageSelectValue = index;
              },
              onSingleSelectDialogOkPress: () =>
                  MovieSettings.changeLocale(context, _languageSelectValue)),
        ),
        _SettingsItem(
          title: getLocale(context).settingsItemChangeTheme,
          subTitle: '更改主题颜色',
          onTab: () => showSingleSelectDialog(context,
              singleSelectDialogDefaultValue: getStrongThemeColor,
              singleSelectDialogTitle:
                  getLocale(context).settingsItemChangeTheme,
              singleSelectDialogData:
                  MovieSettings.getMovieThemeColors().map((movieThemeColor) {
                return SingleSelectDialogDataItem(
                  id: movieThemeColor.id,
                  child: ColorChooseItem(
                    title: movieThemeColor.name,
                    color: movieThemeColor.color,
                  ),
                );
              }).toList(),
              onSingleSelectDialogSelect: (index) {
                _colorSelectValue = index;
              },
              onSingleSelectDialogOkPress: () =>
                  MovieSettings.pushTheme(context, _colorSelectValue)),
        ),
      ],
    );
  }
}

showSingleSelectDialog(
  BuildContext context, {
  final String singleSelectDialogTitle,
  final String singleSelectDialogOk,
  final String singleSelectDialogCancel,
  final SingleSelectDialogDefaultValue singleSelectDialogDefaultValue,
  final OnSingleSelectDialogSelect onSingleSelectDialogSelect,
  final Function onSingleSelectDialogOkPress,
  final Function onSingleSelectDialogCancelPress,
  final List<SingleSelectDialogDataItem> singleSelectDialogData,
}) {
  showNsSingleSelectDialog(
    context,
    singleSelectDialogTitle: singleSelectDialogTitle,
    singleSelectDialogOk: getLocale(context).dialogOk,
    singleSelectDialogCancel: getLocale(context).dialogCancel,
    singleSelectDialogDefaultValue: singleSelectDialogDefaultValue,
    onSingleSelectDialogSelect: onSingleSelectDialogSelect,
    onSingleSelectDialogOkPress: onSingleSelectDialogOkPress,
    onSingleSelectDialogCancelPress: onSingleSelectDialogCancelPress,
    singleSelectDialogData: singleSelectDialogData,
  );
}

class _SettingsGroup extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsGroup({Key key, this.title, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    children.insert(
        0,
        Container(
          padding: EdgeInsets.only(bottom: 16, left: 16, top: 16),
          height: 40,
          color: Colors.white,
          child: Text(
            title,
            style: TextStyle(
              color: Color(0xFF909090),
              fontSize: 13,
            ),
          ),
        ));
    return ListView(
      children: children,
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function onTab;

  const _SettingsItem({Key key, this.title, this.subTitle, this.onTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: EdgeInsets.only(
          left: 0,
        ),
        color: Colors.white,
        height: 50,
        child: ListTile(
          isThreeLine: true,
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              subTitle != null
                  ? Text(
                      subTitle,
                      style: TextStyle(fontSize: 11),
                    )
                  : null,
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
