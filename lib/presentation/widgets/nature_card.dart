import 'package:flutter/material.dart';

class NatureCard extends StatelessWidget {
  const NatureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
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
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/element3.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 223,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      style: TextStyle(color: Color(0xFF4B4F63)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '4 Days and 3 Night',
                      style: TextStyle(color: Color(0xFF4B4F63)),
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
                          TextSpan(text: 'per person'),
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
    );
  }
}
