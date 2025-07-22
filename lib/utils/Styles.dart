import 'package:flutter/material.dart';

import 'color_util.dart';

/// 一般用于列表分割线
Border get separatorBorder => const Border(
    bottom: BorderSide(
      color: ColorUtil.gray_f7,
      width: 1,
    )
);

Divider get divider_gray_f7_1 => const Divider(
  height: 1,
  color: ColorUtil.gray_f7,
);


/// 文本样式 color:#262626 fontSize:13
TextStyle get textStyle_26_13 => const TextStyle(
  color: ColorUtil.text_26,
  fontSize: 13,
);

TextStyle get textStyle_26_14 => const TextStyle(
  color: ColorUtil.text_26,
  fontSize: 14,
);

TextStyle get textStyle_26_15 => const TextStyle(
  color: ColorUtil.text_26,
  fontSize: 15,
);
TextStyle get textStyle_26_16 => const TextStyle(
  color: ColorUtil.text_26,
  fontSize: 16,
);

TextStyle get textStyle_26_bold_16 => const TextStyle(
  color: ColorUtil.text_26,
  fontWeight: FontWeight.bold,
  fontSize: 16,
);

TextStyle get textStyle_8c_14 => const TextStyle(
  color: ColorUtil.text_8c,
  fontSize: 14,
);