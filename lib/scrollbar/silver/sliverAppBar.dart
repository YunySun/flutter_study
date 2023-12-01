import 'package:flutter/material.dart';

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade900),
        // cardTheme: CardTheme(color: Colors.blue.shade50),
        useMaterial3: true,
      ),
      home: const SliverAppBarExample(),
    );
  }
}

class SliverAppBarExample extends StatefulWidget {
  const SliverAppBarExample({super.key});

  @override
  State<SliverAppBarExample> createState() => _SliverAppBarExampleState();
}

class _SliverAppBarExampleState extends State<SliverAppBarExample> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // pinned为false的时候 上滑后导航栏也会消失 true的时候上滑导航栏悬浮
            pinned: _pinned,
            snap: _snap,
            // floating为true的时候只要有下滑操作就会拖拽出导航栏
            floating: _floating,
            expandedHeight: 160,
            backgroundColor: Colors.deepPurpleAccent,
            actions: const [
              Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
              // Icon(
              //   Icons.add_comment,
              //   color: Colors.white,
              // )
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('SliverAppBar'),
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
                        end: Alignment.center,
                        colors: <Color>[
                          Color(0x60000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Center(
                  child: Text('Scroll to see the SliverAppBar in effect.')),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              color: index.isOdd ? Colors.white : Colors.black12,
              height: 100.0,
              child: Center(
                child: Text(
                  '$index',
                  textScaler: const TextScaler.linear(5),
                ),
              ),
            );
          }, childCount: 20)),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.center,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('Pinned'),
                  Switch(
                      value: _pinned,
                      onChanged: (bool val) {
                        setState(() {
                          _pinned = val;
                        });
                      })
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Snap"),
                  Switch(
                      value: _snap,
                      onChanged: (bool val) {
                        setState(() {
                          _snap = val;
                          // the snap argument only makes sense for floating app bars
                          _floating = _floating || _snap;
                        });
                      })
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Floating"),
                  Switch(
                      value: _floating,
                      onChanged: (bool val) {
                        setState(() {
                          _floating = val;
                          _snap = _snap && _floating;
                        });
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
