/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-12-13 15:20:06
 * @LastEditors: 虾饺
 * @LastEditTime: 2023-12-13 15:20:11
 * @Profile: 一个比较废柴的前端开发
 */
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter study',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('滑动清除效果'),
        ),
        body: const SlideCancelListWidget(),
      ),
    );
  }
}

// MyApp is a StatefulWidget. This allows updating the state of the
// widget when an item is removed.
class SlideCancelListWidget extends StatefulWidget {
  const SlideCancelListWidget({super.key});

  @override
  State<SlideCancelListWidget> createState() => _SlideCancelListWidgetState();
}

class _SlideCancelListWidgetState extends State<SlideCancelListWidget> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Dismissible(
          // Each Dismissible must contain a Key. Keys allow Flutter to
          // uniquely identify widgets.
          key: Key(item),
          // Provide a function that tells the app
          // what to do after an item has been swiped away.
          onDismissed: (direction) {
            // Remove the item from the data source.
            setState(() {
              items.removeAt(index);
            });

            // Then show a snackbar.
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('$item dismissed')));
          },
          // Show a red background as the item is swiped away.
          background: Container(color: Colors.red),
          child: ListTile(
            title: Text(item),
          ),
        );
      },
    );
  }
}
