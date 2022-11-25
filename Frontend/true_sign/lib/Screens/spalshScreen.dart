import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:true_sign/Screens/HomeScreen.dart';
import 'package:true_sign/Screens/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value){
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 230,
      nextScreen: const WelcomeScreen(),
      backgroundColor: Color(0xFF034582),
      splash: Column(
        children: [
            const SizedBox(
              height: 150,
              width: 150,
              child: Image(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),

          Text('True Sign',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white) ),
          ],
        ),
    );
  }
}
