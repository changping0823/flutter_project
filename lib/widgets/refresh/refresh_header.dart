import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_project/utils/Styles.dart';

import 'package:flutter_project/widgets/sequence_image.dart';

class RefreshHeader extends Header {

  const RefreshHeader({
    super.triggerOffset = 70.0, /// 触发任务的偏移量
    super.clamping = false,
    super.position = IndicatorPosition.behind,
  });

  @override
  Widget build(BuildContext context, IndicatorState state) {

    if (state.mode == IndicatorMode.done || state.mode  == IndicatorMode.inactive) {
      return Container();
    }
    return SizedBox(
      height: 60,
      child: Center (
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            _icon(state.mode),
            const SizedBox(width: 8),
            Text(_stateText(state.mode), style: textStyle_26_13,)
          ],
        ),
      ),
    );
  }

  _stateText(IndicatorMode mode) {
    if (mode == IndicatorMode.drag) {
      return '下拉刷新';
    } else if (mode == IndicatorMode.armed) {
      return '松开刷新';
    } else if (mode == IndicatorMode.ready) {
      return '正在加载';
    } else if (mode == IndicatorMode.processed) {
      return '加载完成';
    }
    return '';
  }
  _icon(IndicatorMode mode) {
    if (mode == IndicatorMode.ready) {
      return SequenceImage(paths: _imagePaths(), width: 20);
    }
    if (mode == IndicatorMode.armed) {
      return Image.asset("assets/images/loadings/loading15.png", width: 20);
    }
    return Image.asset("assets/images/loadings/loading00.png", width: 20);

  }

  _imagePaths() {
    List<String> paths = [];
    for (int i = 0; i < 71; i++) {
      String asset = 'assets/images/loadings/loading${i.toString().padLeft(2, '0')}.png';
      paths.add(asset);
    }
    return paths;
  }
}

