import 'dart:async';
import 'package:flutter/material.dart';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_project/widgets/refresh/refresh_header.dart';

class RefreshListView extends StatefulWidget {
   final NullableIndexedWidgetBuilder itemBuilder;
   final int itemCount;
   final EasyRefreshController? controller;

   final FutureOr Function()? onRefresh;
   final FutureOr Function()? onLoad;
   final bool refreshOnStart;
   const RefreshListView({
     super.key,
     required this.itemBuilder,
     required this.itemCount,
     this.controller,
     this.onRefresh,
     this.onLoad,
     this.refreshOnStart = true,
   });

  @override
  State<RefreshListView> createState() => _RefreshListViewState();
}

class _RefreshListViewState extends State<RefreshListView> {
  @override
  Widget build(BuildContext context) {
    return EasyRefresh(

      refreshOnStart: widget.refreshOnStart,/// 在开始刷新时立即触发刷新
      resetAfterRefresh: true,/// 刷新完成后重置刷新状态
      onRefresh: widget.onRefresh,
      onLoad: widget.onLoad,
      controller: widget.controller,
      header: const RefreshHeader(),
      // footer: BubblesHeader(),
      child: ListView.builder(
          itemBuilder: widget.itemBuilder,
          itemCount: widget.itemCount,
      ),
    );
  }
}
