import 'package:flutter/material.dart';
import 'package:tianyue/public.dart';
import 'package:tianyue/utility/http.dart';

class MovieScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MovieSceneState();
}

class MovieSceneState extends State<MovieScene> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 发起网络请求查询电影数据
    getDatas();
  }

  List<Map> list;

  void getDatas() {
    IOHttpUtils client = new IOHttpUtils();
    var data = client.get('');
    list = data['data']['movies'];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var children = list.map((elem) => )
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.fromLTRB(10, Screen.topSafeHeight, 10, 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.03,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: children,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
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
              Image.network(elem[''])
            ],
          ),
        ),
      ),
    )
  }

}
