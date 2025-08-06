import 'package:flutter/material.dart';
import 'package:flutter_project/modules/profile/pages/setting_page.dart';
import 'package:flutter_project/utils/color_util.dart';
import 'package:flutter_project/utils/theme_util.dart';
import 'package:flutter_project/widgets/custom_app_bar.dart';
import 'package:flutter_project/widgets/sequence_image.dart';
import 'package:get/get.dart';

import '../models/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with AutomaticKeepAliveClientMixin {

  final controller = Get.put(ThemeObserverController());


  @override
  bool get wantKeepAlive => true; // 保持状态

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    User user = User.fromJson({
      "name": "Jack Lee",
      "email": "291148484@163.com",
      // "address": {
      //   "street": "123 Main St",
      //   "city": "Anytown",
      //   "zipCode": "12345"
      // }
    });

    print(user.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('我的'),
          // themeType: CustomAppBarThemeType.white,
          actions: [
            // Obx(() => Text(controller.themeStr.value, style: const TextStyle(fontSize: 12),),),
            // const Icon(Icons.chevron_right)
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Get.to(const SettingPage());
              },
            ),
          ],
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              SequenceImage(paths: _imagePaths(), width: 20),
              Text(ThemeUtil.instance.themeMode.name, style: Theme.of(context).textTheme.displayLarge,)
            ],
          ),
        ),
      ),
    );
  }

  _imagePaths() {
    List<String> paths = [];
    for (int i = 0; i < 71; i++) {
      String asset = 'assets/images/loadings/loading${i.toString().padLeft(2, '0')}.png';
      paths.add(asset);
    }
    return paths;
  }
}

