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

part of movie_model;

class User {
  const User({
    this.name,
    this.email,
    this.drawerBackgroundImage,
    this.avatarImage,
  });

  final String name;
  final String email;
  final ImageProvider drawerBackgroundImage;
  final ImageProvider avatarImage;
}