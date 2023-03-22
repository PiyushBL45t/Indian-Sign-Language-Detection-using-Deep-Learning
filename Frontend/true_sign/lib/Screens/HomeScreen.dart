import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_sign/Screens/Camrea_screen.dart';
import 'package:true_sign/Screens/LearnScreen.dart';
import 'package:true_sign/Screens/camreaScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        title: Text('True Sign',style: GoogleFonts.poppins(color: const Color(0xFF034582),fontSize: 25),),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45.0,left: 19),
              child: Text('Hey There,',style: GoogleFonts.poppins(fontSize:30,color: const Color(0xFF034582) ),),
            ),
            const SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(left: 19.0),
              child: Text('Choose an option',style: GoogleFonts.poppins(fontSize: 20,color: const Color(0xFF034582)),),
            ),
            const SizedBox(
              height: 50,
            ),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(image:  AssetImage('assets/images/camera.png')),
                      const SizedBox(height: 5,),
                      Text('Record',style: GoogleFonts.poppins(fontSize: 18,color: const Color(0xFF034582)),)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LearnScreen()));
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(image:  AssetImage('assets/images/learn.png')),
                      const SizedBox(height: 5,),
                      Text('Learn',style: GoogleFonts.poppins(fontSize: 18,color: const Color(0xFF034582)),)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
