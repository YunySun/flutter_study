/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-12-27 17:03:27
 * @LastEditors: 虾饺
 * @LastEditTime: 2023-12-29 21:03:01
 * @Profile: 一个比较废柴的前端开发
 */
import 'package:flutter/material.dart';

class AbsorbPointerScreen extends StatelessWidget {
  const AbsorbPointerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AbsorbPointer'),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              width: 200.0,
              height: 100.0,
              child: ElevatedButton(
                onPressed: () {},
                child: null,
              ),
            ),
            SizedBox(
              width: 100.0,
              height: 200.0,
              child: AbsorbPointer(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade200,
                  ),
                  onPressed: () {},
                  child: null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
