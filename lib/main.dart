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
  const LocationListItem({
    super.key,
    required this.country,
    required this.name,
    required this.imageUrl,
  });

  final String imageUrl;
  final String name;
  final String country;

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
    return Positioned.fill(child: Image.network(imageUrl, fit: BoxFit.cover));
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

const urlPrefix =
    'https://docs.flutter.dev/cookbook/img-files/effects/parallax';

const locations = [
  Location(
    name: 'Mount Rushmore',
    place: 'U.S.A',
    imageUrl: '$urlPrefix/01-mount-rushmore.jpg',
  ),
  Location(
    name: 'Gardens By The Bay',
    place: 'Singapore',
    imageUrl: '$urlPrefix/02-singapore.jpg',
  ),
  Location(
    name: 'Machu Picchu',
    place: 'Peru',
    imageUrl: '$urlPrefix/03-machu-picchu.jpg',
  ),
  Location(
    name: 'Vitznau',
    place: 'Switzerland',
    imageUrl: '$urlPrefix/04-vitznau.jpg',
  ),
  Location(
    name: 'Bali',
    place: 'Indonesia',
    imageUrl: '$urlPrefix/05-bali.jpg',
  ),
  Location(
    name: 'Mexico City',
    place: 'Mexico',
    imageUrl: '$urlPrefix/06-mexico-city.jpg',
  ),
  Location(
    name: 'Cairo',
    place: 'Egypt',
    imageUrl: '$urlPrefix/07-cairo.jpg',
  ),
];