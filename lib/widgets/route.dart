/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-12-27 17:10:13
 * @LastEditors: 虾饺
 * @LastEditTime: 2024-01-05 17:12:23
 * @Profile: 一个比较废柴的前端开发
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/screens/absorbPointer.dart';
import 'package:flutter_demo/widgets/screens/alertDialog.dart';
import 'package:flutter_demo/widgets/screens/align.dart';
import 'package:flutter_demo/widgets/screens/animatedAlign.dart';
import 'package:flutter_demo/widgets/screens/animatedBuilder.dart';
import 'package:flutter_demo/widgets/screens/animatedContainer.dart';
import 'package:flutter_demo/widgets/screens/animatedCrossFade.dart';
import 'package:flutter_demo/widgets/screens/animatedDefaultTextStyle.dart';
import 'package:flutter_demo/widgets/screens/animatedList.dart';
import 'package:flutter_demo/widgets/screens/animatedPhysicalModel.dart';
import 'package:flutter_demo/widgets/screens/animatedPositioned.dart';
import 'package:flutter_demo/widgets/screens/animatedSize.dart';
import 'package:flutter_demo/widgets/screens/animatedWidget.dart';
import 'package:flutter_demo/widgets/screens/home.dart';

List<Route> routes = [
  Route(
    name: '/',
    page: const HomeScreen(),
    title: '首页',
  ),
  Route(
    name: '/absorbPointer',
    page: const AbsorbPointerScreen(),
    title: 'absorbPointer悬浮组件',
  ),
  Route(
    name: '/alertDialog',
    page: const AlertDialogScreen(),
    title: 'AlertDialog警报弹窗',
  ),
  Route(
    name: '/align',
    page: const AlignScreen(),
    title: 'Align对齐类',
  ),
  Route(
    name: '/animatedAlign',
    page: const AnimatedAlignScreen(),
    title: 'AnimatedAlign动画对齐类',
  ),
  Route(
    name: '/animatedBuilder',
    page: AnimatedBuilderScreen(),
    title: 'AnimatedBuilder动画构造类',
  ),
  Route(
    name: '/animatedContainer',
    page: const AnimatedContainerScreen(),
    title: 'AnimatedContainer动画容器',
  ),
  Route(
    name: '/animatedCrossFade',
    page: const AnimatedCrossFadeScreen(),
    title: 'AnimatedCrossFadeScreen动画淡入淡出',
  ),
  Route(
    name: '/animatedDefaultTextStyle',
    page: const AnimatedDefaultTextStyleScreen(),
    title: 'AnimatedDefaultTextStyle',
  ),
  Route(
    name: '/animatedList',
    page: const AnimatedListScreen(),
    title: 'AnimatedList',
  ),
  Route(
    name: '/animatedPhysicalModel',
    page: const AnimatedPhysicalModelScreen(),
    title: 'AnimatedPhysicalModel',
  ),
  Route(
    name: '/animatedPositioned',
    page: const AnimatedPositionedScreen(),
    title: 'AnimatedPositioned',
  ),
  Route(
    name: '/animatedSize',
    page: const AnimatedSizeScreen(),
    title: 'AnimatedSize',
  ),
  Route(
    name: '/animatedWidget',
    page: const AnimatedWidgetScreen(),
    title: 'AnimatedWidget',
  ),
];

class Route {
  final String name;
  final Widget page;
  final String title;

  Route({required this.name, required this.page, required this.title});
}
