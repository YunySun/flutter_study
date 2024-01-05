import 'package:flutter/material.dart';
import 'package:flutter_demo/state/shopGetxDemo/models/cart.dart';
import 'package:flutter_demo/state/shopGetxDemo/models/catalog.dart';
import 'package:get/get.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyNavigationBar(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _MyListItem(index),
            ),
          ),
        ],
      ),
    );
  }
}

class _MyListItem extends StatelessWidget {
  const _MyListItem(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme.titleLarge;

    final CatalogController _catalog = Get.put(CatalogController());
    var item = _catalog.getByPosition(index);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: item.color,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
                child: Text(
              item.name,
              style: textTheme,
            )),
            const SizedBox(
              width: 24,
            ),
            _AddButton(goods: item),
          ],
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Goods goods;
  const _AddButton({required this.goods});

  @override
  Widget build(BuildContext context) {
    final CartController _cart = Get.put(CartController());

    return Obx(
      () => TextButton(
        onPressed: () {
          _cart.goodsList.contains(goods)
              ? _cart.remove(goods)
              : _cart.add(goods);
        },
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
            if (states.contains(MaterialState.pressed)) {
              return Theme.of(context).primaryColor;
            }
            return null;
          }),
        ),
        child: _cart.goodsList.contains(goods)
            ? const Icon(
                Icons.check_circle,
                semanticLabel: 'ADDED',
              )
            : const Icon(
                Icons.check_circle_outline,
                semanticLabel: 'ADD',
              ),
      ),
    );
  }
}

class _MyNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        'Catalog',
        style: Theme.of(context).textTheme.displayLarge,
      ),
      floating: true,
      actions: [
        IconButton(
          onPressed: () {
            Get.toNamed('/cart');
          },
          icon: const Icon(Icons.shopping_cart),
        )
      ],
    );
  }
}
