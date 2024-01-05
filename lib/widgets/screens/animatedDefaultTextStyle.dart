import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleScreen extends StatelessWidget {
  const AnimatedDefaultTextStyleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedDefaultTextStyle'),
        centerTitle: true,
      ),
      body: const Center(
        child: AnimatedDefaultTextStyleWidget(),
      ),
    );
  }
}

class AnimatedDefaultTextStyleWidget extends StatefulWidget {
  const AnimatedDefaultTextStyleWidget({super.key});

  @override
  State<AnimatedDefaultTextStyleWidget> createState() =>
      _AnimatedDefaultTextStyleState();
}

class _AnimatedDefaultTextStyleState
    extends State<AnimatedDefaultTextStyleWidget> {
  bool _selected = false;
  double _fontSize = 20.0;
  Color _textColor = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
          _fontSize = _selected ? 24.0 : 20.0;
          _textColor = _selected ? Colors.cyan : Colors.deepPurple;
        });
      },
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 500),
        style: TextStyle(
          fontSize: _fontSize,
          fontWeight: _selected ? FontWeight.bold : FontWeight.normal,
          color: _textColor,
        ),
        child: const Text('Flutter 字体动画'),
      ),
    );
  }
}
