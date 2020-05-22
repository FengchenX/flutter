import 'package:fengapp/models/index.dart';
import 'package:fengapp/movie/movie_detail_scene.dart';
import 'package:fengapp/tv/tv_detail_scene.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fengapp/comic_detail/comic_detail_scene.dart';
import 'package:fengapp/comic_detail/comic_reader_scene.dart';
import 'package:fengapp/me/login_scene.dart';
import 'package:fengapp/me/web_scene.dart';
import 'package:fengapp/novel_detail/novel_detail_scene.dart';
import 'package:fengapp/public.dart';
import 'package:fengapp/reader/reader_scene.dart';
import 'package:fengapp/video/video_detail_scene.dart';

class AppNavigator {
  static push(BuildContext context, Widget scene) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (BuildContext context) => scene,
      ),
    );
  }

  static pushNovelDetail(BuildContext context, Novel novel) {
    AppNavigator.push(context, NovelDetailScene(novel.id));
  }

  static pushComicDetail(BuildContext context, String url) {
    AppNavigator.push(context, ComicDetailScene(""));
  }

  static pushComicReader(BuildContext context, String url) {
    AppNavigator.push(context, ComicReaderScene(""));
  }

  static pushVideoDetail(BuildContext context, String url) {
    AppNavigator.push(context, VideoDetailScene());
  }

  static pushMovieDetail(BuildContext context, Movie m) {
    AppNavigator.push(context, MovieDetailScene(m));
  }

  static pushTVDetail(BuildContext context, Tv m) {
    AppNavigator.push(context, TVDetailScene(m));
  }

  static pushLogin(BuildContext context) {
    AppNavigator.push(context, LoginScene());
  }

  static pushWeb(BuildContext context, String url, String title) {
    AppNavigator.push(context, WebScene(url: url, title: title));
  }

  static pushReader(BuildContext context, int articleId) {
    AppNavigator.push(context, ReaderScene(articleId: articleId));
  }
}
