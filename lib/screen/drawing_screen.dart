import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class DrawingCanvas extends StatefulWidget {
  const DrawingCanvas({Key? key}) : super(key: key);

  @override
  State<DrawingCanvas> createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<DrawingCanvas> {
  List<List<Offset>> lines = [];
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0e8e0),
      body: Stack(
        children: [
          // back button
          GestureDetector(
            onPanDown: (details) {
              setState(() {
                lines.add([details.globalPosition]);
              });
            },
            onPanUpdate: (details) {
              setState(() {
                lines.last.add(details.globalPosition);
              });
            },
            onPanEnd: (details) => setState(() {}),
            child: CustomPaint(
              painter: Draw(color, lines: lines),
              size: Size.infinite,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical:10),
              color: Colors.blue,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 40),
                child: SizedBox(
                  width: 600,
                  height: 30,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 40),
                      //draw anything text
                      Text(
                        'Draw Anything',
                        style: const TextStyle(
                          fontSize: 30,
                          fontFamily: 'Merchindise',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 60,),
                      IconButton(
                        icon: const Icon(
                          Icons.color_lens_outlined,
                          size: 30,
                          color: Colors.yellow,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Pick a color!'),
                                content: SingleChildScrollView(
                                  child: BlockPicker(
                                    pickerColor: Colors.white,
                                    onColorChanged: (newColor) {
                                      setState(() => color = newColor);
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Positioned(
          //   top: 10,
          //   left: 10,
          //   child: Padding(
          //     padding: const EdgeInsets.all(40),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         IconButton(
          //           icon: const Icon(
          //             Icons.arrow_back_ios,
          //             size: 30,
          //           ),
          //           onPressed: () {
          //             Navigator.pop(context);
          //           },
          //         ),
          //       ],
          //     ),
          //   ),
          //   //clear button in the bottom bar of the screen
          // ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 80,
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: FloatingActionButton.extended(
          backgroundColor: Colors.blue,
          icon: const Icon(Icons.clear,color: Colors.white,size: 35,),
          label: const Text('Clear',style: TextStyle(color: Colors.white,fontSize: 25),),
          onPressed: () {
            setState(() => lines.clear());
          },
        ),
      ),
    );
  }
}

class Draw extends CustomPainter {
  final Color color;

  const Draw(this.color, {required this.lines});

  final List<List<Offset>> lines;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = color;
    paint.strokeWidth = 5.0;

    for (final line in lines) {
      for (int i = 0; i < line.length - 1; i++) {
        canvas.drawLine(line[i], line[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(Draw oldDelegate) => true;
}
