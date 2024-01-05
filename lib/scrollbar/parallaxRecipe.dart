import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade900),
        useMaterial3: true,
      ),
      title: '视觉差效果的滚动页面',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('视觉差效果的滚动页面'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              for (final location in locations)
                LocationListItem(
                  imageUrl: location.imageUrl,
                  name: location.name,
                  country: location.place,
                )
            ],
          ),
        ),
      ),
    );
  }
}

// 创建一个名为 ParallaxRecipe 的新无状态小部件
class ParallaxRecipe extends StatelessWidget {
  const ParallaxRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [],
      ),
    );
  }
}

// 实现一个名为 LocationListItem 的无状态小部件 由前面提到的视觉效果组成
@immutable
class LocationListItem extends StatelessWidget {
  LocationListItem({
    super.key,
    required this.country,
    required this.name,
    required this.imageUrl,
  });

  final String imageUrl;
  final String name;
  final String country;
  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: AspectRatio(
        aspectRatio: (16 / 9),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              _buildParallaxBackground(context),
              _buildGradient(),
              _buildTitleAndSubTitle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context),
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      // 引入新的FlowDelegate
      children: [
        Image.network(imageUrl, key: _backgroundImageKey, fit: BoxFit.cover),
      ],
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.6, 0.95]),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubTitle() {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            country,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

// FlowDelegate控制其子项的大小以及字元素被画的地方
// 当输入更新时会重新绘制 但ParallaxFlowDelegate不会在每次滚动的时候重新绘制
// 将 ScrollableState 的 ScrollPosition 传递给 FlowDelegate 超类，以便 FlowDelegate 在每次 ScrollPosition 更改时重新绘制。
class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    // 严肃约束背景图像子元素的宽度 宽度固定后需要根据垂直位置对于滚动方向重新定位 然后重绘
    return BoxConstraints.tightFor(width: constraints.maxWidth);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // 计算列表像素位置
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(
          Offset.zero,
        ),
        ancestor: scrollableBox);

    // 确定此列表项在滚动页面中的百分比位置
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // 根据滚动百分比计算背景的垂直对齐方式。
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // 将背景对齐转换为像素偏移以用于绘画目的
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // 绘图
    context.paintChild(
      0,
      transform:
          Transform.translate(offset: Offset(0.0, childRect.top)).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    // 在有滚动导致视觉差的时候更新
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}

class Location {
  const Location({
    required this.name,
    required this.place,
    required this.imageUrl,
  });

  final String name;
  final String place;
  final String imageUrl;
}

const locations = [
  Location(
    name: 'Mount Rushmore',
    place: 'U.S.A',
    imageUrl:
        'https://img0.baidu.com/it/u=2480708158,2152056475&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',
  ),
  Location(
    name: 'Gardens By The Bay',
    place: 'Singapore',
    imageUrl:
        'https://img1.baidu.com/it/u=891229762,141437626&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',
  ),
  Location(
    name: 'Machu Picchu',
    place: 'Peru',
    imageUrl:
        'https://img2.baidu.com/it/u=3211258774,4139542991&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',
  ),
  Location(
    name: 'Vitznau',
    place: 'Switzerland',
    imageUrl:
        'https://img1.baidu.com/it/u=698854192,1986069271&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',
  ),
  Location(
    name: 'Bali',
    place: 'Indonesia',
    imageUrl:
        'https://img2.baidu.com/it/u=2815324622,4237757192&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',
  ),
  Location(
    name: 'Mexico City',
    place: 'Mexico',
    imageUrl:
        'https://img1.baidu.com/it/u=16839782,3345000164&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',
  ),
  Location(
    name: 'Cairo',
    place: 'Egypt',
    imageUrl:
        'https://img0.baidu.com/it/u=24448693,3463416937&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',
  ),
];
