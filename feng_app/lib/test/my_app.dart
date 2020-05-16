import 'dart:math';

import 'package:fengapp/utility/http_util.dart';
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
        "new_page": (context) => EchoRoute(),
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
  TabController _tabController;
  String title;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    title = widget.title;
  }

  Route<Object> get route => MaterialPageRoute(
        builder: (context) {
          return NewRoute();
        },
      );

  @override
  Widget build(BuildContext context) {
    return myContainer(title, _tabController, tabs);
  }

  Widget myContainer(String title, TabController _tabController, List tabs) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('img/tv_bg.jpg'),
        fit: BoxFit.fill,
      )),
      child: myScaffold(title, _tabController, tabs),
    );
  }

  myScaffold(String title, TabController _tabController, List tabs) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: myAppBar(title),
      body: myColumn(_tabController, tabs),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
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
        widget.title,
      ),
      centerTitle: true,
    );
  }

  myColumn(TabController _tabController, List tabs) {
    return Column(
      children: <Widget>[topContainer(), bottomContainer()],
    );
  }

  topContainer() {
    return Container(
      color: Color(int.parse('BD8E9C', radix: 16)).withAlpha(250),
      child: Row(
        children: <Widget>[
          thumbContainer(),
          Container(
            height: 222,
            width: 234,
            child: Column(
              children: <Widget>[
                Container(
                  height: 110,
                  width: 234,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 24),
                          ),
                          Text(
                            '9.2分',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 24),
                          ),
                          Text('年份',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0)),
                          Padding(
                            padding: EdgeInsets.only(left: 12),
                          ),
                          Text(
                            '2003',
                            style:
                                TextStyle(color: Colors.white, fontSize: 22.0),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 24),
                          ),
                          Text('类型',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0)),
                          Padding(
                            padding: EdgeInsets.only(left: 12),
                          ),
                          Text(
                            '益智启蒙',
                            style:
                                TextStyle(color: Colors.white, fontSize: 22.0),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  thumbContainer() {
    return Container(
      height: 222,
      width: 172,
      child: Image.asset(
        'img/yingtao.png',
        fit: BoxFit.fill,
      ),
      padding: EdgeInsets.fromLTRB(18, 0, 0, 12),
    );
  }

  bottomContainer() {
    return Container(
      height: 380,
      child: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList()),
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New route'),
      ),
      body: Center(
        child: Text('This is new route'),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('提示'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text('返回'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  Route<Object> get route => MaterialPageRoute(builder: (context) {
        return TipRoute(
          text: '我是提示xxx',
        );
      });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () async {
          var result = await Navigator.push(context, route);
          print('路由返回值: $result');
        },
        child: Text('打开提示项'),
      ),
    );
  }
}

class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Text(
        args,
      ),
    );
  }
}
