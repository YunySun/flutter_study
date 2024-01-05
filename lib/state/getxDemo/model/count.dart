/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-12-26 13:56:59
 * @LastEditors: 虾饺
 * @LastEditTime: 2023-12-26 14:04:43
 * @Profile: 一个比较废柴的前端开发
 */

import 'package:get/get.dart';

class CountController extends GetxController {
  var count = 0.obs;
  increment() => count++;
}
