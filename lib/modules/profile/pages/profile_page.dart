import 'package:flutter/material.dart';
import 'package:flutter_project/utils/color_util.dart';
import 'package:flutter_project/widgets/custom_app_bar.dart';
import 'package:flutter_project/widgets/sequence_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // 保持状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '我的'),
      body: Container(
        color: Colors.white,
        child: Center(
          child: SequenceImage(paths: _imagePaths(), width: 20,),
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

