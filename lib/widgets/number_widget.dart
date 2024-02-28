import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../class/numbers_class.dart';

Color randomColor() {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)];
}


class NumberWidget extends StatelessWidget {
  const NumberWidget({
    super.key,
    required this.selectedNumber,
  });

  final Numbers selectedNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.only(right: 40),
            child: IconButton(
              onPressed: () {
                AudioPlayer().play(AssetSource(selectedNumber.audioPath));
              },
              icon: const Icon(
                Icons.volume_up,
                size: 40,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.only(left: 0),
            child: Text(
              selectedNumber.number,
              style: TextStyle(
                fontSize: 150,
                color: randomColor(),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // (1=One) text but 1 is bold and different color
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.only(left: 0),
            child: RichText(
              text: TextSpan(
                text: '(${selectedNumber.number}',
                style: TextStyle(
                  color: randomColor(),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '= ${selectedNumber.numberInWords})',
                    style: TextStyle(
                      color: randomColor(),
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            )
          ),
        ),
      ],
    );
  }
}