/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2024-01-03 15:56:50
 * @LastEditors: 虾饺
 * @LastEditTime: 2024-01-03 16:23:32
 * @Profile: 一个比较废柴的前端开发
 */
import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatelessWidget {
  const AnimatedContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
        centerTitle: true,
      ),
      body: const Center(
        child: AnimatedContainerWidget(),
      ),
    );
  }
}

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends State<AnimatedContainerWidget> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
      },
      child: AnimatedContainer(
        width: _selected ? 200.0 : 100.0,
        height: _selected ? 100.0 : 200.0,
        color: _selected ? Colors.red : Colors.blue,
        alignment: _selected ? Alignment.center : Alignment.topCenter,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInCubic,
        child: const FlutterLogo(
          size: 40.0,
        ),
      ),
    );
  }
}
