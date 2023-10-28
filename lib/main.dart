import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'creators_page.dart';


void main() {
  runApp(const PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  const PhotoGalleryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: PhotoGrid(),
      routes: {
        '/creators': (context) => CreatorsPage(),
        '/photoViewer': (context) => PhotoViewer(),
      },
    );
  }
}

class PhotoGrid extends StatelessWidget {
  final List<String> images = [
    'assets/images/1.jpeg',
    'assets/images/1.jpeg',
    'assets/images/1.jpeg',
    'assets/images/1.jpeg','assets/images/1.jpeg','assets/images/1.jpeg',
    'assets/images/1.jpeg',
    'assets/images/1.jpeg',

    // Add more image paths here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.pushNamed(context, '/creators');
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/photoViewer', arguments: {
                'images': images,
                'initialIndex': index,
              });
            },
            child: Hero(
              tag: images[index],
              child: Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PhotoViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final List<String> images = args['images'] as List<String>;
    final int initialIndex = args['initialIndex'] as int;

    return Scaffold(
      appBar: AppBar(),
      body: PageView.builder(
        itemCount: images.length,
        controller: PageController(initialPage: initialIndex),
        itemBuilder: (context, index) {
          return Hero(
            tag: images[index],
            child: PhotoView(
              imageProvider: AssetImage(images[index]),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 2,
            ),
          );
        },
      ),
    );
  }
}
