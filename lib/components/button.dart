/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-12-13 15:00:31
 * @LastEditors: 虾饺
 * @LastEditTime: 2023-12-13 15:00:37
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('按钮'),
        ),
        body: const Center(
          child: Column(
            children: [
              MyButton(),
              MyRippleButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        const snackBar = SnackBar(content: Text('Tap'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text('My Button'),
      ),
    );
  }
}

// 涟漪效果按钮
class MyRippleButton extends StatelessWidget {
  const MyRippleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blue,
      onTap: () {
        const snackBar = SnackBar(content: Text('Tap'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: const Padding(
        padding: EdgeInsets.all(12),
        child: Text('My Ripple Button'),
      ),
    );
  }
}
