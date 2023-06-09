import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hoa_lo_assistant/ar_screen/ar_screen.dart';
import 'package:hoa_lo_assistant/widgets/main_screen.dart';
import 'package:hoa_lo_assistant/widgets/option_screen.dart';
import 'package:get/get.dart';
import 'package:hoa_lo_assistant/global.dart' as global;

import 'localestring.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  // try {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   cameras = await availableCameras();
  // } on CameraException catch (e) {
  //   print('Error in fetching the cameras: $e');
  // }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: LocalString(),
      locale: updateLanguage(),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }

  Locale updateLanguage() {
    if (global.language == "Vietnamese") {
      return const Locale('vi', 'vi');
    } else
      return Locale('vi', 'en');
  }
}
