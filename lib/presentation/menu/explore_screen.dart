// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genbi_app/presentation/menu/nature_page.dart';
import 'package:genbi_app/presentation/widgets/nature_card.dart';
import '../../data/models/chips_model.dart';
import '../widgets/chips_list.dart';
import '../widgets/gradient_overlay.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int tap = 0;

  final List<Chips> chips = [
    Chips(icon: 'assets/chips_nav/flag.svg', title: 'Your Interested'),
    Chips(icon: 'assets/chips_nav/medal.svg', title: 'Specials Deals'),
    Chips(icon: 'assets/chips_nav/map.svg', title: 'Adventure'),
    Chips(icon: 'assets/routing.svg', title: 'Thing To Do'),
    Chips(icon: 'assets/chips_nav/ship.svg', title: 'Water Activity'),
    Chips(icon: 'assets/chips_nav/calendar.svg', title: 'Itinerary'),
    Chips(icon: 'assets/chips_nav/flag1.svg', title: 'Sport'),
    Chips(icon: 'assets/chips_nav/food.svg', title: 'Food'),
    Chips(icon: 'assets/chips_nav/crown.svg', title: 'Luxury'),
    Chips(icon: 'assets/chips_nav/signpost.svg', title: 'Solo'),
    Chips(icon: 'assets/chips_nav/castle.svg', title: 'Cultural'),
    Chips(icon: 'assets/chips_nav/leaf.svg', title: 'Eco-Tourism'),
    Chips(icon: 'assets/chips_nav/building.svg', title: 'Event'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _header(),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    ChipsList(
                      chips: chips,
                      selectedIndex: tap,
                      onTap: (index) => setState(() => tap = index),
                    ),
                    const SizedBox(height: 32),
                    _mostVisited(),
                    const SizedBox(height: 24),
                    _wineTours(),
                    const SizedBox(height: 27),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nature Escapes',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NaturePage(),
                              ),
                            );
                          },
                          child: Text(
                            'See More',
                            style: TextStyle(
                              color: Color(0xFF249191),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 19),
                    NatureCard(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Верхняя часть
  Widget _header() {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 388,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            child: Image.asset(
              'assets/element4.png',
              fit: BoxFit.cover,
              alignment: Alignment.centerRight,
            ),
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 278),
            Padding(
              padding: const EdgeInsets.all(18),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                cursorColor: Colors.transparent,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 23),
                  hintText: 'Where to?',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset('assets/explore.svg'),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFebebeb).withOpacity(0.94),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _mostVisited() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Most Visited',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'See All',
                style: TextStyle(color: Color(0xFF249191), fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                width: 204,
                margin: const EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/element3.jpg',
                        width: 204,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                      const GradientOverlay(width: 204, height: 160),
                      const Positioned(
                        bottom: 8,
                        left: 8,
                        child: Text(
                          'Kara-Koy\nOsh, Kyrgyzstan',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _wineTours() {
    return Stack(
      children: [
        Image.asset(
          'assets/element1.jpg',
          width: double.infinity,
          height: 433,
          fit: BoxFit.cover,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 334, left: 15),
          child: ListTile(
            title: Text(
              'Wine Tours',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            subtitle: Text(
              'Explore stunning vineyards',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
