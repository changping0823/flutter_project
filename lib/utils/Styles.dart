import 'package:flutter/material.dart';

import 'color_util.dart';

/// 一般用于列表分割线
Border get separatorBorder => Border(
    bottom: BorderSide(
      color: ColorUtil.gray_f7,
      width: 1,
    )
);

Divider get divider_gray_f7_1 => Divider(
  height: 1,
  color: ColorUtil.gray_f7,
);


/// 文本样式 color:#262626 fontSize:13
TextStyle get textStyle_26_13 => TextStyle(
  color: ColorUtil.text_26,
  fontSize: 13,
);