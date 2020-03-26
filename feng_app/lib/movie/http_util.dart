import 'package:dio/dio.dart';
import 'package:fengapp/models/index.dart';
import 'package:flutter/cupertino.dart';

class HttpUtil {
  // 在网络请求过程中可能会需要使用当前的context信息, 比如在请求失败时
  // 打开一个新路由, 而打开新路由需要context信息
  BuildContext context;
  Options _options;
  Dio dio = new Dio(BaseOptions(
    baseUrl: 'http:192.168.1.68:8080',
    headers: {},
  ));

  HttpUtil([this.context]) {
    _options = Options(
      extra: {
        "context": context,
      },
    );
    // 添加缓存插件
//    dio.interceptors.add()

    // 设置用户token (可能为null, 代表未登录)
  }

  Future<Movie> getMovies()
}
