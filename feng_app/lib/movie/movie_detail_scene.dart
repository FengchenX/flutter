import 'package:fengapp/video/video_detail_scene.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:fengapp/public.dart';
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

  @override
  void dispose() {
    super.dispose();
    VideoDetailScene.firstInitTimes = 1;
  }

  @override
  void initState() {
    super.initState();
    m = this.widget.m;
  }

  @override
  Widget build(BuildContext context) {
    return MovieWidget(
      "img/video_2.mp4",
      previewImgUrl: 'img/img_video_2.png',
    );
  }
}
