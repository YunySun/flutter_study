import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '网格视图',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('网格视图'),
            ),
            body: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                  100,
                  (index) => Center(
                          child: Text(
                        'Item $index',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ))),
            )));
  }
}
