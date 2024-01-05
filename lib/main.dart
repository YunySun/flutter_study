/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-11-20 14:51:01
 * @LastEditors: 虾饺
 * @LastEditTime: 2023-12-20 16:46:29
 * @Profile: 一个比较废柴的前端开发
 */
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '购物车Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      routes: {},
    );
  }
}
