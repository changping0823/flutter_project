import 'package:flutter/material.dart';

class TagWidget extends StatefulWidget {
  final List<String> tags;
  final Function(String tag,int index)? onTap; // 修改为带索引的回调
  final Color? textColor;
  final double? fontSize;
  final Color? borderColor;
  final Color? fillColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  const TagWidget({
    super.key,
    required this.tags,
    this.onTap,
    this.textColor = Colors.black87,
    this.fontSize = 14,
    this.borderColor,
    this.fillColor = Colors.white,
    this.padding,
    this.borderRadius,
  });

  @override
  State<TagWidget> createState() => _TagWidgetState();
}

class _TagWidgetState extends State<TagWidget> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: widget.tags.asMap().entries.map((entry) {
          final int index = entry.key;
          final String tag = entry.value;
          return _buildCommonlyItem(tag, index);
        }).toList()
          // children: widget.tags.map((item) => _buildCommonlyItem(item)).toList()
      ),
    );
  }

  WidgetSpan _buildCommonlyItem(String tag, int index) {
    return WidgetSpan(
        child: GestureDetector(
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap!(tag, index);
            }
          },
          child: Container(
              margin: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
              padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                  color: widget.fillColor,
                  border: Border.all(color: widget.borderColor ?? Colors.black26),
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(4)
              ),
              child: Text(tag, style: TextStyle(fontSize: widget.fontSize, color: widget.textColor, height: 1))),
        )
    );
  }
}
