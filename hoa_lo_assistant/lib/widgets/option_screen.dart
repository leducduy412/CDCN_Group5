import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoa_lo_assistant/widgets/appbar_option.dart';
import 'package:hoa_lo_assistant/widgets/detail_screen.dart';
import 'package:hoa_lo_assistant/global.dart' as global;

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
        body: SizedBox.expand(
          child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image/background/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(children: [
                Padding(
                  padding: EdgeInsets.only(
                      //left: screenWidth * 0.1,
                      //right: screenWidth * 0.1,
                      top: screenWidth * 0.1),
                  child: getListAreas(context, screenWidth),
                ),
                buttonChangeLanguage(),
              ])),
        ));
  }

  Widget buttonChangeLanguage() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
        padding:
            EdgeInsets.only(left: screenWidth * 0.7, top: screenHeight * 0.73),
        child: Container(
          height: 80,
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //SizedBox(height: 10),
                IconButton(
                  icon: Image.asset('assets/icon/language.png'),
                  iconSize: 100 * 0.3,
                  onPressed: () {
                    // handle back button pressed
                    buildDialog(context);
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
                  'Thay đổi ngôn ngữ'.tr,
                  style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.03),
                ),
                SizedBox(height: 10),
              ]),
        ));
  }

  Locale updateLanguage() {
    if (global.language == "Vietnamese") {
      return const Locale('vi', 'vi');
    } else
      return Locale('vi', 'en');
  }

  buildDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text('Chọn một ngôn ngữ'.tr),
          content: SizedBox(
            width: double.maxFinite,
            child: DropdownButton<String>(
              value: global.language,
              items: <String>['English', 'Vietnamese'].map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (text) {
                setState(() {
                  global.language = text!;
                  Get.updateLocale(updateLanguage());
                });
              },
            ),
          ),
        );
      },
    );
  }

  Widget getListAreas(BuildContext context, double screenWidth) {
    return Container(
      color: Colors.transparent,
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          for (var i = 0; i < global.list_area.length; i++)
            TextButton(
              onPressed: () async {
                String name = await getName(i);
                final String link = global.list_area.elementAt(i).toString();
                global.is_choosen = 'assets/database/$link';
                global.is_choosen_onlyname = link;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(title: name)));
              },
              child: Column(
                children: [
                  FutureBuilder(
                    future: getImage(i),
                    builder: (context, snapshot) {
                      return Image.asset('${snapshot.data}', fit: BoxFit.cover);
                    },
                  ),
                  FutureBuilder(
                      future: getName(i),
                      builder: (context, snapshot) {
                        return Text(
                          '${snapshot.data}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        );
                      }),
                ],
              ),
            )
        ],
      ),
    );
  }

  Future<String> getImage(int i) async {
    String link = global.list_area.elementAt(i).toString();
    link = 'assets/database/$link';
    final String respone = await rootBundle.loadString(link);
    final data = await json.decode(respone);
    // ignore: avoid_dynamic_calls
    final String image = data["icon"].toString();
    return image;
  }

  Future<String> getName(int i) async {
    String link = global.list_area.elementAt(i).toString();
    link = 'assets/database/$link';
    final String respone = await rootBundle.loadString(link);
    final data = await json.decode(respone);
    // ignore: avoid_dynamic_calls
    final String name;
    if (global.language == "Vietnamese")
      name = data["name"].toString();
    else
      name = data["name_eng"].toString();
    return name;
  }
}
