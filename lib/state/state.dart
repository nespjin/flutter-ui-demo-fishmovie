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
library state;

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import '../model/movie_model.dart';

part 'locale_state.dart';

part 'theme_state.dart';

part 'user_state.dart';

part 'movie_state.dart';

///
///
/// @team NESP Technology
/// @author <a href="mailto:1756404649@qq.com">靳兆鲁 Email:1756404649@qq.com</a>
/// @time: Created 19-4-3 上午1:11
/// @project fish_movie
///*/

final contextReducer = combineReducers<BuildContext>([
  TypedReducer<BuildContext, RefreshContextAction>(
      (BuildContext context, action) {
    context = action.context;
    return context;
  }),
]);

class RefreshContextAction {
  final BuildContext context;

  RefreshContextAction(this.context);
}
