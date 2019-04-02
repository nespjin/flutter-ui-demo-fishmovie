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
///
/// @team NESP Technology
/// @author <a href="mailto:1756404649@qq.com">靳兆鲁 Email:1756404649@qq.com</a>
/// @time: Created 19-4-2 下午4:54
/// @project fish_movie**

///通过 flutter_redux 的 combineReducers，创建 Reducer<State>
final userDataReducer = combineReducers<User>([
  ///将Action，处理Action动作的方法，State绑定
  TypedReducer<User, RefreshUserDataAction>((User user, action) {
    user = action.user;
    return user;
  }),
]);

///定义处理 Action 行为的方法，返回新的 State
//User _refresh(User user, action) {
//  user = action.user;
//  return user;
//}

///定义一个 Action 类
///将该 Action 在 Reducer 中与处理该Action的方法绑定
class RefreshUserDataAction {

  final User user;

  RefreshUserDataAction(this.user);
}
