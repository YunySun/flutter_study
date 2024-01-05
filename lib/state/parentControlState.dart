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
          title: const Text('Flutter父Widget管理子Widget的状态'),
        ),
        body: const Center(
          child: ParentTapWidget(),
        ),
      ),
    );
  }
}

class ParentTapWidget extends StatefulWidget {
  const ParentTapWidget({super.key});

  @override
  State<ParentTapWidget> createState() => _ParentTapWidgetState();
}

class _ParentTapWidgetState extends State<ParentTapWidget> {
  bool _active = false;

  void _handleChangeState(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TapboxA(
        active: _active,
        onChanged: _handleChangeState,
      ),
    );
  }
}

class TapboxA extends StatelessWidget {
  const TapboxA({
    super.key,
    required this.active,
    required this.onChanged,
  });

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
