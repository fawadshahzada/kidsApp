import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kidsapp/widgets/count_game_level1_handler.dart';
import 'package:kidsapp/widgets/count_game_level2_handler.dart';
import '../class/count_game_class.dart';
import '../widgets/count_game_level3_handler.dart';
import '../widgets/count_game_level4_handler.dart';

// random color
Color randomColor() {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)];
}

class CountGameScreen extends StatelessWidget {
  const CountGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // back button
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Count The Animals',
                style: TextStyle(
                  fontFamily: 'Merchindise',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                  color: Color(
                    0xffae3c39,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // long Grid container
                padding: const EdgeInsets.all(30),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.65,
                children: [
                  // level 1
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Level1Handler(
                            games: CountGame.getCountGameLevel1());
                      }));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/lion_face.png',
                          ),
                          fit: BoxFit.contain,
                          opacity: 0.5,
                        ),
                        color: randomColor().withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Level 1',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Counting 1-5',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // level 2
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Level2Handler(
                            games: CountGame.getCountGameLevel2());
                      }));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/bird.png',
                          ),
                          fit: BoxFit.contain,
                          opacity: 0.5,
                        ),
                        color: randomColor().withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Level 2',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Counting 5-10',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // level 3
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Level3Handler(
                            games: CountGame.getCountGameLevel3());
                      }));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/cat.png',
                          ),
                          fit: BoxFit.contain,
                          opacity: 0.5,
                        ),
                        color: randomColor().withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Level 3',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Counting 10-15',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // level 4
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Level4Handler(
                            games: CountGame.getCountGameLevel4());
                      }));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/rabbit.png',
                          ),
                          fit: BoxFit.contain,
                          opacity: 0.5,
                        ),
                        color: randomColor().withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Level 4',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Counting 15-20',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
