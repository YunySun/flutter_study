import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDialogScreen extends StatelessWidget {
  const AlertDialogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlertDialog警报弹窗'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Alert Dialog 标题'),
                    content: const Text('Alert Dialog 内容'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back(result: {});
                        },
                        child: const Text('取消'),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back(result: {'status': '确定'});
                        },
                        child: const Text('确定'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Alert Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
