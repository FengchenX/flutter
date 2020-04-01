import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fengapp/models/index.dart';
import 'package:fengapp/utility/http_util.dart';
import 'package:flutter/cupertino.dart';

class TVHttpUtil extends HttpUtil {
  TVHttpUtil(BuildContext context) {
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

  Future<GetTVs> getTVs(PageFilter filter) async {
    try {
      var r = await dio.get(
        "/tvs",
        options: options.merge(headers: {
//            HttpHeaders.authorizationHeader: session;
        }, extra: {
          "noCache": true
        }),
      );

      return GetTVs.fromJson(r.data["data"]);
    } catch (e) {
      print(e);
    }
  }

  Future<Video> getVideo(String id) async {
    try {
      var r = await dio.get("/videos/$id");
      return Video.fromJson(r.data["data"]);
    } catch (e) {
      print(e);
    }
  }
}
