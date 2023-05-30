import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tflite/tflite.dart';
import 'package:true_sign/main.dart';

class cameraScreen extends StatefulWidget {
  const cameraScreen({Key? key}) : super(key: key);

  @override
  State<cameraScreen> createState() => _cameraScreenState();
}

class _cameraScreenState extends State<cameraScreen> {
  CameraController? cameraController;
  CameraImage? cameraImage;
  String output = "";
  initCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);

    cameraController!.initialize().then(
          (value) {
        if (!mounted) {
          return;
        } else {
          setState(
                () {
              cameraController!.startImageStream(
                    (image) => {
                  if (true) {cameraImage = image, runmodel()}
                },
              );
            },
          );
        }
      },
    );
  }

  runmodel() async {
    if (cameraImage != null) {
      var pred = await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 1,
          threshold: 0.4,
          asynch: true);
      pred!.forEach((element) {
        setState(() {
          output = element['label'];
        });
      });
    }
  }

  loadmodel() async {
    await Tflite.loadModel(model: 'assets/model/model2.tflite', labels: 'assets/model/labels2.txt');
  }

  @override
  void initState() {
    super.initState();
    initCamera();
    loadmodel();
  }

  @override
  void dispose() async {
    super.dispose();

    cameraController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(20),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width ,
                    child: !cameraController!.value.isInitialized
                        ? Container()
                        : AspectRatio(
                      aspectRatio: cameraController!.value.aspectRatio,
                      child: CameraPreview(cameraController!),
                    ),
                  ),
                ),
                Text(output,style: GoogleFonts.poppins(fontSize: 25,color: Colors.black),)
              ],
            ),
          )),
    );
  }
}
