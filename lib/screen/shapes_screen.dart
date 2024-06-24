import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:provider/provider.dart';
import '../state_management/shapes_provider.dart';

class ShapesScreen extends StatelessWidget {
  const ShapesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var shape = Provider.of<ShapeProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            buildGameScreen(context, shape),
            Center(child: buildCongratulationsScreen(context, shape)),
          ],
        ),
      ),
    );
  }

  Row buildGameScreen(BuildContext context, ShapeProvider shape) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            color: const Color(0xfff0e8e0),
            child: Column(
              children: [
                // back button long
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 45,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          shape.resetShapes();
                        },
                        icon: const Icon(
                          Icons.replay,
                          size: 45,
                        ),
                      ),
                    ],
                  ),
                ),
                // title Shapes
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.only(left: 40),
                    child: const Text(
                      'Shapes',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // some text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.only(left: 40),
                    child: const Text(
                      'Place the corresponding shapes in the shaped area',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      // square
                      Positioned(
                        top: 150,
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: DragTarget(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return accepted.isEmpty
                                    ? Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: Opacity(
                                          opacity:
                                              shape.isHexagonAccepted ? 1 : 0.2,
                                          child: Image.asset(
                                            'assets/images/hexagon.png',
                                            height: 140,
                                            width: 140,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: Image.asset(
                                          'assets/images/hexagon.png',
                                          height: 140,
                                          width: 140,
                                        ),
                                      );
                              },
                              onAccept: (data) {
                                if (data == 'hexagon') {
                                  AudioPlayer().play(AssetSource(
                                      'voice/shapes_game/success.mp3'));
                                  shape.setHexagonAccepted = (true);
                                } else {
                                  AudioPlayer().play(AssetSource(
                                      'voice/shapes_game/wrong.mp3'));
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      // triangle
                      Positioned(
                        top: 0,
                        right: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DragTarget(
                            builder: (
                              BuildContext context,
                              List<dynamic> accepted,
                              List<dynamic> rejected,
                            ) {
                              return accepted.isEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Opacity(
                                        opacity:
                                            shape.isCircleAccepted ? 1 : 0.2,
                                        child: Image.asset(
                                          'assets/images/circle.png',
                                          height: 140,
                                          width: 140,
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Opacity(
                                        opacity: 1,
                                        child: Image.asset(
                                          'assets/images/circle.png',
                                          height: 140,
                                          width: 140,
                                        ),
                                      ),
                                    );
                            },
                            onAccept: (data) {
                              if (data == 'circle') {
                                shape.setCircleAccepted = (true);
                                AudioPlayer().play(AssetSource(
                                    'voice/shapes_game/success.mp3'));
                              } else {
                                AudioPlayer().play(
                                    AssetSource('voice/shapes_game/wrong.mp3'));
                              }
                            },
                          ),
                        ),
                      ),
                      // circle
                      Positioned(
                        bottom: 140,
                        right: 10,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: DragTarget(
                            builder: (
                              BuildContext context,
                              List<dynamic> accepted,
                              List<dynamic> rejected,
                            ) {
                              return accepted.isEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Opacity(
                                        opacity:
                                            shape.isSquareAccepted ? 1 : 0.2,
                                        child: Image.asset(
                                          'assets/images/square.png',
                                          height: 140,
                                          width: 140,
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Opacity(
                                        opacity: 1,
                                        child: Image.asset(
                                          'assets/images/square.png',
                                          height: 140,
                                          width: 140,
                                        ),
                                      ),
                                    );
                            },
                            onAccept: (data) {
                              if (data == 'square') {
                                AudioPlayer().play(AssetSource(
                                    'voice/shapes_game/success.mp3'));
                                shape.setSquareAccepted = (true);
                              } else {
                                AudioPlayer().play(
                                    AssetSource('voice/shapes_game/wrong.mp3'));
                              }
                            },
                          ),
                        ),
                      ),
                      // hexagon
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: DragTarget(
                          builder: (
                            BuildContext context,
                            List<dynamic> accepted,
                            List<dynamic> rejected,
                          ) {
                            return accepted.isEmpty
                                ? Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Opacity(
                                      opacity:
                                          shape.isTriangleAccepted ? 1 : 0.2,
                                      child: Image.asset(
                                        'assets/images/triangle.png',
                                        height: 140,
                                        width: 140,
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Opacity(
                                      opacity: 1,
                                      child: Image.asset(
                                        'assets/images/triangle.png',
                                        height: 140,
                                        width: 140,
                                      ),
                                    ),
                                  );
                          },
                          onWillAccept: (data) {
                            if (data == 'triangle') {
                              return true;
                            } else {
                              return false;
                            }
                          },
                          onAccept: (data) {
                            if (data == 'triangle') {
                              AudioPlayer().play(
                                  AssetSource('voice/shapes_game/success.mp3'));
                              shape.setTriangleAccepted = (true);
                            } else {
                              AudioPlayer().play(
                                  AssetSource('voice/shapes_game/wrong.mp3'));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            // column consist of shape images with evenly spaced item. these item can be draggede
            color: const Color(0xffffffff),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //score out of 4
                Text(
                  '${shape.score} / 4',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // square
                Draggable(
                  data: 'square',
                  maxSimultaneousDrags: shape.isSquareAccepted ? 0 : 1,
                  feedback: Image.asset(
                    'assets/images/square.png',
                    height: 130,
                    width: 130,
                  ),
                  child: shape.isSquareAccepted
                      ? correctAnswer('assets/images/square.png')
                      : Opacity(
                          opacity: shape.isSquareAccepted ? 0.2 : 1,
                          child: Image.asset(
                            'assets/images/square.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                ),
                // hexagon
                Draggable(
                  maxSimultaneousDrags: shape.isHexagonAccepted ? 0 : 1,
                  data: 'hexagon',
                  feedback: Image.asset(
                    'assets/images/hexagon.png',
                    height: 130,
                    width: 130,
                  ),
                  child: shape.isHexagonAccepted
                      ? correctAnswer('assets/images/hexagon.png')
                      : Opacity(
                          opacity: 1,
                          child: Image.asset(
                            'assets/images/hexagon.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                ),
                // triangle
                Draggable(
                  maxSimultaneousDrags: shape.isTriangleAccepted ? 0 : 1,
                  data: 'triangle',
                  feedback: Image.asset(
                    'assets/images/triangle.png',
                    height: 130,
                    width: 130,
                  ),
                  child: shape.isTriangleAccepted
                      ? correctAnswer('assets/images/triangle.png')
                      : Opacity(
                          opacity: shape.isTriangleAccepted ? 0.2 : 1,
                          child: Image.asset(
                            'assets/images/triangle.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                ),
                // circle
                Draggable(
                  maxSimultaneousDrags: shape.isCircleAccepted ? 0 : 1,
                  data: 'circle',
                  feedback: Image.asset(
                    'assets/images/circle.png',
                    height: 130,
                    width: 130,
                  ),
                  child: shape.isCircleAccepted
                      ? correctAnswer('assets/images/circle.png')
                      : Opacity(
                          opacity: shape.isCircleAccepted ? 0.2 : 1,
                          child: Image.asset(
                            'assets/images/circle.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  SizedBox correctAnswer(
    String image,
  ) {
    return SizedBox(
        height: 100,
        width: 100,
        child: Container(
          padding: const EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              opacity: 0.2,
              fit: BoxFit.cover,
            ),
          ),
          child: const Align(
            child: Icon(
              Icons.check,
              size: 40,
              color: Colors.green,
            ),
          ),
        ));
  }

  Widget buildCongratulationsScreen(BuildContext context, ShapeProvider shape) {
    if (shape.areAllShapesAccepted) {
      AudioPlayer().play(AssetSource('voice/shapes_game/congrats.mp3'));
      return Visibility(
        visible: shape.areAllShapesAccepted,
        child: FadeInUpBig(
          child: GlassContainer(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            blur: 0,
            color: Colors.white.withOpacity(0.4),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.withOpacity(0.2),
                Colors.red.withOpacity(0.3),
              ],
            ),
            //--code to remove border
            border: const Border.fromBorderSide(BorderSide.none),
            shadowStrength: 0,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            shadowColor: Colors.white.withOpacity(0.24),
            child: GlassContainer(
              height: 350,
              width: 400,
              blur: 20,
              color: Colors.white.withOpacity(0.4),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/congrats.gif',
                      height: 300, // Set the desired height
                      width: 300, // Set the desired width
                      fit: BoxFit.cover, // This is the default value
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Congratulations!',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 70,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          shape.resetShapes();
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(10),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                          color: Colors.orange))),
                        ),
                        child: const Text(
                          'Close',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 27,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(); // Return an empty container if congratulations screen is not visible
    }
  }
}
