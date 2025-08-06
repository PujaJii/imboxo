import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> latestReleases = [
      'https://picsum.photos/id/1015/200/300',
      'https://picsum.photos/id/1025/200/300',
      'https://picsum.photos/id/1035/200/300',
    ];

    final List<String> trendingNow = [
      'https://picsum.photos/id/1045/300/200',
      'https://picsum.photos/id/1055/300/200',
      'https://picsum.photos/id/1065/300/200',
      'https://picsum.photos/id/1065/300/200',
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leadingWidth: 0,
        leading: SizedBox(),
        title: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset('assets/images/logo.png',scale: 20,)
        ),
        actions: [
          Icon(Icons.notifications_outlined, size: 28, color: Colors.white),
          const SizedBox(width: 16),
           CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 18,
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          // Banner Section
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://picsum.photos/id/1075/800/400',
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.themeColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Watch Now',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),

          const SizedBox(height: 20),

          _sectionTitle('Latest Releases'),
          const SizedBox(height: 10),
          SizedBox(
            height: 220,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: latestReleases.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    latestReleases[index],
                    width: 140,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          _sectionTitle('Trending Now'),
          const SizedBox(height: 10),
          SizedBox(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: trendingNow.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            trendingNow[index],
                            width: 200,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Positioned(
                          bottom: 8,
                          left: 8,
                          child: Icon(Icons.play_circle_fill,
                              color: AppColors.themeColor, size: 28),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Movie Title',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                );
              },
            ),
          ),

          _sectionTitle('Life Fiction Movies'),
          const SizedBox(height: 10),
          SizedBox(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: trendingNow.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        trendingNow[index],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Movie Title',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                );
              },
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
        ],
      ),
    );
  }
}
