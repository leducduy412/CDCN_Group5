import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoa_lo_assistant/widgets/option_screen.dart';

class DetailScreen extends StatefulWidget {
  final String title;

  const DetailScreen({Key? key, required this.title}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTop2(title: widget.title),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/background/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 30,
              height: 30,
              child: Icon(Icons.info_outline, color: Colors.black)
            ),
            label: 'Thông tin bổ sung',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 30,
              height: 30,
              child: Icon(Icons.play_circle_fill, color: Colors.black),
            ),
            label: 'Tư liệu lịch sử',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset('assets/icon/icon_ar.png'),
            ), // Set the desired width and height
            label: 'AR',
          ),
        ],
        unselectedItemColor: Color(0xFF6B6B6D),
        selectedItemColor: Color(0xFF6B6B6D),
        showUnselectedLabels: true,
        backgroundColor: Color(0xFFD5C5A9),
        selectedLabelStyle: TextStyle(fontSize: 14), // Set the desired font size for the selected label
        unselectedLabelStyle: TextStyle(fontSize: 14), // Set the desired font size for the unselected label
      ),
    );
  }
}

class AppBarTop2 extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarTop2({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: Color(0xFFD5C5A9),
      title: Text(
        title,
        style: GoogleFonts.openSans(
          color: Color(0xFF6B6B6D),
          fontWeight: FontWeight.w600,
          fontSize: screenWidth * 0.06,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Image.asset('assets/icon/icon_back.png', width: 30, height: 30),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
