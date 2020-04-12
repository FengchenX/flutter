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

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Route<Object> get route => MaterialPageRoute(
        builder: (context) {
          return NewRoute();
        },
      );

  void _incrementCounter() async {
    var a = new HttpUtil();

    try {
      var r = await a.dio.get("/movies");
      print(r.data);
    } catch (e) {
      print(e);
    }

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('img/tv_bg.jpg'),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent, //把scaffold的背景色改成透明
        appBar: AppBar(
          backgroundColor: Color(0xA38494),
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
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 222,
                  width: 172,
                  child: Image.asset(
                    'img/yingtao.png',
                    fit: BoxFit.fill,
                  ),
                  padding: EdgeInsets.fromLTRB(18, 0, 0, 12),
                )
              ],
            ),
            Row()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
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
