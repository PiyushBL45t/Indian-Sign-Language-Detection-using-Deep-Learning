import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_sign/Screens/Camrea_screen.dart';
import 'package:true_sign/Screens/camreaScreen.dart';

class optionScreen extends StatefulWidget {
  const optionScreen({Key? key}) : super(key: key);

  @override
  State<optionScreen> createState() => _optionScreenState();
}

class _optionScreenState extends State<optionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CameraScreen()));
                },
                child: Container(
                  height: 115,
                  width: 260,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2.0,
                            blurRadius: 5.0,
                            offset: Offset(2.0,4.0)
                        )
                      ]
                  ),
                  child: Center(child: Text('Alphabets',style: GoogleFonts.poppins(fontSize: 18,color: const Color(0xFF034582)),))

                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const cameraScreen()));
                },
                child: Container(
                  height: 115,
                  width: 260,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2.0,
                            blurRadius: 5.0,
                            offset: Offset(2.0,4.0)
                        )
                      ]
                  ),
                  child: Center(child: Text('Words/Sentences',style: GoogleFonts.poppins(fontSize: 18,color: const Color(0xFF034582)),))

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
