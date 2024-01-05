import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    // 按钮行
    Widget buttonSections = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.language, 'Language'),
        _buildButtonColumn(color, Icons.search, 'Search'),
        _buildButtonColumn(color, Icons.account_circle, 'Personal'),
      ],
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter layout demo'),
          ),
          body: ListView(
            children: [
              Image.asset('assets/images/lake.jpg',
                  width: 600, height: 240, fit: BoxFit.cover),
              titleSection,
              buttonSections,
              textSection
            ],
          )),
    );
  }

  // 按钮
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              )),
        )
      ],
    );
  }
}

// 实现文本区域
Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: const Text(
    '''Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
    ''',
    softWrap: true,
    maxLines: 3,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.justify,
  ),
);

// 标题行
Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(children: [
    Expanded(
        child: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: const Text(
            'Oeschinen Lake Campground',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const Text(
          'Kandersteg, Switzerland',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    )),
    Icon(
      Icons.star,
      color: Colors.red[500],
    ),
    const Text('41'),
  ]),
);
