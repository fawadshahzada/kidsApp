import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidsapp/screen/alphabets_screen.dart';
import 'package:kidsapp/screen/count_game_screen.dart';
import 'package:kidsapp/screen/main_menu_screen.dart';
import 'package:kidsapp/screen/numbers_screen.dart';
import 'package:kidsapp/screen/shapes_screen.dart';
import 'package:kidsapp/state_management/shapes_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ShapeProvider(),
        ),
        //ChangeNotifierProvider(create: (context) => Alphabets()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kids App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const MainMenuScreen(),
            '/numbersScreen': (context) => const NumbersScreen(),
            '/countGame': (context) => const CountGameScreen(),
            '/shapesScreen': (context) => const ShapesScreen(),
            '/alphabetsScreen': (context) => const AlphabetsScreen(),
          },
        ),
      ),
    );
  }
}
