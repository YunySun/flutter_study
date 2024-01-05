import 'package:flutter/material.dart';
import 'package:flutter_demo/state/shopDemo/models/cart.dart';
import 'package:flutter_demo/state/shopDemo/models/catalog.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
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
    var item = context.select<CatalogModel, Goods>(
      (catalog) => catalog.getByPosition(index),
    );
    var textTheme = Theme.of(context).textTheme.titleLarge;
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
    var isInCart = context.select<CartModel, bool>(
      (cart) => cart.goodsList.contains(goods),
    );
    return TextButton(
      onPressed: () {
        var cart = context.read<CartModel>();
        isInCart ? cart.remove(goods) : cart.add(goods);
      },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null;
        }),
      ),
      child: isInCart
          ? const Icon(
              Icons.check_circle,
              semanticLabel: 'ADDED',
            )
          : const Icon(
              Icons.check_circle_outline,
              semanticLabel: 'ADD',
            ),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        'Catalog',
        style: Theme.of(context).textTheme.displayLarge,
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
          context.pop();
        },
      ),
      floating: true,
      actions: [
        IconButton(
          onPressed: () => context.push('/catalog/cart'),
          icon: const Icon(Icons.shopping_cart),
        )
      ],
    );
  }
}
