/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-12-26 11:40:37
 * @LastEditors: 虾饺
 * @LastEditTime: 2023-12-26 15:31:57
 * @Profile: 一个比较废柴的前端开发
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首页'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            ListTile(
              title: const Text('计数器页面'),
              leading: Icon(
                Icons.calculate,
                color: Theme.of(context).colorScheme.primary,
              ),
              onTap: () {
                Get.toNamed('/count');
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('snackbar弹窗'),
              leading: Icon(
                Icons.mobile_screen_share,
                color: Theme.of(context).colorScheme.primary,
              ),
              onTap: () {
                Get.snackbar(
                  '标题',
                  '消息',
                  duration: const Duration(seconds: 2),
                  snackPosition: SnackPosition.BOTTOM,
                  titleText: const Text(
                    '自定义的标题',
                    style: TextStyle(color: Colors.red),
                  ),
                  backgroundColor: Colors.black87,
                  margin:
                      const EdgeInsets.only(bottom: 10, left: 15, right: 15),
                  messageText: const Text(
                    '这是副标题',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('dialog弹窗'),
              leading: Icon(
                Icons.message_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              onTap: () {
                Get.defaultDialog(
                  title: '标题',
                  middleText: '这是副标题消息',
                  titleStyle: const TextStyle(fontSize: 0),
                  // textCancel: '取消',
                  // textConfirm: '确定',
                  content: const Column(
                    children: [
                      Text('这是自定义内容'),
                    ],
                  ),
                  cancel: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey),
                    ),
                    child: const Text(
                      '取消',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  confirm: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      Get.snackbar('标题', '确认了dialog');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                    ),
                    child: const Text(
                      '确定',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  radius: 10.0,
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('BottomSheet弹窗'),
              leading: Icon(
                Icons.speaker_phone,
                color: Theme.of(context).colorScheme.primary,
              ),
              onTap: () {
                Get.bottomSheet(
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text('Facebook分享'),
                          leading: Icon(
                            Icons.facebook_rounded,
                            color: Colors.blue[900],
                          ),
                        ),
                        ListTile(
                          title: const Text('Telegram分享'),
                          leading: Icon(
                            Icons.telegram,
                            color: Colors.blue[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
