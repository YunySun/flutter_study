import 'package:flutter/material.dart';

class AnimatedSizeScreen extends StatelessWidget {
  const AnimatedSizeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedSize'),
        centerTitle: true,
      ),
      body: const Center(
        child: AnimatedSizeWidget(),
      ),
    );
  }
}

class AnimatedSizeWidget extends StatefulWidget {
  const AnimatedSizeWidget({super.key});

  @override
  State<AnimatedSizeWidget> createState() => _AnimatedSizeState();
}

class _AnimatedSizeState extends State<AnimatedSizeWidget> {
  double _size = 50.0;
  bool _large = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _size = _large ? 250.0 : 100.0;
          _large = !_large;
        });
      },
      child: ColoredBox(
        color: Colors.deepPurpleAccent,
        child: AnimatedSize(
          duration: const Duration(milliseconds: 500),
          child: FlutterLogo(
            size: _size,
          ),
        ),
      ),
    );
  }
}
