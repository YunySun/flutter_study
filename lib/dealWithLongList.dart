import 'package:flutter/material.dart';

void main() =>
    runApp(MyApp(items: List.generate(10000, (index) => 'Item $index')));

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '处理长列表',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          cardTheme: CardTheme(color: Colors.blue.shade50),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('处理长列表'),
          ),
          body: ListView.builder(
              itemCount: items.length,
              // prototypeItem: ListTile(
              //   title: Text(items.first),
              // ),
              itemBuilder: (context, index) {
                return ItemWidget(text: items[index]);
              }),
        ));
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
