import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = ['All', 'Hindi', 'English', 'Bengali', 'Urdu', 'Chinese'];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 10,
          leading: SizedBox(),
          title: const Text('Collection'),
          bottom: TabBar(
            isScrollable: true,

            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          ),
          actions: const [
            Icon(Icons.notifications_outlined, size: 28),
            SizedBox(width: 16),
            CircleAvatar(backgroundColor: Colors.grey, radius: 18),
            SizedBox(width: 16),
          ],
        ),
        body: TabBarView(
          children: tabs.map((tab) {
            if (tab == 'All') {
              return AllCollectionPage();
            } else {
              return Center(child: Text(tab, style: const TextStyle(fontSize: 24)));
            }
          }).toList(),
        ),
      ),
    );
  }
}

class AllCollectionPage extends StatelessWidget {
  final List<String> imageUrls = [
    'https://picsum.photos/id/1015/600/400',
    'https://picsum.photos/id/1025/600/400',
    'https://picsum.photos/id/1035/600/400',
    'https://picsum.photos/id/1045/600/400',
    'https://picsum.photos/id/1055/600/400',
    'https://picsum.photos/id/1065/600/400',
    'https://picsum.photos/id/1075/600/400',

    'https://picsum.photos/id/1015/600/400',
    'https://picsum.photos/id/1025/600/400',
    'https://picsum.photos/id/1035/600/400',
    'https://picsum.photos/id/1045/600/400',
    'https://picsum.photos/id/1055/600/400',
    'https://picsum.photos/id/1065/600/400',
    'https://picsum.photos/id/1075/600/400',

    'https://picsum.photos/id/1015/600/400',
    'https://picsum.photos/id/1025/600/400',
    'https://picsum.photos/id/1035/600/400',
    'https://picsum.photos/id/1045/600/400',
    'https://picsum.photos/id/1055/600/400',
    'https://picsum.photos/id/1065/600/400',
    'https://picsum.photos/id/1075/600/400',


    'https://picsum.photos/id/1075/600/400',


  ];

  AllCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final smallBoxWidth = (screenWidth - 40) / 3;
    final bigBoxWidth = screenWidth * 0.6;
    final smallColumnBoxWidth = screenWidth - bigBoxWidth - 30;

    final List<Widget> rows = [];
    int index = 0;
    int rowCount = 0;

    while (index + 2 < imageUrls.length) {
      if (rowCount % 4 == 0) {
        // Pattern B
        rows.add(RowPatternB(
          big: imageUrls[index],
          small1: imageUrls[index + 1],
          small2: imageUrls[index + 2],
          bigWidth: bigBoxWidth,
          smallWidth: smallColumnBoxWidth,
        ));
      } else if (rowCount % 2 == 1) {
        // Pattern A
        rows.add(RowPatternA(
          urls: imageUrls.sublist(index, index + 3),
          width: smallBoxWidth,
        ));
      } else {
        // Pattern C
        rows.add(RowPatternC(
          small1: imageUrls[index],
          small2: imageUrls[index + 1],
          big: imageUrls[index + 2],
          bigWidth: bigBoxWidth,
          smallWidth: smallColumnBoxWidth,
        ));
      }

      rowCount++;
      index += 3;
    }

    // Handle remaining images (1 or 2)
    final remaining = imageUrls.length - index;
    if (remaining == 1) {
      rows.add(Center(
        child: CachedImageBox(
          url: imageUrls[index],
          width: screenWidth - 20,
          height: 200,
        ),
      ));
    } else if (remaining == 2) {
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CachedImageBox(
            url: imageUrls[index],
            width: (screenWidth - 30) / 2,
            height: 180,
          ),
          CachedImageBox(
            url: imageUrls[index + 1],
            width: (screenWidth - 30) / 2,
            height: 180,
          ),
        ],
      ));
    }

    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: rows.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (_, i) => rows[i],
      ),
    );
  }

}

class RowPatternA extends StatelessWidget {
  final List<String> urls;
  final double width;

  const RowPatternA({required this.urls, required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: urls.map((url) {
        return CachedImageBox(
          url: url,
          width: width,
          height: 150,
        );
      }).toList(),
    );
  }
}

class RowPatternB extends StatelessWidget {
  final String big, small1, small2;
  final double bigWidth, smallWidth;

  const RowPatternB({
    required this.big,
    required this.small1,
    required this.small2,
    required this.bigWidth,
    required this.smallWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedImageBox(
          url: big,
          width: bigWidth,
          height: 310,
          margin: const EdgeInsets.only(right: 10),
        ),
        Column(
          children: [
            CachedImageBox(
              url: small1,
              width: smallWidth,
              height: 150,
              margin: const EdgeInsets.only(bottom: 10),
            ),
            CachedImageBox(
              url: small2,
              width: smallWidth,
              height: 150,
            ),
          ],
        ),
      ],
    );
  }
}

class RowPatternC extends StatelessWidget {
  final String small1, small2, big;
  final double bigWidth, smallWidth;

  const RowPatternC({
    required this.small1,
    required this.small2,
    required this.big,
    required this.bigWidth,
    required this.smallWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CachedImageBox(
              url: small1,
              width: smallWidth,
              height: 150,
              margin: const EdgeInsets.only(bottom: 10, right: 10),
            ),
            CachedImageBox(
              url: small2,
              width: smallWidth,
              height: 150,
              margin: const EdgeInsets.only(right: 10),
            ),
          ],
        ),
        CachedImageBox(
          url: big,
          width: bigWidth,
          height: 310,
        ),
      ],
    );
  }
}

class CachedImageBox extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;

  const CachedImageBox({
    required this.url,
    required this.width,
    required this.height,
    this.margin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[300],
        image: DecorationImage(
          image: CachedNetworkImageProvider(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
