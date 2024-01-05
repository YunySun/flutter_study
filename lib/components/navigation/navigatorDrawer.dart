/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-11-20 14:51:01
 * @LastEditors: 虾饺
 * @LastEditTime: 2023-12-20 16:31:11
 * @Profile: 一个比较废柴的前端开发
 */
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter study',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  int _selectIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('你好世界'),
    Text('你好flutter')
  ];

  void _onDrawerItemTap(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('抽屉导航栏'),
      ),
      body: _widgetOptions[_selectIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('抽屉导航栏顶部'),
            ),
            ListTile(
              title: const Text('你好，世界'),
              selected: _selectIndex == 0,
              onTap: () {
                _onDrawerItemTap(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('你好，flutter'),
              selected: _selectIndex == 1,
              onTap: () {
                _onDrawerItemTap(1);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
