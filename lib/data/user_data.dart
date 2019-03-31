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

import 'package:fish_movie/model/user.dart';
import 'package:flutter/widgets.dart';

class UserData {

  static final user = User(
    name: '靳兆鲁',
    email: '175404649@qq.com',
    drawerBackgroundImage:
    NetworkImage('http://dahe.cn/xwzx/tp/jrtj/W020050405574155463133.jpg'),
    avatarImage: NetworkImage(
        'https://avatars3.githubusercontent.com/u/23612165?s=40&v=4'),
  );

}