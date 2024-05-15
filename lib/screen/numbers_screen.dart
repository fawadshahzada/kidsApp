import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidsapp/class/numbers_class.dart';

import '../widgets/number_widget.dart';

class NumbersScreen extends StatefulWidget {
  const NumbersScreen({super.key});

  @override
  State<NumbersScreen> createState() => _NumbersScreenState();
}

class _NumbersScreenState extends State<NumbersScreen> {
  Numbers selectedNumber = Numbers.getNumbers()[0];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfffbf5f2),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  // back button
                  Container(
                    padding: EdgeInsets.all(10.r),
                    child: Row(
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
                      ],
                    ),
                  ),
                  // title Numbers
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(left: 40),
                      child: Text(
                        'Numbers',
                        style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // some text
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.only(left: 0),
                      child: const Text(
                        '(0 1 2 3 4 5 6 7 8 9)',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  //large number
                  NumberWidget(selectedNumber: selectedNumber)
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //1 - 4 digits
                        numbersRow(Numbers.getNumbers()[0], () {
                          setState(() {
                            selectedNumber = Numbers.getNumbers()[0];
                          });
                        }),
                        numbersRow(Numbers.getNumbers()[1], () {
                          setState(() {
                            selectedNumber = Numbers.getNumbers()[1];
                          });
                        }),
                        numbersRow(Numbers.getNumbers()[2], () {
                          setState(() {
                            selectedNumber = Numbers.getNumbers()[2];
                          });
                        }),
                        numbersRow(Numbers.getNumbers()[3], () {
                          setState(() {
                            selectedNumber = Numbers.getNumbers()[3];
                          });
                        }),
                        numbersRow(Numbers.getNumbers()[4], () {
                          setState(() {
                            selectedNumber = Numbers.getNumbers()[4];
                          });
                        }),
                      ],
                    ),
                    // another row of 5-9 numbers
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //5 - 9 digits
                        numbersRow(Numbers.getNumbers()[5], () {
                          setState(() {
                            selectedNumber = Numbers.getNumbers()[5];
                          });
                        }),
                        numbersRow(Numbers.getNumbers()[6], () {
                          setState(() {
                            selectedNumber = Numbers.getNumbers()[6];
                          });
                        }),
                        numbersRow(Numbers.getNumbers()[7], () {
                          setState(() {
                            selectedNumber = Numbers.getNumbers()[7];
                          });
                        }),
                        numbersRow(Numbers.getNumbers()[8], () {
                          setState(() {
                            selectedNumber = Numbers.getNumbers()[8];
                          });
                        }),
                        numbersRow(Numbers.getNumbers()[9], () {
                          setState(() {
                            selectedNumber = Numbers.getNumbers()[9];
                          });
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget numbersRow(Numbers number, onPressed) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        child: Text(
          number.number,
          style: TextStyle(
            fontSize: 40.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
