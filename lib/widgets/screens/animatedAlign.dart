import 'package:flutter/material.dart';

class AnimatedAlignScreen extends StatelessWidget {
  const AnimatedAlignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedAlign动画对齐类'),
        centerTitle: true,
      ),
      body: const AnimatedAlignStatefulWidget(),
    );
  }
}

class AnimatedAlignStatefulWidget extends StatefulWidget {
  const AnimatedAlignStatefulWidget({super.key});

  @override
  State<AnimatedAlignStatefulWidget> createState() => _AnimatedAlignState();
}

class _AnimatedAlignState extends State<AnimatedAlignStatefulWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: Container(
          width: 250.0,
          height: 250.0,
          color: Colors.blueAccent,
          child: AnimatedAlign(
            alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
            duration: const Duration(milliseconds: 1000),
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
