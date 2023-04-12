import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoa_lo_assistant/widgets/main_screen.dart';

class AppBarTop extends StatelessWidget implements PreferredSizeWidget {
  const AppBarTop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: Color(0xFFD5C5A9),
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.black),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // text
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.07),
            child: Text(
              'Hoa Lo Assistance',
              style: GoogleFonts.openSans(
                  color: Color(0xFF6B6B6D),
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.06),
            ),
          ),

          // next button
          Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.05, top: 10.0),
              child: Container(
                height: 80,
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //SizedBox(height: 10),
                      IconButton(
                        icon: Image.asset('assets/icon/nut_next.png'),
                        iconSize: 100 * 0.3,
                        onPressed: () {
                          // handle back button pressed
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()),
                          );
                        },
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 100 * 0.01),
                      //   child: Text(
                      //     'Hiển thị bản đồ',
                      //     style: GoogleFonts.openSans(
                      //         color: Color(0xFF6B6B6D),
                      //         fontWeight: FontWeight.w600,
                      //         fontSize: screenWidth * 0.03),
                      //   ),
                      // ),
                      Text(
                        'Hiển thị bản đồ',
                        style: GoogleFonts.openSans(
                            color: Color(0xFF6B6B6D),
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth * 0.03),
                      ),
                      SizedBox(height: 10),
                    ]),
              )),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}
