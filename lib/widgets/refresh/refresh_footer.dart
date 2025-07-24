
import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_project/utils/Styles.dart';
import 'package:flutter_project/utils/color_util.dart';
import 'package:flutter_project/widgets/sequence_image.dart';

class RefreshFooter extends Footer {
  final Key? key;
  const RefreshFooter({
    this.key,
    super.triggerOffset = 46,
    super.infiniteOffset = 46,
    super.clamping = false,
    super.position = IndicatorPosition.behind,
  });

  @override
  Widget build(BuildContext context, IndicatorState state) {
    debugPrint('state.mode: ${state.mode}');
    return SizedBox(
      height: 46,
      child: (state.result == IndicatorResult.noMore) ? _buildNoMoreWidget(state) : _buildLoadingWidget(state),
    );
  }
  
  _buildLoadingWidget(IndicatorState state) {
    return Center (
      child: Row (
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          _icon(state.mode),
          const SizedBox(width: 8),
          Text(_stateText(state.mode), style: textStyle_26_13,)
        ],
      ),
    );
  }
  _buildNoMoreWidget(IndicatorState state) {
    return Center (
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLinearGradientWidget([const Color(0x00D9D9D9), ColorUtil.gray_d9]),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text('我是有底线的', style: textStyle_8c_12,),
          ),
          _buildLinearGradientWidget([ColorUtil.gray_d9, const Color(0x00D9D9D9)]),

        ],
      ),
    );
  }

  _stateText(IndicatorMode mode) {
    if (mode == IndicatorMode.drag) {
      return '上拉加载更多';
    } else if (mode == IndicatorMode.armed) {
      return '松开加载';
    } else if (mode == IndicatorMode.processing) {
      return '正在加载';
    } else if (mode == IndicatorMode.processed) {
      return '加载完成';
    }
    return '';
  }
  _icon(IndicatorMode mode) {
    if (mode == IndicatorMode.processing) {
      return SequenceImage(paths: _imagePaths(), width: 20);
    }
    if (mode == IndicatorMode.armed) {
      return Image.asset("assets/images/loadings/loading15.png", width: 20);
    }
    return Image.asset("assets/images/loadings/loading00.png", width: 20);

  }

  _buildLinearGradientWidget(List<Color> colors) {
    return Container(
      width: 23,
      height: 2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors, // 渐变的颜色
          begin: Alignment.centerLeft,         // 渐变开始的位置
          end: Alignment.centerRight,       // 渐变结束的位置
        ),
      ),
    );
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