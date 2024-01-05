import 'package:flutter/material.dart';
import 'package:flutter_demo/state/shopDemo/models/catalog.dart';

class CartModel extends ChangeNotifier {
  late CatalogModel _catalog;

  final List<int> _goodsIds = []; // 购物车选中的id

  CatalogModel get catalog => _catalog; // 获取通过id创建的catalog

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    notifyListeners();
  }

  // 购物车商品数组 通过存储的id数组获取购物车选择的商品
  List<Goods> get goodsList =>
      _goodsIds.map((id) => _catalog.getById(id)).toList();

  // 购物车选中的总价
  int get totalPrice =>
      goodsList.fold(0, (total, current) => total + current.price);

  // 购物车添加
  void add(Goods goods) {
    _goodsIds.add(goods.id);

    notifyListeners();
  }

  void remove(Goods goods) {
    _goodsIds.remove(goods.id);

    notifyListeners();
  }
}
