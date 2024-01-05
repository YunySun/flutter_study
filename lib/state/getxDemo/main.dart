/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-12-26 11:25:58
 * @LastEditors: 虾饺
 * @LastEditTime: 2023-12-26 16:17:12
 * @Profile: 一个比较废柴的前端开发
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/state/getxDemo/screens/count.dart';
import 'package:flutter_demo/state/getxDemo/screens/home.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/count',
          page: () => const CountScreen(),
        )
      ],
      home: const HomeScreen(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        primaryColor: Colors.blueAccent[700],
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          primary: Colors.blueAccent[700],
        ),
        useMaterial3: true,
      ),
    ));
