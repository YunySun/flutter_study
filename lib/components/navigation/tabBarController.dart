/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-11-20 14:51:01
 * @LastEditors: 虾饺
 * @LastEditTime: 2023-12-19 16:48:44
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
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.view_module_rounded),
                ),
                Tab(
                  icon: Icon(Icons.person),
                )
              ],
            ),
          ),
          body: const TabBarView(children: [
            Icon(Icons.home),
            Icon(Icons.view_module_rounded),
            Icon(Icons.person)
          ]),
        ),
      ),
    );
  }
}
