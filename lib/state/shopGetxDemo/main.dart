/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-12-25 14:08:38
 * @LastEditors: 虾饺
 * @LastEditTime: 2023-12-27 09:51:07
 * @Profile: 一个比较废柴的前端开发
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/state/shopGetxDemo/common/theme.dart';
import 'package:flutter_demo/state/shopGetxDemo/screens/cart.dart';
import 'package:flutter_demo/state/shopGetxDemo/screens/catalog.dart';
import 'package:flutter_demo/state/shopGetxDemo/screens/login.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => Login(),
        ),
        GetPage(
          name: '/catalog',
          page: () => CatalogScreen(),
        ),
        GetPage(
          name: '/cart',
          page: () => CartScreen(),
        ),
      ],
      theme: MyTheme,
    ));
