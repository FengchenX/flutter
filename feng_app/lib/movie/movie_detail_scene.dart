import 'package:fengapp/video/video_detail_scene.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:fengapp/public.dart';
import 'package:fengapp/movie/movie_widget.dart';

class MovieDetailScene extends StatefulWidget {
  static int firstInitTimes = 1;

  @override
  State<StatefulWidget> createState() {
    return MovieDetailState();
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
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.page.floor() == _controller.page) {
        eventBus.emit(
            EventVideoPlayPosition + _controller.page.floor().toString(),
            _controller.page.floor());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = List.generate(20, (i) => buildVideoItem(i));
    return Scaffold(
        body: Swiper(
      autoStart: false,
      circular: false,
      direction: Axis.vertical,
      children: children,
      controller: _controller,
    ));
  }

  Widget buildVideoItem(int position) {
    print(position.toString());
    if (position % 2 == 0) {
      return MovieWidget(
        "img/video_1.mp4",
        previewImgUrl: 'img/img_video_1.png',
        positionTag: position,
      );
    } else {
      return MovieWidget(
        "img/video_2.mp4",
        previewImgUrl: 'img/img_video_2.png',
        positionTag: position,
      );
    }
  }
}
