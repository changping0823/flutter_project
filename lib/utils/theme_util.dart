
import 'package:flutter/material.dart';
import 'package:flutter_project/utils/color_util.dart';
import 'package:flutter_project/utils/shared_preferences_util.dart';
import 'package:get/get.dart';

enum CustomThemeMode {
  light(0, 'light'),
  dark(1, 'dark'),
  system(2, 'system');

  const CustomThemeMode(this.value, this.name);

  final int value;
  final String name;

}

class ThemeUtil {

  // static final ThemeUtil _instance = ThemeUtil._internal();
  // factory ThemeUtil() {
  //   return _instance;
  // }
  // ThemeUtil._internal();

  // 1. 私有静态实例变量，存储唯一的实例
  static final ThemeUtil _instance = ThemeUtil._internal();

  // 2. 私有的命名构造函数（防止外部随意 `new CartManager()`）
  ThemeUtil._internal() {
    // 这里可以进行一些初始化工作
    print('主题工具初始化');
    _getThemeMode();
  }

  // 3. 公共的、静态的访问点（全局访问点）
  static ThemeUtil get instance => _instance;


  void doSomething() {
    print('Doing something in singleton');
  }

  static ThemeData lightThemeData() {
    return ThemeData(
      brightness: Brightness.light, // 亮色主题
      // 禁用所有 Material 组件的水波纹效果
      splashFactory: NoSplash.splashFactory,
      // 禁用高亮效果
      highlightColor: Colors.transparent,
      colorScheme: const ColorScheme.light().copyWith(
        brightness: Brightness.light,
        primary: Colors.blue,          // 主品牌色
        onPrimary: Colors.white,       // 主色上的内容色
        secondary: Colors.orange,      // 强调色
        onSecondary: Colors.black,     // 强调色上的内容色
        error: Colors.red,             // 错误状态色
        // background: Colors.grey[50],   // 背景色
        surface: Colors.grey[50],         // 表面色（卡片、表单）
        onSurface: Colors.black87,     // 表面上的内容色
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 57.0,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.25,
          height: 1.12,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          height: 1.5,
        ),
        // 完整层级见Material Design规范
      ),
      scaffoldBackgroundColor: Colors.white,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        /// 设置AppBar 的表面颜色为透明色
        surfaceTintColor: Colors.transparent,
        backgroundColor: ThemeData.light().scaffoldBackgroundColor,
        iconTheme: const IconThemeData(color: Colors.yellow),
      ),
    );
  }
  static ThemeData darkThemeData() {
    return ThemeData(
      brightness: Brightness.dark, // 亮色主题
      // 禁用所有 Material 组件的水波纹效果
      splashFactory: NoSplash.splashFactory,
      // backgroundColor: Colors.black,
      iconTheme: const IconThemeData(
        color: Colors.blue,
      ),
      // 禁用高亮效果
      highlightColor: Colors.transparent,
      colorScheme: const ColorScheme.dark().copyWith(
        brightness: Brightness.dark,
        primary: Colors.blue,          // 主品牌色
        onPrimary: Colors.white,       // 主色上的内容色
        secondary: Colors.orange,      // 强调色
        onSecondary: Colors.black,     // 强调色上的内容色
        error: Colors.red,             // 错误状态色
        // background: Colors.grey[50],   // 背景色
        surface: Colors.grey[50],         // 表面色（卡片、表单）
        onSurface: Colors.black87,     // 表面上的内容色
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 57.0,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.25,
          color: Colors.red,
          height: 1.12,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          height: 1.5,
        ),
        // 完整层级见Material Design规范
      ),
      scaffoldBackgroundColor: Colors.black87,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        /// 设置AppBar 的表面颜色为透明色
        surfaceTintColor: Colors.transparent,
        backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
        iconTheme: const IconThemeData(color: Colors.red),
      ),
    );
  }

  CustomThemeMode _themeMode = CustomThemeMode.light;
  /// 获取当前主题模式
  // 查看购物车
  CustomThemeMode get themeMode => _themeMode;
  _getThemeMode() {
    SharedPreferencesUtil.getData<int>('themeMode').then((value) {
      _themeMode = CustomThemeMode.values[value ?? 0];
    });
  }

  /// 设置主题模式
  void setThemeMode(CustomThemeMode themeMode) async {
    await SharedPreferencesUtil.saveData('themeMode', themeMode.value);
    // Get.cha
  }

}



class ThemeObserverController extends GetxController with WidgetsBindingObserver {

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    // getLanguage();
    getTheme();
  }

  @override
  onClose() {
    super.onClose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    getTheme();
  }

  //获取主题
  void getTheme() {
    // switch (AppBox.shared.theme) {
    //   case 0:
    //     themeStr.value = Local.followerSystemTheme.tr;
    //     break;
    //   case 1:
    //     themeStr.value = Local.lightMode.tr;
    //     break;
    //   case 2:
    //     themeStr.value = Local.darkMode.tr;
    //     break;
    //   default:
    //     themeStr.value = Local.followerSystemTheme.tr;
    //     break;
    // }
  }
}