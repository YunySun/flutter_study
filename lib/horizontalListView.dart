import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '横向滑动的列表',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('横向滑动的列表'),
          ),
          body: Container(
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 160,
                    color: Colors.red,
                  ),
                  Container(
                    width: 160,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 160,
                    color: Colors.greenAccent,
                  ),
                  Container(
                    width: 160,
                    color: Colors.amberAccent,
                  ),
                  Container(
                    width: 160,
                    color: Colors.cyanAccent,
                  )
                ],
              )),
        ));
  }
}
