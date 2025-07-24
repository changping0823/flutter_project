import 'dart:async';
import 'package:flutter/material.dart';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_project/utils/color_util.dart';
import 'package:flutter_project/widgets/refresh/refresh_footer.dart';
import 'package:flutter_project/widgets/refresh/refresh_header.dart';

class RefreshListView extends StatefulWidget {
  final Widget? child;
   final EasyRefreshController? controller;

   final FutureOr Function()? onRefresh;
   final FutureOr Function()? onLoad;
   final bool refreshOnStart;
   const RefreshListView({
     super.key,
     required this.child,
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
    return Container(
      color: ColorUtil.gray_f7,
      child: EasyRefresh(
        refreshOnStart: widget.refreshOnStart,/// 在开始刷新时立即触发刷新
        resetAfterRefresh: true,/// 刷新完成后重置刷新状态
        onRefresh: widget.onRefresh,
        onLoad: widget.onLoad,
        controller: widget.controller,
        header: const RefreshHeader(),
        footer: const RefreshFooter(),
        child: widget.child,
      ),
    );
  }
}
