import 'package:flutter/material.dart';
import 'package:flutter_demo/state/getxDemo/model/count.dart';
import 'package:get/get.dart';

class CountChildScreen extends StatelessWidget {
  const CountChildScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CountController count = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('记数子页面'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('${count.count}'),
      ),
    );
  }
}
