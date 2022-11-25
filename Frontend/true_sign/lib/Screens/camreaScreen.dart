
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
class cameraScreen extends StatefulWidget {
  const cameraScreen({Key? key}) : super(key: key);

  @override
  State<cameraScreen> createState() => _cameraScreenState();
}

class _cameraScreenState extends State<cameraScreen> {
  // // File? image;
  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      // final imageTemporary = File(image.path);
      setState(() {
        // this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('failed : $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Click To open Camera',style: GoogleFonts.poppins(fontSize: 19,color: Color(0xFF034582)),),),
          Center(child: IconButton(onPressed: (){
            getImage(ImageSource.camera);
          }, icon: Icon(Icons.camera_alt_outlined), iconSize: 80,color: Color(0xFF034582),))
        ],
      ),
    );
  }
}
