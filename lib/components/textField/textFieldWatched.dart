/*
 * @Description: 
 * @Author: 虾饺
 * @Date: 2023-11-20 14:51:01
 * @LastEditors: 虾饺
 * @LastEditTime: 2023-12-14 16:21:37
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
      home: const MyReadFormWidget(),
    );
  }
}

class MyReadFormWidget extends StatefulWidget {
  const MyReadFormWidget({super.key});

  @override
  State<MyReadFormWidget> createState() => _MyReadFormWidgetState();
}

class _MyReadFormWidgetState extends State<MyReadFormWidget> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 监听控制器变化
  @override
  void initState() {
    super.initState();
    _controller.addListener(_printLatestValue);
  }

  void _printLatestValue() {
    final text = _controller.text;
    print('controller watch: $text (${text.characters.length})');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('监听输入框内容的改动'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search',
              ),
              onChanged: (text) {
                print('onChanged: $text (${text.characters.length})');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter you username',
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(_controller.text),
                );
              });
        },
        tooltip: '获取输入框内容',
        child: const Icon(Icons.text_fields_rounded),
      ),
    );
  }
}
