/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-12-27 16:58:46
 * @LastEditors: 虾饺
 * @LastEditTime: 2023-12-29 20:50:30
 * @Profile: 一个比较废柴的前端开发
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/route.dart';
import 'package:get/get.dart';

void main() => runApp(
      GetMaterialApp(
        initialRoute: '/',
        getPages: routes
            .map(
              (route) => GetPage(
                name: route.name,
                page: () => route.page,
              ),
            )
            .toList(),

        /// 您提供的代码块正在定义 Flutter 中 GetX 包的路由列表。
      ),
    );
