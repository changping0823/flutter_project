import 'package:flutter/material.dart';
import 'package:flutter_project/utils/color_util.dart';
import 'package:flutter_project/widgets/sequence_image.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的'),
        backgroundColor: ColorUtil.main,
      ),
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
