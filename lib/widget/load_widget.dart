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
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///
///
/// @team NESP Technology
/// @author <a href="mailto:1756404649@qq.com">靳兆鲁 Email:1756404649@qq.com</a>
/// @time: Created 19-4-2 下午3:01
/// @project fish_movie
///

class Loading extends StatelessWidget {
  const Loading({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CupertinoActivityIndicator(
          radius: 12,
        ),
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              text,
              style: TextStyle(color:Colors.grey,fontSize: 12),
            ))
      ],
    );
  }
}
