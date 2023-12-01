import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '原始滚动条示例',
        debugShowCheckedModeBanner: false,
        // 通过将ScrollBehavior scrollbars设置为 false，可以禁用整个应用程序的默认滚动条
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
            title: const Text('原始滚动条示例'),
          ),
          body: const Center(child: RawScrollbarExample()),
        ));
  }
}

class RawScrollbarExample extends StatefulWidget {
  const RawScrollbarExample({super.key});

  @override
  State<StatefulWidget> createState() => _RawScrollbarExampleState();
}

class _RawScrollbarExampleState extends State<RawScrollbarExample> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Row(
        children: <Widget>[
          SizedBox(
            width: constraints.maxWidth / 2,
            child: Scrollbar(
              thumbVisibility: true,
              controller: _scrollController,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Scrollable 1 : Index $index'),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: constraints.maxWidth / 2,
            child: Scrollbar(
              thumbVisibility: true,
              child: ListView.builder(
                primary: true,
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      height: 50,
                      color:
                          index.isEven ? Colors.amberAccent : Colors.blueAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Scrollable 2 : Index $index'),
                      ));
                },
              ),
            ),
          )
        ],
      );
    });
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
