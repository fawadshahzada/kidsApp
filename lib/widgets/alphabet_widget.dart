import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              padding: EdgeInsets.only(left: 30.w),
              child: Text(
                widget.title.alphabet,
                style: TextStyle(
                  color: randomColor(),
                  fontSize: 150.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // (A=Apple) text but A is bold and different color
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                padding: EdgeInsets.only(left: 30.w),
                child: RichText(
                  text: TextSpan(
                    text: '(${widget.title.alphabet}',
                    style: TextStyle(
                      color: randomColor(),
                      fontSize: 35.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '= ${widget.title.forwardAlphabet})',
                        style: TextStyle(
                          color: randomColor(),
                          fontSize: 35.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: 10.h,
          ),
          // speaker icon to play the sound of the alphabet
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(left: 30.w),
              child: IconButton(
                onPressed: () {
                  AudioPlayer().play(
                    AssetSource(
                      widget.title.audioPath,
                    ),
                  );
                },
                icon: Icon(
                  Icons.volume_up,
                  size: 45.sp,
                  color: randomColor(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
