import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kidsapp/widgets/count_game_widget.dart';

import '../class/count_game_class.dart';
Color randomColor() {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)];
}
class Level3Handler extends StatefulWidget {
  final List<CountGame> games;
  const Level3Handler({super.key, required this.games});

  @override
  State<Level3Handler> createState() => _Level3HandlerState();
}

class _Level3HandlerState extends State<Level3Handler> {
  int level = 0;
  List<int> shuffleLevel = [11,12,13,14,15];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Level 3',
          style: TextStyle(
            fontFamily: 'Merchindise',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
            color: Color(0xffae3c39),
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Color(0xffae3c39),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Count the ${widget.games[level].title}?',
                style: const TextStyle(
                  fontSize: 24,
                  color: Color(0xffae3c39),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CountGameWidget(game: widget.games[level], onCorrectAnswer: () {
              setState(() {
                level = (level + 1) % widget.games.length;
              });
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      level = (level - 1) % widget.games.length;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: randomColor(),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text('Previous',style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),),
                ),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Container(
                height: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      level = (level + 1) % widget.games.length;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: randomColor(),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text('Next',style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

