/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2024-01-03 16:28:23
 * @LastEditors: 虾饺
 * @LastEditTime: 2024-01-03 17:04:21
 * @Profile: 一个比较废柴的前端开发
 */
import 'package:flutter/material.dart';
/**
 * AnimatedOpacity，在没有任何内容和单个孩子之间消失
 * AnimatedSwitcher，它可以将一个子项切换为一个具有可自定义过渡的新项，同时支持多个交叉淡入淡出
 * AnimatedSize ， AnimatedCrossFade用于自动更改大小的较低级别小部件
 */

class AnimatedCrossFadeScreen extends StatelessWidget {
  const AnimatedCrossFadeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedCrossFade淡入淡出'),
        centerTitle: true,
      ),
      body: const Center(
        child: AnimatedCrossFadeWidget(),
      ),
    );
  }
}

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({super.key});

  @override
  State<AnimatedCrossFadeWidget> createState() => _AnimatedCrossState();
}

class _AnimatedCrossState extends State<AnimatedCrossFadeWidget> {
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
        child: AnimatedCrossFade(
          duration: const Duration(microseconds: 16),
          firstChild: const FlutterLogo(
            style: FlutterLogoStyle.horizontal,
            size: 100.0,
          ),
          secondChild: const FlutterLogo(
            style: FlutterLogoStyle.stacked,
            size: 40.0,
          ),
          crossFadeState:
              _selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ),
    );
  }
}
