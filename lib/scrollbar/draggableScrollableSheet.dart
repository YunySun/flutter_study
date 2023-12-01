import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DraggableScrollableSheet',
        debugShowCheckedModeBanner: false,
        // 占据25%的高度，剩余顶部75%的高度 当列表内容滚动刀顶部后 啧列表内容可以向上向下滚动
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          scrollbars: false,
        ),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          cardTheme: CardTheme(color: Colors.blue.shade50),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('DraggableScrollableSheet'),
          ),
          body: SizedBox.expand(
            child: DraggableScrollableSheet(
              builder: (BuildContext context, ScrollController controller) {
                return Container(
                  color: Colors.deepPurpleAccent,
                  child: ListView.builder(
                    controller: controller,
                    itemCount: 25,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text('Item $index'),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ));
  }
}
