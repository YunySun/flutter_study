/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2024-01-03 10:01:06
 * @LastEditors: 虾饺
 * @LastEditTime: 2024-01-03 14:50:14
 * @Profile: 一个比较废柴的前端开发
 */
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_demo/widgets/components/title.dart';
import 'package:flutter_demo/widgets/model/count.dart';
import 'package:flutter_demo/widgets/screens/listenableBuilder.dart';

class AnimatedBuilderScreen extends StatelessWidget {
  AnimatedBuilderScreen({Key? key}) : super(key: key);
  final CounterModel _counter = CounterModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedBuilderScreen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const AnimatedBuilderWidget(),
          const MyTitle(title: 'ListenableBuilder类 demo'),
          ListenableBuilderDemo(
            counterNotifier: _counter,
          ),
          const MyTitle(title: 'TweenAnimationBuilder demo'),
          const TweenAnimationBuilderWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.increament();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AnimatedBuilderWidget extends StatefulWidget {
  const AnimatedBuilderWidget({super.key});

  @override
  State<AnimatedBuilderWidget> createState() => _AnimatedBuilderState();
}

// AnimationController 可以配置vsync: this需要一个TickerProvider
class _AnimatedBuilderState extends State<AnimatedBuilderWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    // lowerBound: 1,
    // upperBound: 2,
    // value: 1,
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose(); // 销毁的时候销毁控制器
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * math.pi,
          child: child,
        );
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.amber,
        child: const Center(
          child: Text('Whee!'),
        ),
      ),
    );
  }
}

class TweenAnimationBuilderWidget extends StatefulWidget {
  const TweenAnimationBuilderWidget({super.key});

  @override
  State<TweenAnimationBuilderWidget> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimationBuilderWidget> {
  double targetValue = 24.0;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: targetValue),
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double size, Widget? child) {
        return IconButton(
          iconSize: size,
          color: Colors.blue,
          onPressed: () {
            setState(() {
              targetValue = targetValue == 24.0 ? 48.0 : 24.0;
            });
          },
          icon: child!,
        );
      },
      child: const Icon(Icons.aspect_ratio),
    );
  }
}
