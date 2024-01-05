import 'package:flutter/material.dart';

class AlignScreen extends StatelessWidget {
  const AlignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Align对齐类'),
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          height: 100.0,
          width: 100.0,
          color: Colors.blueAccent,
          child: const Align(
            alignment: Alignment.topRight,
            child: FlutterLogo(
              size: 50.0,
            ),
          ),
        ),
        Container(
          height: 100.0,
          width: 100.0,
          color: Colors.green,
          child: Align(
            alignment:
                const Alignment(0.2, 0.4), // (0.2*50/2+50/2, 0.4*50/2+50/2)
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
            ),
          ),
        ),
        Container(
          height: 100.0,
          width: 100.0,
          color: Colors.amber,
          child: Align(
            alignment: const FractionalOffset(
                0.5, 0.5), // (0.2*50/2+50/2, 0.4*50/2+50/2)
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
