/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-12-27 17:00:53
 * @LastEditors: 虾饺
 * @LastEditTime: 2023-12-29 20:33:54
 * @Profile: 一个比较废柴的前端开发
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/route.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget实例列表'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: routes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(routes[index].title),
            onTap: () {
              Get.toNamed(routes[index].name);
            },
          );
        },
      ),
    );
  }
}
