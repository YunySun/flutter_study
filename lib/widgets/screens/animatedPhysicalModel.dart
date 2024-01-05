/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2024-01-05 15:44:58
 * @LastEditors: 虾饺
 * @LastEditTime: 2024-01-05 16:07:48
 * @Profile: 一个比较废柴的前端开发
 */
import 'package:flutter/material.dart';

class AnimatedPhysicalModelScreen extends StatelessWidget {
  const AnimatedPhysicalModelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedPhysicalModel'),
        centerTitle: true,
      ),
      body: const Center(
        child: AnimatedPhysicalModalWidget(),
      ),
    );
  }
}

class AnimatedPhysicalModalWidget extends StatefulWidget {
  const AnimatedPhysicalModalWidget({super.key});

  @override
  State<AnimatedPhysicalModalWidget> createState() =>
      _AnimatedPhysicalModalState();
}

class _AnimatedPhysicalModalState extends State<AnimatedPhysicalModalWidget> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedPhysicalModel(
      duration: const Duration(milliseconds: 500),
      shadowColor: Colors.green,
      elevation: _pressed ? 16.0 : 0.0,
      shape: BoxShape.rectangle,
      curve: Curves.linear,
      color: const Color.fromARGB(255, 239, 154, 154),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _pressed = !_pressed;
          });
        },
        child: const SizedBox(
          width: 200,
          height: 200,
          // color: Colors.blueAccent,
          child: Center(
            child: Text(
              'Press me',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
