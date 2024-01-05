/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2024-01-05 16:17:31
 * @LastEditors: 虾饺
 * @LastEditTime: 2024-01-05 16:33:59
 * @Profile: 一个比较废柴的前端开发
 */
import 'package:flutter/material.dart';

class AnimatedPositionedScreen extends StatelessWidget {
  const AnimatedPositionedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedPositioned'),
        centerTitle: true,
      ),
      body: const Center(
        child: AnimatedPositionWidget(),
      ),
    );
  }
}

class AnimatedPositionWidget extends StatefulWidget {
  const AnimatedPositionWidget({super.key});

  @override
  State<AnimatedPositionWidget> createState() => _AnimatedPositionState();
}

class _AnimatedPositionState extends State<AnimatedPositionWidget> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      color: Colors.deepOrangeAccent,
      // Positioned小部件用于Stack中定位子部件 不在Stack中会报错
      child: Stack(
        children: [
          AnimatedPositioned(
            width: _selected ? 200.0 : 100.0,
            height: _selected ? 100.0 : 200.0,
            duration: const Duration(milliseconds: 300),
            top: _selected ? 50 : 0,
            left: _selected ? 100 : 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selected = !_selected;
                });
              },
              child: const ColoredBox(
                color: Colors.blueAccent,
                child: Center(
                  child: Text('Press me'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
