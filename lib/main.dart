import 'package:flutter/material.dart';
import 'package:flutter_project/utils/theme_util.dart';

import 'my_app.dart';

void main() async {
  // 确保 Flutter 绑定已经初始化
  WidgetsFlutterBinding.ensureInitialized();
  final themeUtil = ThemeUtil.instance;
  // themeUtil.getThemeMode();

  runApp(const MyApp());
}


