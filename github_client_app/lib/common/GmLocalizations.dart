import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Global.dart';

class GmLocalizations {
  GmLocalizations(this._locale,this.language,this.home) : auto = _locale.languageCode;

  //是否为中文
  bool isZh = false;
  Locale _locale;
  String theme="换肤";
  String noDescription="noDescription";
  String home="Github客户端";
  String auto = "auto";
  String language;
  String login="登陆";
  String logout="注销";
    String logoutTip="确定要注销吗";
  String cancel="取消";
  String yes="是的";
  String userName="用户名";
  String userNameOrEmail="用户名或邮箱";
  String userNameRequired="用户名不能为空";
  String password="密码";
  String passwordRequired="密码不能为空";
  String userNameOrPasswordWrong="用户名或密码错误";

  //为了使用方便，我们定义一个静态方法
  static GmLocalizations of(BuildContext context) {
    return Localizations.of(context, GmLocalizations);
  }

  //Locale相关值，title为应用标题
  String get title {
    return isZh ? "Flutter应用" : "Flutter APP";
  }
}

class GmLocalizationsDelegate extends LocalizationsDelegate<GmLocalizations> {
  @override
  bool isSupported(Locale locale) => ["en", "zh"].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<GmLocalizations> load(Locale locale) {
    String language="";
    String homeTitle="";
    switch (locale.languageCode) {
      case 'zh':
        language = "简体中文";
        homeTitle="Github客户端";
        break;
      case 'en':
        language = "English";
        homeTitle="Github client";
        break;
      default:
        language = locale.languageCode;
        homeTitle="Github客户端";
    }
    return SynchronousFuture<GmLocalizations>(GmLocalizations(locale,language,homeTitle));
  }

  @override
  bool shouldReload(LocalizationsDelegate<GmLocalizations> old) {
    // TODO: implement shouldReload
    return false;
  }
}
