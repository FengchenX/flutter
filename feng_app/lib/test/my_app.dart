import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => MyHomePage(
              title: '樱桃小丸子',
            )
      },
//      home: MyHomePage(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String routeName = settings.name;
          // 如果访问的路由页需要登录， 但当前未登录， 则直接返回当前页路由，
          // 引导用户登录， 其他情况则正常打开路由
        });
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List tabs = ["剧集", "简介"];
  String title;

  @override
  void initState() {
    super.initState();
    title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return myContainer(title, tabs);
  }

  myContainer(String title, List tabs) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('img/tv_bg.jpg'),
        fit: BoxFit.fill,
      )),
      child: myScaffold(title, tabs),
    );
  }

  myScaffold(String title, List tabs) {
    return Scaffold(
//        backgroundColor: Colors.transparent,
        appBar: myAppBar(title),
        body: myColumn(tabs));
  }

  myAppBar(String title) {
    return AppBar(
      backgroundColor: Color(int.parse('A58494', radix: 16)).withAlpha(255),
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Color(0xc4f8f5f5),
        ),
      ),
      title: Text(
        title,
      ),
      centerTitle: true,
    );
  }

  myColumn(List tabs) {
    return Column(
      children: <Widget>[topContainer(), bottomContainer(tabs)],
    );
  }

  topContainer() {
    return Container(
      height: 257,
      color: Color(int.parse('BD8E9C', radix: 16)).withAlpha(250),
      child: Row(
        children: <Widget>[
          thumbContainer(),
          detailContainer(),
        ],
      ),
    );
  }

  thumbContainer() {
    return Container(
      height: 243,
      width: 172,
      child: Image.asset(
        'img/yingtao.png',
        fit: BoxFit.fill,
      ),
      padding: EdgeInsets.fromLTRB(15, 12, 2, 0),
    );
  }

  detailContainer() {
    return Container(
      height: 246,
      width: 230,
      child: Column(
        children: <Widget>[
          detailContainer2(),
        ],
      ),
    );
  }

  detailContainer2() {
    return Container(
      height: 130,
      width: 234,
      padding: EdgeInsets.only(top: 18),
      child: Column(
        children: <Widget>[
          scoreRow(),
          yearRow(),
          typeRow(),
        ],
      ),
    );
  }

  scoreRow() {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            '9.2分',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
            ),
          ),
        ),
      ],
    );
  }

  yearRow() {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 24, top: 5),
          child: Text('年份',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white, fontSize: 22.0)),
        ),
        Padding(
          padding: EdgeInsets.only(left: 12, top: 9),
          child: Text(
            '2003',
            style: TextStyle(color: Colors.white, fontSize: 22.0),
          ),
        ),
      ],
    );
  }

  typeRow() {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 24, top: 10),
          child: Text('类型',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white, fontSize: 22.0)),
        ),
        Padding(
          padding: EdgeInsets.only(left: 12, top: 10),
          child: Text(
            '益智启蒙',
            style: TextStyle(color: Colors.white, fontSize: 22.0),
          ),
        ),
      ],
    );
  }

  bottomContainer(List tabs) {
    return Container(
      height: 418,
      width: 400,
//      child: bottomTabController(tabs),
      child: bottomTabController(tabs),
    );
  }

  bottomTabController(List tabs) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          tabBarContainer(tabs),
          Container(
            width: 400,
            height: 350,
            child: TabBarView(
              children: [
                seriesGridView(),
                Container(
                  color: Colors.blue,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  tabBarContainer(List tabs) {
    return Container(
      width: 150,
      height: 50,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: TabBar(
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.black,
        labelStyle: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        tabs: tabs.map((e) => Tab(text: e)).toList(),
      ),
    );
  }

  seriesGridView() {
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, //横轴三个子widget
            childAspectRatio: 1.0 //宽高比为1时，子widget
            ),
        children: seriesButton());
  }

  seriesButton() {
    List series = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    return series
        .map((e) => RaisedButton(
              child: Text(e.toString()),
              onPressed: () {},
            ))
        .toList();
  }
}
