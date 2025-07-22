

import 'package:flutter/material.dart';
import 'package:flutter_project/utils/Styles.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: separatorBorder
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.article.title ?? "",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.article.author ?? "",
              style: const TextStyle(
                fontSize: 14,
              )
            )
          ]
        )
      ),
    );
  }
}
