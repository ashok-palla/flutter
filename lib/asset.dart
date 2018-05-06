import 'package:flutter/material.dart';

const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

class Photo {
  Photo({
    this.assetName,
    this.assetPackage,
    this.title,
    this.caption,
    this.isFavorite: false,
  });

  final String assetName;
  final String assetPackage;
  final String title;
  final String caption;
  bool isFavorite;
}

class Asset extends StatefulWidget {
  Asset({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AssetState createState() => new _AssetState();
}

class _AssetState extends State<Asset> {
  List<Photo> photos = <Photo>[
    new Photo(
      assetName: 'landscape_0.jpg',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Philippines',
      caption: 'Batad rice terraces',
    ),
    new Photo(
      assetName: 'landscape_1.jpg',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Italy',
      caption: 'Ceresole Reale',
    ),
    new Photo(
      assetName: 'landscape_2.jpg',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Somewhere',
      caption: 'Beautiful mountains',
    ),
    new Photo(
      assetName: 'landscape_3.jpg',
      assetPackage: _kGalleryAssetsPackage,
      title: 'A place',
      caption: 'Beautiful hills',
    ),
    new Photo(
      assetName: 'landscape_4.jpg',
      assetPackage: _kGalleryAssetsPackage,
      title: 'New Zealand',
      caption: 'View from the van',
    ),
    new Photo(
      assetName: 'landscape_5.jpg',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Autumn',
      caption: 'The golden season',
    ),
    new Photo(
      assetName: 'landscape_6.jpg',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Germany',
      caption: 'Englischer Garten',
    ),
    new Photo(
      assetName: 'landscape_7.jpg',
      assetPackage: _kGalleryAssetsPackage,
      title: 'A country',
      caption: 'Grass fields',
    ),
    new Photo(
      assetName: 'landscape_8.jpg',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Mountain country',
      caption: 'River forest',
    ),
    new Photo(
      assetName: 'landscape_9.jpg',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Alpine place',
      caption: 'Green hills',
    ),
    new Photo(
      assetName: 'landscape_10.jpg',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Desert land',
      caption: 'Blue skies',
    ),
    new Photo(
      assetName: 'landscape_11.jpg',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Narnia',
      caption: 'Rocks and rivers',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: new SafeArea(
              top: false,
              bottom: false,
              child: new GridView.count(
                crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                padding: const EdgeInsets.all(4.0),
                childAspectRatio: (orientation == Orientation.portrait) ? 1.0 : 1.3,
                children: photos.map((Photo photo) {
                  return new Text(photo.title);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
