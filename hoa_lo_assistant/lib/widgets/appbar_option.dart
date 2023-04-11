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
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFFD5C5A9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // text
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.1),
            child: Text(
              'Hoa Lo Assistance',
              style: GoogleFonts.openSans(
                  color: Color(0xFF6B6B6D),
                  fontWeight: FontWeight.w600,
                  fontSize: 30),
            ),
          ),

          // next button
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.05),
            child: IconButton(
              icon: Image.asset('assets/button/nut_next.png'),
              iconSize: screenWidth * 0.1,
              onPressed: () {
                // handle back button pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}
