import 'package:flutter/material.dart';
import 'package:tianyue/public.dart';

class GridViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GridViewState();
  }
}

class GridViewState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GridView.builder(
          padding: EdgeInsets.fromLTRB(10, Screen.topSafeHeight, 10, 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.03,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
        itemBuilder: null),
    );
  }
}
