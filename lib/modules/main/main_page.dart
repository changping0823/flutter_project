import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project/modules/home/pages/home_page.dart';
import 'package:flutter_project/modules/category/pages/category_page.dart';
import 'package:flutter_project/modules/profile/pages/profile_page.dart';
import 'package:flutter_project/utils/color_util.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  final List<BottomNavigationBarItem> _items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '首页',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      label: '分类',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: '我的',
    )
  ];

  final List<Widget> _children = [
    const HomePage(), // 首页
    const CategoryPage(),
    const ProfilePage(), // 用户资料页
  ];

  final IconThemeData _itemIconThemeData = const IconThemeData(
    size: 24.0, // 图标大小
  );

  final TextStyle _itemTextStyle = const TextStyle(
    fontSize: 12.0, // 文字大小
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: PageView (/// PageView 可以实现懒加载
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // 禁止滑动切换
        children: _children,
      ),
      // body: _children[_currentIndex],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _pageController.jumpToPage(index); // 跳转页面
      _currentIndex = index;
    });
  }

  _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      items: _items,
      selectedItemColor: ColorUtil.main, // 设置选中项的颜色
      unselectedItemColor: ColorUtil.text_8c,
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      // 自定义选中项的图标主题
      selectedIconTheme: _itemIconThemeData,
      // 自定义未选中项的图标主题
      unselectedIconTheme: _itemIconThemeData,
      // 自定义选中项的文字样式
      selectedLabelStyle: _itemTextStyle,
      // 自定义未选中项的文字样式
      unselectedLabelStyle: _itemTextStyle,
    );
  }
}
