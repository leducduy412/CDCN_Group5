import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //height: double.infinity,
        //width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image/background/main_screen.png"),
          ),
        ),
        child: Center(
          child: TextButton(
            onPressed: () {},
            child: Container(
              width: 180,
              height: 70,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(249, 164, 9, 1),
                    Color.fromRGBO(242, 191, 32, 1),
                    Color.fromRGBO(255, 225, 102, 1),
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  'Bắt đầu',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.openSans(
                    textStyle:
                        const TextStyle(fontSize: 32, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
