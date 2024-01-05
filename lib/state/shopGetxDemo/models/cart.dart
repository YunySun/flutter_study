/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-12-25 16:39:32
 * @LastEditors: 虾饺
 * @LastEditTime: 2023-12-26 17:21:24
 * @Profile: 一个比较废柴的前端开发
 */

import 'package:flutter_demo/state/shopGetxDemo/models/catalog.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CatalogController _catalog = Get.put(CatalogController());

  final _goodsIds = [].obs;

  List<Goods> get goodsList =>
      _goodsIds.map((id) => _catalog.getById(id)).toList();

  int get totalPrice =>
      goodsList.fold(0, (total, current) => total + current.price);

  add(Goods goods) => _goodsIds.add(goods.id);

  remove(Goods goods) => _goodsIds.remove(goods.id);
}
