

import 'package:flutter/material.dart';
import 'package:tune/models/tune_model.dart';

import '../widgets/black_key.dart';
import '../widgets/white_key.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
// list of tunes
  final List<Tunes> whiteKeys = [
    Tunes(color: Colors.white, sound: 'sounds/note1.wav'),
    Tunes(color: Colors.white, sound: 'sounds/note2.wav'),
    Tunes(color: Colors.white, sound: 'sounds/note3.wav'),
    Tunes(color: Colors.white, sound: 'sounds/note4.wav'),
    Tunes(color: Colors.white, sound: 'sounds/note5.wav'),
    Tunes(color: Colors.white, sound: 'sounds/note6.wav'),
    Tunes(color: Colors.white, sound: 'sounds/note2.wav'),
    Tunes(color: Colors.white, sound: 'sounds/note5.wav'),
    Tunes(color: Colors.white, sound: 'sounds/note7.wav'),
    Tunes(color: Colors.white, sound: 'sounds/note1.wav'),
    Tunes(color: Colors.white, sound: 'sounds/note2.wav'),
    Tunes(color: Colors.white, sound: 'sounds/note4.wav'),
  ];

  final List<int> blackKeyIndices = [0, 1, 3, 4, 6, 7, 9, 10];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final blackKeyWidth = screenWidth * 0.6;
    final blackKeyHeight = screenHeight * 0.045;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              Container(height: 80, width: double.infinity, color: Colors.white),
              ...whiteKeys.map((tune) => WhiteKey(tune: tune)),
              Container(height: 10, width: double.infinity, color: Colors.white),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 80),
              ...List.generate(whiteKeys.length, (index) {
                if (blackKeyIndices.contains(index)) {
                  return BlackKey(
                    tune: whiteKeys[index],
                    width: blackKeyWidth,
                    height: blackKeyHeight,
                  );
                } else {
                  return const Expanded(child: SizedBox());
                }
              }),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
