import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genbi_app/presentation/primary_pages/location_screen.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  final List<ImageList> imageList = [
    ImageList(
      image: 'assets/element1.jpg',
      title: 'Find Your Dream Adventure Here',
      description:
          'Explore unique destinations and plan unforgettable journeys.',
    ),
    ImageList(
      image: 'assets/element3.jpg',
      title: 'Easily save your favorite journeys',
      description: 'Quickly save and revisit your favorite spot with TripMate.',
    ),
    ImageList(
      image: 'assets/element4.png',
      title: 'Plan Your Dream Trip With TripMate',
      description: 'Plan your dream trip with ease and make it unforgettable.',
    ),
  ];

  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    bool isLast = _currentIndex == imageList.length - 1;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 34),
          SvgPicture.asset(
            'assets/genbi.svg',
            width: double.infinity,
            height: 68,
          ),
          SizedBox(height: 24),
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: 444,
              enableInfiniteScroll: false,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: imageList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(36),
                      child: Image.asset(i.image, fit: BoxFit.cover),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 24),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 52),
            child: Text(
              imageList[_currentIndex].title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: 12),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 52),
            child: Text(
              imageList[_currentIndex].description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(child: SizedBox(width: double.infinity,)),
          Container(
            padding: EdgeInsets.only(left: 52, right: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: imageList.asMap().entries.map((entry) {
                    bool isActive = _currentIndex == entry.key;
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: isActive ? 38 : 12,
                      height: 12,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: isActive ? Color(0xFF249191) : Colors.grey[300],
                      ),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: isLast ? EdgeInsets.only(left: 0) : EdgeInsets.only(left: 52),
                    backgroundColor: isLast ? Color(0xFF249191) : Colors.white,
                    foregroundColor: isLast ? Colors.white : Color(0xFF249191),
                    minimumSize: Size(143, 48),
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: isLast ? 4 : 0,
                  ),
                  onPressed: () {
                    if (isLast) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LocationScreen(),
                        ),
                      );
                    } else {
                      int lastIndex = imageList.length - 1;
                      _carouselController.jumpToPage(lastIndex);
                      setState(() => _currentIndex = lastIndex);
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        isLast ? "Get Started" : "Skip",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward_ios, size: 14),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 54)
        ],
      ),
    );
  }
}

class ImageList {
  ImageList({
    required this.image,
    required this.title,
    required this.description,
  });
  String image;
  String title;
  String description;
}
