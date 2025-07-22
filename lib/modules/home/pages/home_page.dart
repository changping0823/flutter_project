
import 'package:flutter/material.dart';
import 'package:flutter_project/modules/home/widgets/home_article_item.dart';
import 'package:flutter_project/utils/Styles.dart';
import 'package:flutter_project/utils/color_util.dart';
import 'package:flutter_project/widgets/custom_app_bar.dart';
import 'package:flutter_project/widgets/refresh/refresh_list_view.dart';

import 'package:flutter_project/utils/http_tools/http_util.dart';

import '../models/article.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Article>? _articles;
  // final EasyRefreshController _refreshController = EasyRefreshController(
  //   // controlFinishRefresh: true,
  // );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _queryArticles();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '首页',
        showBottomDivider:  false,

      ),
      body: RefreshListView (
        itemBuilder: (BuildContext context, int index) {
          return HomeArticleItem(article: _articles![index],);
        },
        itemCount: _articles?.length ?? 0,
        onRefresh: _queryArticles,
      )
    );
  }

  _queryArticles() async {
    HttpUtil().get<List<Article>?>('/article/list/0/json').then((value){
      setState(() {
        _articles = value.datas;
        // _refreshController.finishRefresh();
      });
    });
  }
}


