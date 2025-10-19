import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  Future<void> _requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Разрешение отклонено пользователем');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Разрешение отклонено навсегда');
      return;
    }

    print('Разрешение предоставлено');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 34),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 22,
                    color: Colors.blueGrey,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        'Skip',
                        style: TextStyle(
                          color: Color(0xFF249191),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Color(0xFF249191),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              AspectRatio(
                aspectRatio: 18 / 15,
                child: SvgPicture.asset(
                  'assets/map_picture.svg',
                  fit: BoxFit.cover, // или contain, в зависимости от эффекта
                ),
              ),
              Column(
                children: [
                  Text(
                    'What is your Location?',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  'We need to know your location in order to suggest\nnearby services',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 134),
                InkWell(
                  onTap: () {
                    _requestPermission;
                  },
                  child: Container(
                    width: double.infinity,
                    height: 52,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xFF249191),
                    ),
                    child: Text(
                      'Allow Location Access',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 23),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Set Location',
                    style: TextStyle(color: Color(0xFF249191), fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
