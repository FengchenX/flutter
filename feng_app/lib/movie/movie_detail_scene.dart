import 'package:fengapp/video/video_detail_scene.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:fengapp/public.dart';
import 'package:fengapp/video/video_widget.dart';

class MovieDetailScene extends StatefulWidget {
  static int firstInitTimes = 1;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

class MovieDetailState extends State<MovieDetailScene> {
  SwiperController _controller = SwiperController();

  @override
  void dispose() {
    super.dispose();
    VideoDetailScene.firstInitTimes = 1;
  }
  @override
  Widget build(BuildContext context) {
    List<Widge
    return null;
  }
}
