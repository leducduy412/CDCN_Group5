import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoa_lo_assistant/ar_screen/ar_screen.dart';
import 'package:hoa_lo_assistant/global.dart';
import 'package:hoa_lo_assistant/widgets/video_screen.dart';

import 'inforaddition_screen.dart';

class DetailScreen extends StatefulWidget {
  final String title;

  const DetailScreen({Key? key, required this.title}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List images = [];
  List videos = [];
  String add_text = "";
  String image_text = '';
  late VideoPlayerWidget video;
  String video_text = "";
  String title = "";

  Future<void> readJson() async {
    final String respone =
        await rootBundle.loadString(is_choosen, cache: false);
    final data = jsonDecode(respone);
    // ignore: duplicate_ignore
    setState(() {
      images = data['images']['image'] as List;
      if (language == "Vietnamese")
        image_text = data['images']['text'] as String;
      else
        image_text = data['images']['text_eng'] as String;
      if (language == "Vietnamese")
        add_text = data['addition_text'] as String;
      else
        add_text = data['addition_text_eng'] as String;
      if (language == "Vietnamese")
        video_text = data['videos']['text'] as String;
      else
        video_text = data['videos']['text_eng'] as String;
      String s = data['videos']['video'] as String;
      if (language == "Vietnamese")
        title = data['videos']['title'] as String;
      else
        title = data['videos']['title_eng'] as String;
      video = VideoPlayerWidget(videoPath: s);
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
          final imageHeight = maxHeight * 0.4; // 50% of total height
          final textContainerHeight = maxHeight * 0.5; // 50% of total height
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/background/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: imageHeight,
                    child: PageView(
                      children: [
                        for (var i = 0; i < images.length; i++)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(images.elementAt(i),
                                fit: BoxFit.cover),
                          )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                  child: Container(
                    height: textContainerHeight,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.11),
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20),
                          top: Radius.circular(20)),
                    ),
                    child: SingleChildScrollView(
                      child: RichText(
                        text: TextSpan(
                          text: image_text,
                          style: GoogleFonts.openSans(
                              fontSize: 15, color: Colors.black),
                        ),
                        textAlign: TextAlign.justify,
                      ),
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
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => Inforaddition()),
                  MaterialPageRoute(
                      builder: (context) =>
                          InforAdditionScreen(add_text: add_text)),
                );
              },
              child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Icon(Icons.info_outline, color: Colors.black)),
            ),
            label: 'Thông tin bổ sung'.tr,
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VideoScreen(
                          title: title, video: video, video_text: video_text)),
                  //MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
              child: SizedBox(
                width: 30,
                height: 30,
                child: Icon(Icons.play_circle_fill, color: Colors.black),
              ),
            ),
            label: 'Tư liệu lịch sử'.tr,
          ),
          // BottomNavigationBarItem(
          //   icon: SizedBox(
          //     width: 30,
          //     height: 30,
          //     child: Image.asset('assets/icon/icon_ar.png'),
          //   ), // Set the desired width and height
          //   label: 'AR',
          // ),
          if (list_ar[list_area.indexOf(is_choosen_onlyname)] == true)
            BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ARScreen(title: widget.title, image: images[0])),
                      //MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset('assets/icon/icon_ar.png'),
                  )),
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
