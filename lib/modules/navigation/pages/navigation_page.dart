import 'package:flutter/material.dart';
import 'package:flutter_project/utils/http_tools/http_util.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> with AutomaticKeepAliveClientMixin {
  
  @override
  bool get wantKeepAlive => true;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    HttpManager.get<List<dynamic>>("/navi/json").then((value) {
      debugPrint(value.toString());
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
      ),
      body: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
              )
          ),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.yellow,
              )
          ),
        ],
      ),
    );
  }
}


