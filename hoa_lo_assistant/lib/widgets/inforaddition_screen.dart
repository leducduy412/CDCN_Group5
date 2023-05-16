import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoa_lo_assistant/widgets/video_screen.dart';

import 'main_screen.dart';

class InforAdditionScreen extends StatefulWidget {
  final String add_text;

  const InforAdditionScreen({Key? key, required this.add_text})
      : super(key: key);

  @override
  _InforAdditionScreenState createState() => _InforAdditionScreenState();
}

class _InforAdditionScreenState extends State<InforAdditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTop2(title: 'Thông tin bổ sung'),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/background/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final maxHeight = constraints.maxHeight;
            final contentHeight = maxHeight - 48; // Subtract padding

            return Center(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.11),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                height: contentHeight,
                child: SingleChildScrollView(
                  child: Text(
                    widget.add_text,
                    style:
                        GoogleFonts.openSans(fontSize: 15, color: Colors.black),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
