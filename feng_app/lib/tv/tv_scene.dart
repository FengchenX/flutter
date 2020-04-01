import 'dart:convert';
import 'dart:io';
import 'package:fengapp/tv/http_util.dart';
import 'package:fengapp/widget/loading_indicator.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:fengapp/public.dart';
import 'package:fengapp/models/index.dart';
import 'package:fengapp/movie/http_util.dart';

class TVScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TVSceneState();
}

class TVSceneState extends State<TVScene> {
  @override
  void initState() {
    super.initState();
    cli = TVHttpUtil(context);
    _get();
    print("initState");
  }

  var list = List();
  int page = 1;
  TVHttpUtil cli;
  PageFilter filter;
  bool requesting = false;
  _get() async {
//    var httpClient = new HttpClient();
//    var uri = Uri.http('172.17.165.97:8080', '/movies');
//    var request = await httpClient.getUrl(uri);
//    var response = await request.close();
//    var responseBody = await response.transform(utf8.decoder).join();
//    Map<String, dynamic> data = json.decode(responseBody);

    requesting = true;
    GetTVs gettvs;
    try {
      gettvs = await cli.getTVs(filter);
    } catch (e) {
      print(e);
    }
    requesting = false;
    if (!mounted) {
      return;
    }

    print(gettvs);
    setState(() {
      list.addAll(gettvs.tvs);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!requesting) {
      return Scaffold(
        body: GridView.builder(
          padding: EdgeInsets.fromLTRB(10, Screen.topSafeHeight, 10, 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.03,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            if (list.length == 0) {
              return null;
            }
            if (index == list.length - 1) {
              _get();
            }
            return buildMovieItem(list[index]);
          },
        ),
      );
    } else {
      print('#######################');
      return Scaffold();
    }
  }

  Widget buildMovieItem(Tv m) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          color: TYColor.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(m.thumb, fit: BoxFit.cover),
              SizedBox(height: 4),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  m.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SizedBox(height: 4),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: <Widget>[
                    Image.asset("img/play_video.png",
                        color: TYColor.gray, height: 14, width: 14),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            style: new TextStyle(
                                fontSize: 14,
                                color: TYColor.primary,
                                decoration: TextDecoration.none),
                            text: "1.3万"),
                        TextSpan(
                            style: new TextStyle(
                                fontSize: 14,
                                color: TYColor.gray,
                                decoration: TextDecoration.none),
                            text: "次播放")
                      ]),
                    ),
                    Expanded(child: Container()),
                    Text(
                      "1305赞",
                      style: TextStyle(
                          fontSize: 14,
                          color: TYColor.gray,
                          decoration: TextDecoration.none),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
//        AppNavigator.pushMovieDetail(context, m);
      },
    );
  }
}
