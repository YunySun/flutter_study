import 'package:flutter/material.dart';

void main() => runApp(const StretchableSliverAppBar());

class StretchableSliverAppBar extends StatefulWidget {
  const StretchableSliverAppBar({super.key});

  @override
  State<StretchableSliverAppBar> createState() =>
      _StretchableSliverAppBarState();
}

class _StretchableSliverAppBarState extends State<StretchableSliverAppBar> {
  bool _stretch = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              stretch: _stretch,
              onStretchTrigger: () async {},
              stretchTriggerOffset: 300.0,
              expandedHeight: 200.0,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text('stretch控制拉伸SliverAppBar'),
                background: FlutterLogo(),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text(
                      '$index',
                      textScaler: const TextScaler.linear(5.0),
                    ),
                  ),
                );
              },
              childCount: 20,
            ))
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: OverflowBar(
              overflowAlignment: OverflowBarAlignment.center,
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('stretch'),
                    Switch(
                        value: _stretch,
                        onChanged: (bool val) {
                          setState(() {
                            _stretch = val;
                          });
                        })
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
