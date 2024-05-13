import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String greeting = '';
    var hour = DateTime.now().hour;
    if (hour < 12) {
      greeting = 'Good Morning';
    } else if (hour < 17) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening';
    }
    return SafeArea(
      child: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // placeholder circular image at the center
          Center(
            child: Container(
                width: 100.w,
                height: 100.h,
                padding: const EdgeInsets.all(17),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffffeaea),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/images/lion_face.png'),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          // good morning text
          Text(
            greeting,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          // text CAKKA
          Text(
            'CAKKA',
            style: TextStyle(
                fontFamily: 'Merchindise',
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
                color: const Color(0xffae3c39)),
          ),
          const SizedBox(
            height: 10,
          ),
          // grid item with 4 container widgets
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            // long Grid container
            padding: EdgeInsets.all(20.r),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.8,
            children: [
              menuContainer(
                const Color(0xffe7f4e8),
                'Numbers',
                Colors.green,
                'assets/images/numbers_icon.png',
                () {
                  Navigator.pushNamed(context, '/numbersScreen');
                },
              ),
              menuContainer(
                const Color(0xfffef9f3),
                'Alphabets',
                Colors.red,
                'assets/images/abc_icon.png',
                () {
                  Navigator.pushNamed(context, '/alphabetsScreen');
                },
              ),
              menuContainer(
                const Color(0xfffff9e3),
                'Shapes',
                Colors.yellow,
                'assets/images/shape.png',
                () {
                  Navigator.pushNamed(context, '/shapesScreen');
                },
              ),
              menuContainer(
                const Color(0xffebe7fc),
                'Count',
                Colors.blue,
                'assets/images/puzzle_image.png',
                () {
                  Navigator.pushNamed(context, '/countGame');
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget menuContainer(
    Color containerColor,
    String text,
    Color textColor,
    String imagePath,
    onPressed,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        color: containerColor,
        child: InkWell(
          onTap: onPressed,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          // splash effect on tap with radius 20
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Image.asset(
                imagePath,
                width: 90.w,
                height: 90.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'Merchindise',
                  color: textColor,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
