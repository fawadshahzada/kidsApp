import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../class/alphabets_class.dart';

Color randomColor() {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)];
}

class LettersWidget extends StatefulWidget {
  final Alphabets title;

  const LettersWidget({
    super.key,
    required this.title,
  });

  @override
  State<LettersWidget> createState() => _LettersWidgetState();
}

class _LettersWidgetState extends State<LettersWidget> {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                widget.title.alphabet,
                style: TextStyle(
                  color: randomColor(),
                  fontSize: 200,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // (A=Apple) text but A is bold and different color
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 40),
              child: RichText(
                text: TextSpan(
                  text: '(${widget.title.alphabet}',
                  style: TextStyle(
                    color: randomColor(),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '= ${widget.title.forwardAlphabet})',
                      style: TextStyle(
                        color: randomColor(),
                        fontSize: 40,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              )
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // speaker icon to play the sound of the alphabet
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 40),
              child: IconButton(
                onPressed: () {
                  AudioPlayer()
                      .play(AssetSource(widget.title.audioPath));
                },
                icon: const Icon(
                  Icons.volume_up,
                  size: 45,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
