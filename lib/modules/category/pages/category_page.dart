import 'package:flutter/material.dart';
import 'package:flutter_project/modules/home/models/commonly.dart';
import 'package:flutter_project/utils/http_tools/http_util.dart';
import 'package:flutter_project/widgets/custom_app_bar.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "分类",
      ),
      body: const Center(
        child: Text("分类"),
      ),
    );
  }
}

