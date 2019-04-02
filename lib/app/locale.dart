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
part of movie_app;


/// 多语言代理
/// Created by guoshuyu
/// Date: 2018-08-15
class MovieLocalizationsDelegate
    extends LocalizationsDelegate<MovieLocalizations> {
  MovieLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    ///支持中文和英语
    return ['en', 'zh'].contains(locale.languageCode);
  }

  ///根据locale，创建一个对象用于提供当前locale下的文本显示
  @override
  Future<MovieLocalizations> load(Locale locale) {
    return SynchronousFuture<MovieLocalizations>(MovieLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<MovieLocalizations> old) {
    return false;
  }

  ///全局静态的代理
  static MovieLocalizationsDelegate delegate = MovieLocalizationsDelegate();
}

///自定义多语言实现
class MovieLocalizations {

  final Locale locale;

  MovieLocalizations(this.locale);

  ///根据不同 locale.languageCode 加载不同语言对应
  ///MovieStringEn和MovieStringZh都继承了MovieStringBase
  static Map<String, MovieStringBase> _localizedValues = {
    'en': MovieStringEn(),
    'zh': MovieStringZh(),
  };

  MovieStringBase currentLocalized() {
    return _localizedValues[locale.languageCode];
  }

  ///通过 Localizations 加载当前的 MovieLocalizations
  ///获取对应的 MovieStringBase
  static MovieLocalizations of(BuildContext context) {
    return Localizations.of(context, MovieLocalizations);
  }
}

///使用
//GSYLocalizations.of(context).currentLocalized.app_name
