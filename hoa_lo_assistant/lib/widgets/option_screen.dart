import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoa_lo_assistant/widgets/appbar_option.dart';
import 'package:hoa_lo_assistant/widgets/detail_screen.dart';
import 'package:hoa_lo_assistant/widgets/detail_screen.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({super.key});

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarTop(),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/background/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.1, right: screenWidth * 0.1),
                      child: firstRow(screenWidth),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.1, right: screenWidth * 0.1),
                      child: secondRow(screenWidth),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.1, right: screenWidth * 0.1),
                      child: thirdRow(screenWidth),
                    ),
                  ]),
            ),
            padding: EdgeInsets.symmetric(vertical: screenWidth * 0.1),
          ),
        ));
  }

  Row firstRow(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            child: Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(title: 'Trại nữ'),
                  ),
                );
              },
              icon: Image.asset('assets/image/trai_nu.png'),
              iconSize: screenWidth * 0.3,
            ),
            Text(
              'Trại nữ',
              style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
          ],
        )),
        Container(
          child: Column(children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(title: 'Máy chém'),
                  ),
                );
              },
              icon: Image.asset('assets/image/may_chem.png'),
              iconSize: screenWidth * 0.3,
            ),
            Text(
              'Máy chém',
              style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
          ]),
        )
      ],
    );
  }

  Row secondRow(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            child: Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(title: 'Trại nam'),
                  ),
                );
              },
              icon: Image.asset('assets/image/trai_nam.png'),
              iconSize: screenWidth * 0.3,
            ),
            Text(
              'Trại nam',
              style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
          ],
        )),
        Container(
          child: Column(children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(title: 'Tù chính trị'),
                  ),
                );
              },
              icon: Image.asset('assets/image/tu_chinh_tri.png'),
              iconSize: screenWidth * 0.3,
            ),
            Text(
              'Tù chính trị',
              style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
          ]),
        )
      ],
    );
  }

  Row thirdRow(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            child: Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(title: 'Phòng giam'),
                  ),
                );
              },
              icon: Image.asset('assets/image/phong_giam.png'),
              iconSize: screenWidth * 0.3,
            ),
            Text(
              'Phòng giam',
              style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
          ],
        )),
        Container(
          child: Column(children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(title: 'Cachot'),
                  ),
                );
              },
              icon: Image.asset('assets/image/ca_chot.png'),
              iconSize: screenWidth * 0.3,
            ),
            Text(
              'Cachot',
              style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
          ]),
        )
      ],
    );
  }
}
