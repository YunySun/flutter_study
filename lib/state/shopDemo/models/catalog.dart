import 'package:flutter/material.dart';

class CatalogModel {
  static List<String> goodsNames = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];

  Goods getById(int id) => Goods(id, goodsNames[id % goodsNames.length]);

  Goods getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Goods {
  final int id;
  final String name;
  final Color color;
  final int price = 42;

  Goods(this.id, this.name)
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Goods && other.id == id;
}
