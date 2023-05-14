import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import 'main_screen.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTop2(title: 'Tư liệu lịch sử'),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final maxHeight = constraints.maxHeight;
          final titleHeight = maxHeight * 0.1; // 10% of total height
          final videoHeight = maxHeight * 0.4; // 40% of total height
          final textContainerHeight = maxHeight * 0.4; // 50% of total height

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
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                  child: Container(
                    height: titleHeight,
                    alignment: Alignment.center, // Change this to center the text
                    child: Text(
                      'Tiêu đề video', // Change this to the actual text
                      style: GoogleFonts.openSans(fontSize: 17, color: Colors.black),
                      textAlign: TextAlign.center, // Change this to center the text
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.11),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity, // This will make the container span the entire width
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                  child: Container(
                    height: videoHeight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: VideoPlayerWidget(videoPath: 'assets/videos/rickroll.mp4'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0),
                  child: Container(
                    height: textContainerHeight,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.11),
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20), top: Radius.circular(20)),
                    ),
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: RichText(
                        text: TextSpan(
                          text: 'Nội dung video', // Change this to the actual text
                          style: GoogleFonts.openSans(fontSize: 15, color: Colors.black),
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
    );
  }
}

class AppBarTop2 extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarTop2({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
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
class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidget({Key? key, required this.videoPath}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoPath);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      looping: false,
      showControlsOnInitialize: false,
      allowMuting: false,
      autoInitialize: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}