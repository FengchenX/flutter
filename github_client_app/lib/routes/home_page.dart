import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:github_client_app/common/Git.dart';
import 'package:github_client_app/common/GmLocalizations.dart';
import 'package:github_client_app/common/UserModel.dart';
import 'package:github_client_app/models/repo.dart';
import 'package:github_client_app/widgets/MyDrawer.dart';
import 'package:github_client_app/widgets/RepoItem.dart';
import 'package:provider/provider.dart';

class HomeRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeRouteState();
  }
}

class _HomeRouteState extends State<HomeRoute> {
  int _pageSize = 20;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(GmLocalizations
            .of(context)
            .home),
      ),
      body:_buildBody(),
      drawer: MyDrawer(),
    );
  }

  Widget _buildBody() {
    UserModel userModel = Provider.of<UserModel>(context);
    if (!userModel.isLogin) {
      //用户未登陆，显示登陆按钮
      return Center(
        child: RaisedButton(
            child: Text(GmLocalizations
                .of(context)
                .login),
            onPressed: () => Navigator.of(context).pushNamed("login")),
      );
    } else {
      //已登陆，则显示项目列表
      return InfiniteListView<Repo>(
        onRetrieveData: (int page, List<Repo> items, bool refresh) async {
          var data = await Git(context).getRepo(
            refresh: refresh,
            queryParameters: {
              'page': page,
              'page_size': _pageSize
            },
          );
          //把请求到的新数据添加到items中
          items.addAll(data);
          // 如果接口返回的数量等于'page_size'，则认为还有数据，反之则认为最后一页
          return data.length==20;
        },
        itemBuilder: (List<Repo> list, int index, BuildContext ctx) {
          // 项目信息列表项
          return RepoItem(list[index]);
        },
      );
    }
  }

}