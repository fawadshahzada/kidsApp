import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidsapp/class/alphabets_class.dart';
import 'package:kidsapp/screen/drawing_screen.dart';
import '../widgets/alphabet_widget.dart';

class AlphabetsScreen extends StatefulWidget {
  const AlphabetsScreen({super.key});

  @override
  State<AlphabetsScreen> createState() => _AlphabetsScreenState();
}

class _AlphabetsScreenState extends State<AlphabetsScreen> {
  Alphabets title = Alphabets.getAlphabets()[0];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                color: const Color(0xfff0e8e0),
                child: Column(
                  children: [
                    // back button long
                    Container(
                      padding: EdgeInsets.only(left: 10.w, top: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 45.sp,
                              color: randomColor(),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const DrawingCanvas();
                              }));
                            },
                            icon: Icon(
                              Icons.draw_outlined,
                              size: 45.sp,
                              color: randomColor(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // title Letters
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 30.w),
                        child: Text(
                          'Letters',
                          style: TextStyle(
                            fontSize: 40.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // some text
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 30.w),
                        child: const Text(
                          'A B C D E F G H I J K L M N O P Q R S T U V W X Y Z',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    // some animated large alphabet after user clicked
                    LettersWidget(
                      title: title,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
                color: const Color(0xffffffff),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    alphabetRow(Alphabets.getAlphabets()[0],
                        Alphabets.getAlphabets()[1], () {
                      setState(() {
                        title = Alphabets.getAlphabets()[0];
                      });
                    }, () {
                      setState(() {
                        title = Alphabets.getAlphabets()[1];
                      });
                    }),
                    alphabetRow(Alphabets.getAlphabets()[2],
                        Alphabets.getAlphabets()[3], () {
                      setState(() {
                        title = Alphabets.getAlphabets()[2];
                      });
                    }, () {
                      setState(() {
                        title = Alphabets.getAlphabets()[3];
                      });
                    }),
                    alphabetRow(Alphabets.getAlphabets()[4],
                        Alphabets.getAlphabets()[5], () {
                      setState(() {
                        title = Alphabets.getAlphabets()[4];
                      });
                    }, () {
                      setState(() {
                        title = Alphabets.getAlphabets()[5];
                      });
                    }),
                    alphabetRow(Alphabets.getAlphabets()[6],
                        Alphabets.getAlphabets()[7], () {
                      setState(() {
                        title = Alphabets.getAlphabets()[6];
                      });
                    }, () {
                      setState(() {
                        title = Alphabets.getAlphabets()[7];
                      });
                    }),
                    alphabetRow(Alphabets.getAlphabets()[8],
                        Alphabets.getAlphabets()[9], () {
                      setState(() {
                        title = Alphabets.getAlphabets()[8];
                      });
                    }, () {
                      setState(() {
                        title = Alphabets.getAlphabets()[9];
                      });
                    }),
                    alphabetRow(Alphabets.getAlphabets()[10],
                        Alphabets.getAlphabets()[11], () {
                      setState(() {
                        title = Alphabets.getAlphabets()[10];
                      });
                    }, () {
                      setState(() {
                        title = Alphabets.getAlphabets()[11];
                      });
                    }),
                    alphabetRow(Alphabets.getAlphabets()[12],
                        Alphabets.getAlphabets()[13], () {
                      setState(() {
                        title = Alphabets.getAlphabets()[12];
                      });
                    }, () {
                      setState(() {
                        title = Alphabets.getAlphabets()[13];
                      });
                    }),
                    alphabetRow(Alphabets.getAlphabets()[14],
                        Alphabets.getAlphabets()[15], () {
                      setState(() {
                        title = Alphabets.getAlphabets()[14];
                      });
                    }, () {
                      setState(() {
                        title = Alphabets.getAlphabets()[15];
                      });
                    }),
                    alphabetRow(Alphabets.getAlphabets()[16],
                        Alphabets.getAlphabets()[17], () {
                      setState(() {
                        title = Alphabets.getAlphabets()[16];
                      });
                    }, () {
                      setState(() {
                        title = Alphabets.getAlphabets()[17];
                      });
                    }),
                    alphabetRow(Alphabets.getAlphabets()[18],
                        Alphabets.getAlphabets()[19], () {
                      setState(() {
                        title = Alphabets.getAlphabets()[18];
                      });
                    }, () {
                      setState(() {
                        title = Alphabets.getAlphabets()[19];
                      });
                    }),
                    alphabetRow(Alphabets.getAlphabets()[20],
                        Alphabets.getAlphabets()[21], () {
                      setState(() {
                        title = Alphabets.getAlphabets()[20];
                      });
                    }, () {
                      setState(() {
                        title = Alphabets.getAlphabets()[21];
                      });
                    }),
                    alphabetRow(Alphabets.getAlphabets()[22],
                        Alphabets.getAlphabets()[23], () {
                      setState(() {
                        title = Alphabets.getAlphabets()[22];
                      });
                    }, () {
                      setState(() {
                        title = Alphabets.getAlphabets()[23];
                      });
                    }),
                    alphabetRow(Alphabets.getAlphabets()[24],
                        Alphabets.getAlphabets()[25], () {
                      setState(() {
                        title = Alphabets.getAlphabets()[24];
                      });
                    }, () {
                      setState(() {
                        title = Alphabets.getAlphabets()[25];
                      });
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget alphabetRow(
      Alphabets alphabet1, Alphabets alphabet2, onPressed1, onPressed2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: InkWell(
            onTap: onPressed1,
            child: AutoSizeText(
              alphabet1.alphabet,
              maxLines: 1,
              maxFontSize: 28,
              minFontSize: 20,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: onPressed2,
            child: AutoSizeText(
              alphabet2.alphabet,
              maxLines: 1,
              maxFontSize: 28,
              minFontSize: 20,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
