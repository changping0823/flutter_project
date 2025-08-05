import 'package:flutter/material.dart';
import 'package:flutter_project/modules/main/main_page.dart';
import 'package:flutter_project/utils/theme_util.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CustomThemeMode _themeMode = CustomThemeMode.light;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FlutterProject',
      theme: ThemeUtil.lightThemeData(),
      darkTheme: ThemeUtil.darkThemeData(),
      themeMode: _themeMode == CustomThemeMode.light ? ThemeMode.light : ThemeMode.dark,
      home: const MainPage(),
    );

  }

  _getThemeMode() {
    final themeMode = ThemeUtil.instance.themeMode;
    setState(() {
      _themeMode = themeMode;
    });
  }
}
