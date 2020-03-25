import 'package:fengapp/app/root_scene.dart';
import 'package:flutter/material.dart';
import 'package:fengapp/app/guide_scene.dart';
import 'package:fengapp/public.dart';

class AppScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'fengapp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          dividerColor: Color(0xffeeeeee),
          scaffoldBackgroundColor: TYColor.paper,
          textTheme: TextTheme(body1: TextStyle(color: TYColor.darkGray)),
        ),
//      home: GuideScene(),
        home: RootScene());
  }
}
