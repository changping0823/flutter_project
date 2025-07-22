import 'package:flutter/material.dart';
class SequenceImage extends StatefulWidget {
  /// 动画总时长
  final Duration? duration;
  /// paths
  final List<String> paths;
  final double? width;
  final double? height;
  final bool repeat;
  const SequenceImage({
    super.key,
    required this.paths,
    this.duration,
    this.width,
    this.height,
    this.repeat = true
  });

  @override
  State<SequenceImage> createState() => _SequenceImageState();
}

class _SequenceImageState extends State<SequenceImage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _frameCount = 0; // 序列帧总数

  @override
  void initState() {
    super.initState();
    _frameCount = widget.paths.length;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // 动画总时长
    ); // 循环播放
    _controller.repeat(reverse: widget.repeat);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // 计算当前帧索引 (0到_frameCount-1)
        int frameIndex = (_controller.value * _frameCount).floor() % _frameCount;
        String asset = widget.paths[frameIndex];
        return Image.asset(
          asset,
          fit: BoxFit.contain,
          filterQuality: FilterQuality.low, // 优化性能
          width: widget.width,
          height: widget.height,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

