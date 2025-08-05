import 'package:flutter/material.dart';
import 'package:flutter_project/utils/shared_preferences_util.dart';
import 'package:flutter_project/utils/theme_util.dart';
import 'package:flutter_project/widgets/custom_app_bar.dart';
import 'package:get/get.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final _controller = Get.put(ThemeSettingsController());
  late CustomThemeMode _currentTheme;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentTheme = CustomThemeMode.light;
    _getCurrentThemeModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "设置"),
      body: Center (
        child: TextButton(
          onPressed: () {
            if (_currentTheme == CustomThemeMode.light) {
              _controller.onThemeChange(context, CustomThemeMode.dark.value);
              _currentTheme = CustomThemeMode.dark;
            } else {
              _controller.onThemeChange(context, CustomThemeMode.light.value);
              _currentTheme = CustomThemeMode.light;
            }
          },
          child: const Text('切换主题'),
        ),
      ),
    );
  }

  _getCurrentThemeModel() async {
    int themeValue = await SharedPreferencesUtil.getData<int>('themeMode') ?? 0;
    _currentTheme = CustomThemeMode.values[themeValue];
  }
}


class ThemeSettingsController extends GetxController {

  Future<void> onThemeChange(BuildContext context, int themeValue) async {
    CustomThemeMode themeMode = CustomThemeMode.values[themeValue];
    ThemeData mode = (themeMode == CustomThemeMode.light) ? ThemeData.light() : ThemeData.dark();
    SharedPreferencesUtil.saveData('themeMode', themeValue);
    // Get.changeThemeMode(mode);
    Get.changeTheme(mode);
  }
}