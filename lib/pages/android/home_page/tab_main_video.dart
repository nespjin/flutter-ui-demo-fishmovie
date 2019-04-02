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
part of home_page;

///
///
/// @team NESP Technology
/// @author <a href="mailto:1756404649@qq.com">靳兆鲁 Email:1756404649@qq.com</a>
/// @time: Created 19-4-2 下午2:52
/// @project fish_movie

class TabMainVideo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabMainVideoState();
  }
}

var _tabLoaded = false;

class _TabMainVideoState extends State<TabMainVideo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _tabLoaded
        ? Text("加载完成")
        : Loading(
            text: "正在加载",
          );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future loadData() async {
    await Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _tabLoaded = true;
      });
    });
  }
}
