import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static push(BuildContext context, Widget scene) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (BuildContext context) => scene,
      ),
    );
  }

//  static pushMovieDetail(BuildContext context, Movie movie) {
//    AppNavigator.push(context, scene);
//  }
}
