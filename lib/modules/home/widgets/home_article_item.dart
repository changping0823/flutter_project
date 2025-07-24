

import 'package:flutter/material.dart';
import 'package:flutter_project/utils/Styles.dart';
import 'package:flutter_project/widgets/web_view.dart';
import 'package:get/get.dart';

import '../models/article.dart';

class HomeArticleItem extends StatefulWidget {
  final Article article;
  const HomeArticleItem({super.key, required this.article});

  @override
  State<HomeArticleItem> createState() => _HomeArticleItemState();
}

class _HomeArticleItemState extends State<HomeArticleItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(WebViewPage(url: widget.article.link ?? ""));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: separatorBorder
        ),
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                          widget.article.shareUser ?? "",
                          style: textStyle_8c_14
                      ),
                      const Spacer(),
                      Text(
                          widget.article.niceDate ?? "",
                          style: textStyle_8c_14
                      ),

                    ],
                  ),
                  const SizedBox(height: 5),
                  RichText(text: TextSpan(
                      children: [
                        /// 【新】标识
                        if (widget.article.fresh) _buildFreshTag(),
                        /// 标题
                        TextSpan(
                          text: widget.article.title ?? "",
                          style: textStyle_26_bold_16,
                        ),
                      ]
                  )),

                  const SizedBox(height: 10),

                  Row(
                      children: [
                        Text(
                            "${widget.article.superChapterName}/${widget.article.chapterName}",
                            style: textStyle_8c_14
                        ),
                      ]
                  )
                ]
            )
        ),
      ),
    );
  }

  _buildFreshTag() {
    return WidgetSpan(
        alignment: PlaceholderAlignment.middle, /// 文字居中
        child: Container(
          margin: const EdgeInsets.only(right: 5),
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.pink, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(2)),
          ),
          child: const Text("新", style: TextStyle(fontSize: 14, color: Colors.pink, height: 1)),
        )
    );
  }
}
