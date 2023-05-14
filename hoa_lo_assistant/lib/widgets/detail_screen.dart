import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoa_lo_assistant/global.dart';

class DetailScreen extends StatefulWidget {
  final String title;

  const DetailScreen({Key? key, required this.title}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List images = [];
  List videos = [];
  String image_text = '';

  Future<void> readJson() async {
    final String respone =
        await rootBundle.loadString(is_choosen, cache: false);
    final data = jsonDecode(respone);
    // ignore: duplicate_ignore
    setState(() {
      images = data['images']['image'] as List;
      image_text = data['images']['text'] as String;
    });
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    return Scaffold(
      appBar: AppBarTop2(title: widget.title),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final maxHeight = constraints.maxHeight;
          final imageHeight = maxHeight * 0.5; // 60% of total height
          final textContainerHeight = maxHeight * 0.5; // 40% of total height
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/background/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: imageHeight,
                  child: PageView(
                    children: [
                      // Image.asset('assets/image/trainu1.png',
                      //     fit: BoxFit.cover),
                      // Image.asset('assets/image/trainu2.png',
                      //     fit: BoxFit.cover),
                      // Image.asset('assets/image/example3.png', fit: BoxFit.cover),
                      for (var i = 0; i < images.length; i++)
                        Image.asset(images.elementAt(i), fit: BoxFit.cover)
                    ],
                  ),
                ),
                Container(
                  height: textContainerHeight,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.11),
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20), top: Radius.circular(20)),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      image_text,
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
                width: 30,
                height: 30,
                child: Icon(Icons.info_outline, color: Colors.black)),
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
        selectedLabelStyle: TextStyle(
            fontSize: 14), // Set the desired font size for the selected label
        unselectedLabelStyle: TextStyle(
            fontSize: 14), // Set the desired font size for the unselected label
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
