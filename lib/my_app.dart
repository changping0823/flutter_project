import 'package:flutter/material.dart';
import 'package:flutter_project/modules/main/main_page.dart';
import 'package:flutter_project/utils/color_util.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'FlutterProject',
      theme: ThemeData(
        // 禁用所有 Material 组件的水波纹效果
        splashFactory: NoSplash.splashFactory,
        // 禁用高亮效果
        highlightColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: ColorUtil.main),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          /// 设置AppBar 的表面颜色为透明色
          surfaceTintColor: Colors.transparent,
        ),
      ),
      home: const MainPage(),
    );
  }
}
