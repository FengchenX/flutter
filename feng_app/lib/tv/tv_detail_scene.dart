import 'package:fengapp/tv/http_util.dart';
import 'package:flutter/material.dart';
import 'package:fengapp/tv/tv_widget.dart';
import 'package:fengapp/models/index.dart';

class TVDetailScene extends StatefulWidget {
  static int firstInitTimes = 1;

  final Movie m;
  TVDetailScene(this.m);

  @override
  State<StatefulWidget> createState() {
    return TVDetailState();
  }
}

class TVDetailState extends State<TVDetailScene> {
  Movie m;
  Video v;

  @override
  void dispose() {
    super.dispose();
    TVDetailScene.firstInitTimes = 1;
  }

  @override
  void initState() {
    super.initState();
    m = this.widget.m;
    cli = TVHttpUtil(context);
    _get();
  }

  TVHttpUtil cli;
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
    print(v);
  }

  @override
  Widget build(BuildContext context) {
    return TVWidget(
      v.url,
      previewImgUrl: v.thumb,
    );
  }
}
