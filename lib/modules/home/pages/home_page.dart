
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

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  List<Article>? _articles;
  int _page = 0;
  int _pageCount = 0;
  // final EasyRefreshController _refreshController = EasyRefreshController(
  //   // controlFinishRefresh: true,
  // );
  @override
  bool get wantKeepAlive => true; // 保持状态

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
        onRefresh: () {
          _page = 0;
          _queryArticles(isRefresh: true);
        },
        onLoad: () {
          if (_page < _pageCount) {
            _page ++;
          }
          _queryArticles(isRefresh: false);
        },
      )
    );
  }

  _queryArticles({bool isRefresh = true}) async {

    HttpUtil().get<List<Article>?>('/article/list/$_page/json').then((value){
      setState(() {
        _pageCount = value.pageCount;
        if (isRefresh) {
          _articles = value.datas;
        } else {
          _articles?.addAll(value.datas ?? []);
        }
      });
    });
  }
}


