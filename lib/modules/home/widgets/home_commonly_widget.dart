import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/tag_widget.dart';
import 'package:flutter_project/widgets/web_view.dart';
import 'package:get/get.dart';
import '../models/commonly.dart';

class HomeCommonlyWidget extends StatefulWidget {
  final List<Commonly> commons;
  const HomeCommonlyWidget({super.key, required this.commons});

  @override
  State<HomeCommonlyWidget> createState() => _HomeCommonlyWidgetState();
}

class _HomeCommonlyWidgetState extends State<HomeCommonlyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('常用网站', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          widget.commons.isEmpty ? const Text('暂无数据') :
          TagWidget(
            tags: widget.commons.map((item) => item.name ?? '').toList(),
            onTap: (text, index) {
              String? url = widget.commons[index].link;
              if (url == null) return;
              Get.to(WebViewPage(url: url));
            },
          )
        ],
      ),
    );
  }


}
