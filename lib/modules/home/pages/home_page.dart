
import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';

import 'package:flutter_project/widgets/custom_app_bar.dart';
import 'package:flutter_project/widgets/refresh/refresh_list_view.dart';

import 'package:flutter_project/utils/http_tools/http_util.dart';
import 'package:flutter_project/utils/http_tools/http_response.dart';

import 'package:flutter_project/modules/home/widgets/home_banner_widget.dart';
import 'package:flutter_project/modules/home/widgets/home_commonly_widget.dart';
import 'package:flutter_project/modules/home/widgets/home_article_item.dart';

import '../models/article.dart';
import '../models/banner_model.dart';
import '../models/commonly.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  List<Article> _articles = [];
  List<BannerModel> _banners = [];
  List<Commonly> _commonly = [];
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
    HttpManager.get<List<Commonly>>('/friend/json', fromJson: (json) {
      if (json is List) {
        return Commonly.fromJsonList(json);
      }
      throw FormatException('Expected List but got ${json.runtimeType}');
    }).then((value) {
      setState(() {
        _commonly = value ?? [];
      });
    });
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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: HomeBannerWidget(banners: _banners),
          )
        ),
        SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: HomeCommonlyWidget(commons: _commonly),
            )
        ),
        SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return HomeArticleItem(article: _articles[index]);
        }, childCount: _articles.length))
      ],

    );
  }

  _queryBanners() {
    HttpManager.get<List<BannerModel>?>('/banner/json', fromJson: (json) {
      // 处理列表类型数据
      if (json is List) {
        return BannerModel.fromJsonList(json);
      }
      throw FormatException('Expected List but got ${json.runtimeType}');
    }).then((value) {
      setState(() {
        _banners = value ?? [];
      });
    });

  }
  _queryArticles({bool isRefresh = true}) async {

    HttpResponse<List<Article>?> value = await HttpManager.getPage<List<Article>?>('/article/list/$_page/json', fromJson: (json) {
      // 处理列表类型数据
      if (json is List) {
        return Article.fromJsonList(json);
      }
      throw FormatException('Expected List but got ${json.runtimeType}');
    });
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


