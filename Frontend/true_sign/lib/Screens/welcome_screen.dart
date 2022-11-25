import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_sign/Screens/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF034582),
      body: Column(
        children: [
          Center(
            child: Container(
                margin: const EdgeInsets.only(top: 80),
                height: 350,
                width: 350,
                child: const Image(
                    image: AssetImage('assets/images/welcom.png')
                )
            ),
          ),
          Center(
            child: Text('TRUE SIGN', style: GoogleFonts.poppins(fontSize: 40,color: Colors.white)),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 25),
              height: 81,
              width: 300,
              child: Text(
                  'use sign language where people understand actions better than words.',textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 18,color: Colors.white)),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                // ignore: use_build_context_synchronously
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
              child: Container(
                margin: const EdgeInsets.only(top: 60),
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xFF5379F6),
                ),
                child: Center(
                  child: Text('Get Started',style: GoogleFonts.poppins(fontSize: 20,color: Colors.white),),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
