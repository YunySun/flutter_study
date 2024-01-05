/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-11-20 14:51:01
 * @LastEditors: 虾饺
 * @LastEditTime: 2023-12-25 14:03:33
 * @Profile: 一个比较废柴的前端开发
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/state/shopDemo/common/theme.dart';
import 'package:flutter_demo/state/shopDemo/models/cart.dart';
import 'package:flutter_demo/state/shopDemo/models/catalog.dart';
import 'package:flutter_demo/state/shopDemo/screens/cart.dart';
import 'package:flutter_demo/state/shopDemo/screens/catalog.dart';
import 'package:flutter_demo/state/shopDemo/screens/login.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart'; // flutter pub add go_router
// flutter pub add provider状态管理

void main() => runApp(MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        )
      ],
      child: const MyApp(),
    ));

GoRouter router() {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const Login(),
      ),
      GoRoute(
          path: '/catalog',
          builder: (context, state) => const CatalogPage(),
          routes: [
            GoRoute(
              path: 'cart',
              builder: (context, state) => const CartPage(),
            ),
          ]),
    ],
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '购物车Demo',
      theme: appTheme,
      routerConfig: router(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '购物车Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//       ),
//       initialRoute: '/',
//       routes: <String, WidgetBuilder>{
//         '/': (BuildContext context) => const HomePage(),
//         '/login': (BuildContext context) => const Login(),
//       },
//     );
//   }
// }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首页'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
