import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:github_client_app/routes/LanguageRoute.dart';
import 'package:github_client_app/routes/LoginRoute.dart';
import 'package:github_client_app/routes/ThemeChangeRoute.dart';
import 'package:github_client_app/routes/home_page.dart';
import 'package:provider/provider.dart';

import 'common/Global.dart';
import 'common/GmLocalizations.dart';
import 'common/LocaleModel.dart';
import 'common/ThemeModel.dart';
import 'common/UserModel.dart';

//void main() => Global.init().then((e) => runApp(MyApp()));

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((e) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: LocaleModel()),
        ChangeNotifierProvider.value(value: UserModel()),
      ],
      child: Consumer2<ThemeModel, LocaleModel>(builder:
          (BuildContext context, themeModel, localeModel, Widget child) {
        return MaterialApp(
          theme: ThemeData(
            primaryColor: themeModel.theme,
          ),
          onGenerateTitle: (context) {
            return GmLocalizations.of(context).title;
          },
          home: HomeRoute(),
          locale: localeModel.getLocale(),
          //我们只支持美国英语和中文简体
          supportedLocales: [
            const Locale('en', 'US'),
            const Locale('zh', 'CN'),
          ],
          localizationsDelegates: [
            // 本地化的代理类
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GmLocalizationsDelegate()
          ],
          localeResolutionCallback:
              (Locale _locale, Iterable<Locale> supportedLocales) {
            if (localeModel.getLocale() != null) {
              //如果已经选定语言，则不跟随系统
              return localeModel.getLocale();
            } else {
              Locale locale;
              //APP语言跟随系统语言，如果系统语言不是中文简体或美国英语，
              //则默认使用美国英语
              if (supportedLocales.contains(_locale)) {
                locale = _locale;
              } else {
                locale = Locale('en', 'US');
              }
              return locale;
            }
          },
          // 注册命名路由表
          routes: <String, WidgetBuilder>{
            "themes": (context) => ThemeChangeRoute(),
            "language": (context) => LanguageRoute(),
            "login": (context) => LoginRoute(),
          },
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
