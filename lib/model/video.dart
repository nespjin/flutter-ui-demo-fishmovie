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

///
///
///
/// @team NESP Technology
/// @author <a href="mailto:1756404649@qq.com">靳兆鲁 Email:1756404649@qq.com</a>
/// @time: Created 19-4-2 下午3:54
/// @project fish_movie
///
class Video {
  Video(
      {this.name = "",
      this.title = "",
      this.status = "",
      this.coverImgUrl = "",
      this.playTypeList,
      this.types = "",
      this.videoClass = "",
      this.score = "",
      this.infoUrl = "",
      this.stars = "",
      this.director = "",
      this.updateTime = "",
      this.showTime = "",
      this.introduction = "",
      this.area = "",
      this.language = ""});

  String name;

  String title;

  String status;

  String coverImgUrl;

  List<PlayType> playTypeList = List<PlayType>();

  String types;

  String videoClass;

  String score;

  String infoUrl;

  String stars;

  String director;

  String updateTime;

  String showTime;

  String introduction;

  String area;

  String language;
}
