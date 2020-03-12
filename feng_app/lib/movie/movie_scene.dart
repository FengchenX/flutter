import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fengapp/public.dart';
import 'package:fengapp/utility/http.dart';

class MovieScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MovieSceneState();
}

class MovieSceneState extends State<MovieScene> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _get();
  }

  var list = List();
  int page = 1;

  _get() async {
    print("************************************");
    var httpClient = new HttpClient();
    var uri = Uri.http('192.168.201.1:8080', '/movies');
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
//    Map<String, dynamic> data = json.decode(responseBody);

    var data = jsonDecode(responseBody);

    if (!mounted) {
      return;
    }

    setState(() {
      list.addAll(data['data']['movies']);
    });
  }

//  getDatas() async {
//    get2().then((res) {
//      Map<String, dynamic> d = res.data;
//      print(d['data']['movies']);
//    });
////    list = data['data']['movies'];
//
//    for (int i = 0; i < 5; i++) {
//      var elem = Map();
//      elem['thumb'] =
//          'https://wx3.sinaimg.cn/crop.0.0.604.339.360/006QmDx6ly1g2ia60z17lj30gs0b8q5u.jpg';
//      elem['name'] = ((page - 1) * 5 + i).toString();
//      elem['video_id'] = ((page - 1) * 5 + i).toString();
//      list.add(elem);
//    }
//
//    page++;
//  }

  @override
  Widget build(BuildContext context) {
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
            _get();
          }
          if (index == list.length - 1 && list.length < 40) {
            _get();
          }
          return buildMovieItem(list[index]);
        },
      ),
    );
  }

  Widget buildMovieItem(Map<String, dynamic> elem) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          color: TYColor.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(elem['thumb'], fit: BoxFit.cover),
              SizedBox(height: 4),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  elem['name'],
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
        AppNavigator.pushVideoDetail(context, elem['video_id']);
      },
    );
  }
}
