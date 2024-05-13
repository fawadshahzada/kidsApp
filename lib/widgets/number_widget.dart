import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          child: SizedBox(
            child: IconButton(
              onPressed: () {
                AudioPlayer().play(
                  AssetSource(
                    selectedNumber.audioPath,
                  ),
                );
              },
              icon: Icon(
                Icons.volume_up,
                color: randomColor(),
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
              maxLines: 1,
              style: TextStyle(
                color: randomColor(),
                fontSize: 150.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // (1=One) text but 1 is bold and different color
        Align(
          alignment: Alignment.center,
          child: SizedBox(
              child: RichText(
            text: TextSpan(
              text: '(${selectedNumber.number}',
              style: TextStyle(
                color: randomColor(),
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '= ${selectedNumber.numberInWords})',
                  style: TextStyle(
                    color: randomColor(),
                    fontSize: 30.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          )),
        ),
      ],
    );
  }
}
