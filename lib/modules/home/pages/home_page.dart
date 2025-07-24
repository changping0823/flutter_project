
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/modules/home/widgets/home_article_item.dart';
import 'package:flutter_project/modules/home/widgets/home_banner_widget.dart';
import 'package:flutter_project/utils/color_util.dart';
import 'package:flutter_project/widgets/custom_app_bar.dart';
import 'package:flutter_project/widgets/refresh/refresh_list_view.dart';

import 'package:flutter_project/utils/http_tools/http_util.dart';
import 'package:flutter_project/utils/http_tools/http_response.dart';
import '../models/article.dart';
import '../models/banner_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  List<Article> _articles = [];
  List<BannerModel>? _banners = [];
  int _page = 0;
  int _pageCount = 0;

  @override
  bool get wantKeepAlive => true; // 保持状态

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _queryArticles();
    _queryBanners();

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: CustomAppBar(
          title: '首页',
          showBottomDivider:  false,
        ),
        body: RefreshListView (
          child: _buildListView(),
          onRefresh: () {
            _page = 0;
            _queryArticles(isRefresh: true);
          },
          onLoad: () async {
            if (_page < _pageCount) {
              _page ++;
            }
            await _queryArticles(isRefresh: false);
            if (_page >= _pageCount) {
              return IndicatorResult.noMore;
            }
          },
        )
    );
  }

  _buildListView() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: HomeBannerWidget(banners: _banners),
          );
        }
        return HomeArticleItem(article: _articles[index - 1],);
      },
      itemCount: _articles.length + 1,
    );
  }

  _queryBanners() {
    HttpUtil().get<List<BannerModel>?>('/banner/json').then((value) {
      setState(() {
        _banners = value;
      });
    });

  }
  _queryArticles({bool isRefresh = true}) async {

    HttpResponse<List<Article>?> value = await HttpUtil().getPage<List<Article>?>('/article/list/$_page/json');
    setState(() {
      _pageCount = value.pageCount;
      if (isRefresh) {
        _articles = value.datas!;
      } else {
        _articles.addAll(value.datas ?? []);
      }
    });
  }
}


