import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '基础列表',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('基础列表'),
          ),
          body: ListView(
            children: const <Widget>[
              ListTile(leading: Icon(Icons.language), title: Text('语言')),
              ListTile(leading: Icon(Icons.search), title: Text('搜索')),
              ListTile(leading: Icon(Icons.account_circle), title: Text('个人')),
            ],
          )),
    );
  }
}
