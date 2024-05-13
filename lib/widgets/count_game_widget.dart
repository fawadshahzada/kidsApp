import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:kidsapp/class/count_game_class.dart';

Color randomColor() {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)];
}

class CountGameWidget extends StatefulWidget {
  final CountGame game;
  final Function() onCorrectAnswer;


  const CountGameWidget({
    Key? key,
    required this.game,
    required this.onCorrectAnswer,
  }) : super(key: key);

  @override
  State<CountGameWidget> createState() => _CountGameWidgetState();
}

class _CountGameWidgetState extends State<CountGameWidget> {
  bool isCorrect = false;
  late ConfettiController _controllerCenter;
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;
  late ConfettiController _controllerTopCenter;
  late ConfettiController _controllerBottomCenter;
  bool isSnackBarShowing = false;


  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 2));
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 2));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 2));
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 2));
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    _controllerTopCenter.dispose();
    _controllerBottomCenter.dispose();
    _controllerCenter.stop();
    _controllerCenterRight.stop();
    _controllerCenterLeft.stop();
    _controllerTopCenter.stop();
    _controllerBottomCenter.stop();
    super.dispose();
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<int> shuffledAnswers = [
      widget.game.correctAnswer,
      widget.game.wrongAnswer1,
      widget.game.wrongAnswer2,
      widget.game.wrongAnswer3,
    ]..shuffle();

    void showFeedback(bool isCorrect) async {
      if (isCorrect) {
        _controllerCenter.play();
        _controllerBottomCenter.play();
        _controllerCenterLeft.play();
        _controllerCenterRight.play();
        _controllerTopCenter.play();
        // wait for 3 seconds then stop the controllers
        Future.delayed(const Duration(seconds: 1), () {
          _controllerCenter.stop();
          _controllerBottomCenter.stop();
          _controllerCenterLeft.stop();
          _controllerCenterRight.stop();
          _controllerTopCenter.stop();
          widget.onCorrectAnswer();
        });
      }
      player.play(isCorrect
          ? AssetSource('voice/shapes_game/success.mp3')
          : AssetSource('voice/shapes_game/wrong.mp3'));

      if (mounted && !isSnackBarShowing) {  // Check if the widget is still in the tree and SnackBar is not already showing
        isSnackBarShowing = true;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: GlassContainer(
              opacity: 0.1,
              shadowStrength: 8,
              color: Colors.white.withOpacity(0.1),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  randomColor(),
                  randomColor(),
                ],
              ),
              child: Column(
                children: [
                  isCorrect
                      ? Image.asset(
                    'assets/images/congrats.gif',
                    height: 50.h,
                    width: 70.w,
                    fit: BoxFit.cover,
                  )
                      : Image.asset(
                    'assets/images/lion_face.png',
                    height: 50.h,
                    width: 70.w,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    isCorrect ? 'Correct!' : 'Oops, try again!',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: isCorrect ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            duration: const Duration(seconds: 1),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 10.h,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ).closed.then((reason) {
          isSnackBarShowing = false;
        });
      }
    }

    return SizedBox(
      height: height * 0.65,
      width: width * 0.8,
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _controllerCenter,
              blastDirectionality: BlastDirectionality.explosive,
              // don't specify a direction, blast randomly
              shouldLoop: true,
              // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ],
              // manually specify the colors to be used
              createParticlePath: drawStar, // define a custom shape/path.
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: StaggeredGrid.count(
                crossAxisCount: 5,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: [
                  for (int i = 0; i < widget.game.numberOfItems; i++)
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xffae3c39).withOpacity(0.3),
                              spreadRadius: 8,
                              blurRadius: 40,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.asset(
                            widget.game.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ConfettiWidget(
              confettiController: _controllerCenterLeft,
              blastDirectionality: BlastDirectionality.explosive,
              // don't specify a direction, blast randomly
              shouldLoop: true,
              // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ],
              // manually specify the colors to be used
              createParticlePath: drawStar, // define a custom shape/path.
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildAnswerButton(shuffledAnswers[0], showFeedback),
              buildAnswerButton(shuffledAnswers[1], showFeedback),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ConfettiWidget(
              confettiController: _controllerCenterRight,
              blastDirectionality: BlastDirectionality.explosive,
              // don't specify a direction, blast randomly
              shouldLoop: true,
              // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ],
              // manually specify the colors to be used
              createParticlePath: drawStar, // define a custom shape/path.
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildAnswerButton(shuffledAnswers[2], showFeedback),
              buildAnswerButton(shuffledAnswers[3], showFeedback),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ConfettiWidget(
              confettiController: _controllerBottomCenter,
              blastDirectionality: BlastDirectionality.explosive,
              // don't specify a direction, blast randomly
              shouldLoop: true,
              // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ],
              // manually specify the colors to be used
              createParticlePath: drawStar, // define a custom shape/path.
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAnswerButton(int answer, Function(bool) showFeedback) {
    return SizedBox(
      width: 120.w,
      height: 80.h,
      child: ElevatedButton(
        onPressed: () {
          showFeedback(answer == widget.game.correctAnswer);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: randomColor(),
          textStyle: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Text(
          answer.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
