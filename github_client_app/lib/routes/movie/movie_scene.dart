
import 'package:flutter/material.dart';
import 'package:github_client_app/common/screen.dart';
import 'package:github_client_app/common/ty_color.dart';

class MovieScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieSceneState();
  }
}

class MovieSceneState extends State<MovieScene> {
  var list = List();
  int page = 1;
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
              return null;
            }
            if (index == list.length - 1) {
//              _get();
                // 获取数据
            }
            return buildMovieItem(list[index]);
          }
      ),
    );
  }

  Widget buildMovieItem(Map elem) {
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
//        AppNavigator.pushVideoDetail(context, elem['video_id']);
          print('click');
      },
    );
  }
}


