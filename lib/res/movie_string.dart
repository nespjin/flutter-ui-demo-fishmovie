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
part of movie_res;

///汉语实体实现类
class MovieStringZh extends MovieStringBase {
  @override
  String appName = "小丑鱼";
  @override
  String mainVideoTabName = '主页';
  @override
  String movieTabName = '电影';
  @override
  String soapTabName = '电视剧';
  @override
  String varTabName = '综艺';
  @override
  String animeTabName = '动漫';

  @override
  String drawerMenuVip = '会员中心';
  @override
  String drawerMenuQQGroup = 'QQ群';
  @override
  String drawerMenuWeibo = '微博';
  @override
  String drawerMenuWeChat = '微信公众号';
  @override
  String drawerMenuFeedback = '反馈';
  @override
  String drawerMenuHelp = '帮助';
  @override
  String drawerMenuCheckUpdate = '检查更新';
  @override
  String drawerMenuSettings = '设置';
  @override
  String drawerMenuAbout = '关于小丑鱼';

  @override
  String copiedWeChatNum = '微信公众号已经复制，请搜索';
  @override
  String copyWeChatNumFailed='复制失败请重试';
}

///英文实体实现类
class MovieStringEn extends MovieStringBase {
  @override
  String appName = "ClownFishMovie";
  @override
  String mainVideoTabName = 'Home';
  @override
  String movieTabName = 'Movie';
  @override
  String soapTabName = 'Soap Opera';
  @override
  String varTabName = 'Variety';
  @override
  String animeTabName = 'Anime';

  @override
  String drawerMenuVip = 'Vip Center';
  @override
  String drawerMenuQQGroup = 'QQ Group';
  @override
  String drawerMenuWeibo = 'Weibo';
  @override
  String drawerMenuWeChat = 'Weixin';
  @override
  String drawerMenuFeedback = 'Feedback';
  @override
  String drawerMenuHelp = 'Help';
  @override
  String drawerMenuCheckUpdate = 'Check Update';
  @override
  String drawerMenuSettings = 'Settings';
  @override
  String drawerMenuAbout = 'About';


  @override
  String copiedWeChatNum = 'WeChat public number has been copied, please search';
  @override
  String copyWeChatNumFailed='Clip failed, please try again';

}
 ///语言实体基类
abstract class MovieStringBase {
  String appName;

  //Main Page Tab
  String mainVideoTabName;
  String movieTabName;
  String soapTabName;
  String varTabName;
  String animeTabName;

  //Main Page Drawer
  String drawerMenuVip;
  String drawerMenuQQGroup;
  String drawerMenuWeibo;
  String drawerMenuWeChat;
  String drawerMenuFeedback;
  String drawerMenuHelp;
  String drawerMenuCheckUpdate;
  String drawerMenuSettings;
  String drawerMenuAbout;


  String copiedWeChatNum;
  String copyWeChatNumFailed;


  String weChatPublicNum='NESP Technology';
}
