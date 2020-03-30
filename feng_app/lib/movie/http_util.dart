import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fengapp/models/index.dart';
import 'package:fengapp/utility/http_util.dart';
import 'package:flutter/cupertino.dart';

class MovieHttpUtil extends HttpUtil {
  MovieHttpUtil(BuildContext context) {
    this.context = context;
    options = Options(
      extra: {
        "context": context,
      },
    );
    // 添加缓存插件
//    dio.interceptors.add()

    // 设置用户token (可能为null, 代表未登录)
  }

  Future<GetMovies> getMovies(PageFilter filter) async {
    var r = await dio.get(
      "/movies",
//      options: options.merge(
////          headers:
////          {
////            HttpHeaders.authorizationHeader: session;
////          },
//          extra: {"noCache": true}),
    );

    return GetMovies.fromJson(r.data["data"]);
  }
}
