/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-12-26 11:32:25
 * @LastEditors: 虾饺
 * @LastEditTime: 2023-12-26 14:19:43
 * @Profile: 一个比较废柴的前端开发
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/state/getxDemo/model/count.dart';
import 'package:flutter_demo/state/getxDemo/screens/count_child.dart';
import 'package:get/get.dart';

class CountScreen extends StatelessWidget {
  const CountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 使用Get.put()实例化你的类，使其对当下的所有子路由可用
    final CountController count = Get.put(CountController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('计数器页面'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('点击的按钮的次数：'),
            // 使用Obx(() => 每当记数改变的时候，更新Text)
            ElevatedButton(
              onPressed: () {
                Get.to(const CountChildScreen());
              },
              child: Obx(
                () => Text(
                  '${count.count}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          count.increment();
        },
      ),
    );
  }
}
