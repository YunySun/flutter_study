/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2024-01-05 16:56:03
 * @LastEditors: 虾饺
 * @LastEditTime: 2024-01-05 17:13:39
 * @Profile: 一个比较废柴的前端开发
 */
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedWidgetScreen extends StatelessWidget {
  const AnimatedWidgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedWidget'),
        centerTitle: true,
      ),
      body: const Center(
        child: AnimatedWidgetExample(),
      ),
    );
  }
}

class AnimatedWidgetExample extends StatefulWidget {
  const AnimatedWidgetExample({super.key});

  @override
  State<AnimatedWidgetExample> createState() => _AnimatedWidgetState();
}

class _AnimatedWidgetState extends State<AnimatedWidgetExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  Widget build(BuildContext context) {
    return AnimatedWidgetContainer(controller: _controller);
  }
}

class AnimatedWidgetContainer extends AnimatedWidget {
  const AnimatedWidgetContainer(
      {super.key, required AnimationController controller})
      : super(listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: Container(
        width: 200,
        height: 200,
        color: Colors.lightBlueAccent,
      ),
    );
  }
}
