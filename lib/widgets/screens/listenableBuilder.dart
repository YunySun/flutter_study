import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/model/count.dart';

class ListenableBuilderDemo extends StatelessWidget {
  const ListenableBuilderDemo({super.key, required this.counterNotifier});
  final CounterModel counterNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('当前计数器记数为：'),
        ListenableBuilder(
          listenable: counterNotifier,
          builder: (BuildContext context, Widget? child) {
            return Text('${counterNotifier.count}');
          },
        )
      ],
    );
  }
}
