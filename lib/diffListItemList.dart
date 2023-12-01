import 'package:flutter/material.dart';

void main() => runApp(MyApp(
    items: List<ListItem>.generate(
        1000,
        (index) => index % 6 == 0
            ? HeadingItem('Heading $index')
            : MessageItem('Sender $index', 'Message body $index'))));

class MyApp extends StatelessWidget {
  final List<ListItem> items;

  const MyApp({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '拥有不同列表的列表',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('拥有不同列表的列表'),
            ),
            body: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  return ListTile(
                    title: item.buildTitle(context),
                    subtitle: item.buildSubTitle(context),
                  );
                })));
  }
}

// 包含不同类型的基类
abstract class ListItem {
  // 标题
  Widget buildTitle(BuildContext context);

  // 副标题
  Widget buildSubTitle(BuildContext context);
}

// 显示标题的数据列表类型
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  @override
  Widget buildSubTitle(BuildContext context) {
    return const SizedBox.shrink();
  }
}

// 显示消息数据的列表类型
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(sender);
  }

  @override
  Widget buildSubTitle(BuildContext context) {
    return Text(body);
  }
}
