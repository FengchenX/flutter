import 'package:fengapp/movie/http_util.dart';
import 'package:flutter/material.dart';
import 'package:fengapp/movie/movie_widget.dart';
import 'package:fengapp/models/index.dart';

class MovieDetailScene extends StatefulWidget {
  static int firstInitTimes = 1;

  final Movie m;
  MovieDetailScene(this.m);

  @override
  State<StatefulWidget> createState() {
    return MovieDetailState();
  }
}

class MovieDetailState extends State<MovieDetailScene> {
  Movie m;
  Video v;

  @override
  void dispose() {
    super.dispose();
    MovieDetailScene.firstInitTimes = 1;
  }

  @override
  void initState() {
    super.initState();
    m = this.widget.m;
    cli = MovieHttpUtil(context);
  }

  MovieHttpUtil cli;
  _get() async {
    Video ret;
    try {
      ret = await cli.getVideo(m.video_id);
    } catch (e) {
      print(e);
    }

    if (!mounted) {
      return;
    }

    setState(() {
      v = ret;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MovieWidget(
      v.url,
      previewImgUrl: v.thumb,
    );
  }
}
