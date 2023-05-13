import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoa_lo_assistant/widgets/option_screen.dart';

import '../main.dart';

class ARScreen extends StatefulWidget {
  const ARScreen({super.key});

  @override
  State<ARScreen> createState() => _ARScreenState();
}

class _ARScreenState extends State<ARScreen> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  late UnityWidgetController _unityWidgetController;
  double _sliderValue = 0.0;
  late CameraController controller;
  late Future<void> _initializeControllerFuture;

  double? _screenWidth;
  double? _screenHeight;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.ultraHigh);
    controller.setFlashMode(FlashMode.auto);
    _initializeControllerFuture = controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

    final double screenAspectRatio = _screenWidth / _screenHeight;
    final cameraAspectRatio = 4 / 3;

    double cameraWidth, cameraHeight;
    if (screenAspectRatio > cameraAspectRatio) {
      cameraWidth = _screenWidth;
      cameraHeight = _screenWidth / cameraAspectRatio;
    } else {
      cameraHeight = _screenHeight;
      cameraWidth = _screenHeight * cameraAspectRatio;
    }
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: cameraWidth,
                  height: cameraHeight,
                  child: AspectRatio(
                    aspectRatio: screenAspectRatio,
                    child: CameraPreview(
                      controller,
                      child: UnityWidget(
                        onUnityCreated: onUnityCreated,
                        fullscreen: false,
                        onUnityMessage: onUnityMessage,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: _screenHeight * 7 / 9),
                  child: BottomRow(_screenWidth, _screenHeight),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: _screenHeight * 6.6 / 8,
                    //bottom: _screenHeight * 0.5 / 8
                  ),
                  child: Button(_screenWidth, _screenHeight),
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      // body: Card(
      //   margin: const EdgeInsets.all(8),
      //   clipBehavior: Clip.antiAlias,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(20.0),
      //   ),
      //   child: Stack(
      //     children: <Widget>[
      //       UnityWidget(
      //         onUnityCreated: onUnityCreated,
      //         fullscreen: false,
      //         onUnityMessage: onUnityMessage,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  void onUnityMessage(message) {
    print('Received message from unity: ${message.toString()}');
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    _unityWidgetController = controller;
  }

  Container Button(double screenWidth, double screenHeight) {
    return Container(
      height: screenHeight * 0.9 / 8,
      width: screenWidth * 3 / 4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/background/bg.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/image/May chem.png'),
          Text(
            'Máy chém',
            style: GoogleFonts.openSans(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
              //fontStyle: FontStyle.italic
            ),
          ),
        ],
      ),
    );
  }

  Row BottomRow(double screenWidth, double screenHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 80,
            width: 65,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.white.withOpacity(0.4),
                border:
                    Border.all(color: Colors.white.withOpacity(0.5), width: 2)),
            child: IconButton(
              padding: EdgeInsets.only(left: 20, right: 10),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white.withOpacity(0.5),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OptionScreen(),
                  ),
                );
              },
            )),
        SizedBox(width: screenWidth * 2.5 / 5),
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.4),
              border:
                  Border.all(color: Colors.white.withOpacity(0.5), width: 2)),
        ),
      ],
    );
  }
}
