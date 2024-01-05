/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-12-21 16:10:35
 * @LastEditors: 虾饺
 * @LastEditTime: 2023-12-27 10:19:37
 * @Profile: 一个比较废柴的前端开发
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/state/shopGetxDemo/models/cart.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            const Divider(
              height: 4,
              color: Colors.black,
            ),
            _CartTotal(),
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.titleLarge;

    final CartController _cart = Get.find();

    return Obx(
      () => ListView.builder(
        itemCount: _cart.goodsList.length,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.done),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () {
              _cart.remove(_cart.goodsList[index]);
            },
          ),
          title: Text(
            _cart.goodsList[index].name,
            style: itemNameStyle,
          ),
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle =
        Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 48);

    final CartController _cart = Get.find();

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('\$${_cart.totalPrice}', style: hugeStyle)),
            const SizedBox(
              width: 24,
            ),
            FilledButton(
              onPressed: () {
                // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //   content: Text('当前不支持购买'),
                // ));
                Get.snackbar('提示', '当前不支持购买功能');
              },
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: const Text('购买'),
            ),
          ],
        ),
      ),
    );
  }
}
