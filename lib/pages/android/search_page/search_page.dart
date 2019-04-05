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

library search_page;

import 'dart:ui';

import 'package:fish_movie/app/movie_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:nesp_flutter_sdk/com/nesp/sdk/flutter/views/views.dart';

///
///
/// @team NESP Technology
/// @author <a href="mailto:1756404649@qq.com">靳兆鲁 Email:1756404649@qq.com</a>
/// @time: Created 19-4-5 上午12:40
/// @project fish_movie
///*/
String _queryText = '';
TextEditingController _searchControl;

class SearchPage extends StatelessWidget {
  static String NAME = "/search_page";

  SearchPage() {
    _searchControl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            _ClearButton(),
          ],
          title: TextField(
            controller: _searchControl,
            cursorRadius: Radius.circular(25),
            style: TextStyle(color: Colors.white),
            autofocus: false,
            onSubmitted: (searchText) {
              _queryText = searchText;
              _startSearch(context);
            },
            onChanged: (queryText) => _queryText = queryText,
            cursorColor: Colors.white,
            decoration:
                InputDecoration(fillColor: Colors.white, hintText: getLocale(context).searchHintText),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back), onPressed: () => pop(context)),
        ),
        body: Column(
          children: <Widget>[
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              childAspectRatio: 2 / 1,
              children: _hotSearchs.map((name) {
                return ActionChip(
                  onPressed: () {
                    ///click chip to display chip text in search box and start search
                    _searchControl.text = _queryText = name;
                    _startSearch(context);
                  },
                  label: Text(name),
                );
              }).toList(),
            ),
          ],
        ));
  }
}

class _ClearButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          _startSearch(context);
        });
  }
}

var _hotSearchs = ['我不是药神', '大佛普拉斯', '流浪地球', '狗十三', '无双', '无名之辈', '暴裂无声'];

///Simulate search tasks, normal business should return Future<bool> instead of void
void _startSearch(BuildContext context) async {
  if (_queryText.isEmpty) {
    NespToast.showShortToast(getLocale(context).pleaseEnterSearchText);
    return;
  }
  showAlertLoadingDialog(context, text: getLocale(context).searching);
  Future.delayed(Duration(seconds: 3)).then((result) {
    ///normal result is bool (success or failed),handle search result here
    ///now we suppose the return is true,and we show a toast
    ///In fact, there are still a lot of things we need to do,
    /// such as hiding hot search, displaying search results, etc. We will use toast instead.
    pop(context); //close loading dialog
    NespToast.showShortToast('搜索 ===$_queryText ==成功');
    _queryText = "";
  });
}
