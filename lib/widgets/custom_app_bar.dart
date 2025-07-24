import 'package:flutter/material.dart';
import 'package:flutter_project/utils/Styles.dart';
import 'package:flutter_project/utils/color_util.dart';
import 'package:get/get.dart';

enum CustomAppBarThemeType {
  /// 默认
  yellow(ColorUtil.main, Colors.white, 'assets/images/common/icon_back_line_white_24.png', Colors.white),
  /// 白色
  white(Colors.white, ColorUtil.text_26, 'assets/images/common/icon_back_line_black_24.png', ColorUtil.text_26);
  /// 浅蓝色
  // lightBlue(ASColors.lightBlue, ASColors.text26, 'assets/images/common/icon_back_line_black_24.png', ASColors.text26);

  final Color backgroundColor;
  final Color tintColor;
  final String backIcon;
  final Color titleColor;


  const CustomAppBarThemeType(
      this.backgroundColor,
      this.tintColor,
      this.backIcon,
      this.titleColor
      );

}

class CustomAppBar extends AppBar {

  CustomAppBar({
    super.key,
    super.actions,
    PreferredSizeWidget? bottom,
    String? title,
    VoidCallback? onBackPressed,
    bool showBottomDivider = true, /// 是否显示底部分割线，自定义bottom时无效
    CustomAppBarThemeType themeType = CustomAppBarThemeType.yellow,

  }): super(
    title: Text(title?? "", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: themeType.titleColor)),
    bottom: bottom ?? PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: divider_gray_f7_1,
    ),
    bottomOpacity: (showBottomDivider || bottom != null) ? 1.0: 0.0,
    backgroundColor: themeType.backgroundColor,
    toolbarHeight: 44,
    centerTitle:  true, /// 文字居中显示
    automaticallyImplyLeading:  false, /// 隐藏默认返回按钮
    leading: (Get.currentRoute != '/') ? IconButton(
      icon: Image.asset(themeType.backIcon, width: 24, height: 24,),
      onPressed: onBackPressed ?? () {
        Get.back();
        // Get.rou
      },
    ): null,
  );


}

// bool _canGoBack() {
//   return Get.keys[Get.keys.keys.first]?.currentState?.canPop() ?? false;
// }