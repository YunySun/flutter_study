/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-11-20 14:51:01
 * @LastEditors: 虾饺
 * @LastEditTime: 2023-12-15 17:02:33
 * @Profile: 一个比较废柴的前端开发
 */
import 'package:flutter/material.dart';
// flutter pub add transparent_image
import 'package:transparent_image/transparent_image.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('占位图'),
        ),
        body: Stack(
          children: [
            const Center(
              child: CircularProgressIndicator(),
            ),
            Center(
              // 本地缺省图资源FadeInImage.assetNetwork
              child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'https://picsum.photos/250?image=9'),
            ),
          ],
        ),
      ),
    );
  }
}
