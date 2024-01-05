import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const len = 6;

    return MaterialApp(
        title: '适配列表',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          cardTheme: CardTheme(color: Colors.blue.shade50),
          useMaterial3: true,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('适配列表'),
            ),
            // 1.控制列表元素在组件够大的时候均匀分布 占据可见空间 如果项目列表不适合滚动列表 或者设备太小
            // body: LayoutBuilder(builder: (context, constraints) {
            //   // SingleChildScrollView 该组件确保子小部件可以滚动， 即使父容器太小。
            //   return SingleChildScrollView(
            //     // ConstrainedBox 组件对子组件施加额外的约束
            //     child: ConstrainedBox(
            //       constraints: BoxConstraints(
            //         minHeight: constraints.maxHeight,
            //       ),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           ItemWidget(text: 'Item 1'),
            //           ItemWidget(text: 'Item 2'),
            //           ItemWidget(text: 'Item 3'),
            //         ],
            //       ),
            //     ),
            //   );
            // })
            // 2.Spacer和Expanded来调整间距
            // body: LayoutBuilder(
            //   builder: (context, constraints) {
            //     return SingleChildScrollView(
            //         child: ConstrainedBox(
            //             constraints: BoxConstraints(
            //               minHeight: constraints.maxHeight,
            //             ),
            //             child: const IntrinsicHeight(
            //               child: Column(
            //                 children: [
            //                   ItemWidget(text: 'Item 1'),
            //                   Spacer(),
            //                   ItemWidget(text: 'Item 2'),
            //                   Expanded(
            //                     child: ItemWidget(text: 'Item 3'),
            //                   )
            //                 ],
            //               ),
            //             )));
            //   },
            // ),
            body: LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                  child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                      len, (index) => ItemWidget(text: 'Item $index')),
                ),
              ));
            })));
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
