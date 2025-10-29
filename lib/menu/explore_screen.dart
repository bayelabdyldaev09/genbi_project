// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<Chips> chips = [
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
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 388,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                      child: Image.network(
                        'assets/background.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 278),
                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: TextField(
                          style: const TextStyle(color: Colors.black),
                          cursorColor: Colors.transparent,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 23,
                            ),
                            hintText: 'Where to?',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: SvgPicture.asset('assets/explore.svg'),
                            ),
                            filled: true,
                            fillColor: const Color(
                              0xFFebebeb,
                            ).withOpacity(0.94),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    SizedBox(
                      height: 44,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: chips.length,
                        itemBuilder: (context, index) {
                          final isSelected = index == tap;
                          return InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                tap = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 16),
                              padding: EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Color(0xFFF2F4FC)
                                    : Colors.white,
                                border: Border.all(
                                  width: 1,
                                  color: isSelected
                                      ? Colors.transparent
                                      : Color(0xFFF2F4FC),
                                ),
                                borderRadius: BorderRadius.circular(38),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    chips[index].icon,
                                    color: isSelected
                                        ? Color(0xFF249191)
                                        : Color(0xFF6B6E80),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    chips[index].title,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Color(0xFF249191)
                                          : Color(0xFF6B6E80),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Most Visited',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'See All',
                            style: TextStyle(
                              color: Color(0xFF249191),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 204,
                            margin: EdgeInsets.only(right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(15),
                              child: Stack(
                                children: [
                                  Image.network(
                                    width: 204,
                                    height: 160,
                                    'assets/card.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                  gradient(204, 160),
                                  Column(
                                    children: [
                                      SizedBox(height: 88),
                                      ListTile(
                                        title: Text(
                                          'Kara-Koy',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        subtitle: Text(
                                          'Osh, Kyrgyzstan',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        textColor: Colors.white,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24),
                    Stack(
                      children: [
                        Image.asset(
                          'assets/element1.jpg',
                          width: double.infinity,
                          height: 433,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 334, left: 15),
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
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
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
                          onPressed: () {},
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
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            spreadRadius: 0.2,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(8),
                            child: Image.asset(
                              'assets/element3.jpg',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 223,
                            ),
                          ),
                          SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Outdoor Adventure',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF4B4F63),
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: '4.8',
                                        children: [
                                          TextSpan(
                                            text: '(550)',
                                            style: TextStyle(
                                              color: Color(0xFF4B4F63),
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Row(
                                  children: [
                                    Text(
                                      'Love River',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF4B4F63),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      'Pickup Available - Skip the Line',
                                      style: TextStyle(
                                        color: Color(0xFF4B4F63),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '4 Days and 3 Night',
                                      style: TextStyle(
                                        color: Color(0xFF4B4F63),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'From ',
                                        children: [
                                          TextSpan(
                                            text: '700сом ',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          TextSpan(text: 'per person')
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int tap = 0;
}

Container gradient(double width, double height) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.center,
        colors: [Colors.black, Colors.transparent],
      ),
    ),
  );
}

class Chips {
  Chips({required this.icon, required this.title});
  String icon;
  String title;
}
