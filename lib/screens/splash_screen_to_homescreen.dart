import 'package:feeder/screens/homescreen.dart';
import 'package:flutter/material.dart';

class SplashToHomeScreen extends StatefulWidget {
  const SplashToHomeScreen({Key? key}) : super(key: key);

  @override
  State<SplashToHomeScreen> createState() => _SplashToHomeScreenState();
}

class _SplashToHomeScreenState extends State<SplashToHomeScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Splash.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Center(
            //   child: Text(
            //     'Feeder',
            //     style: TextStyle(
            //       fontSize: 85,
            //       color: Color(0xffFE724C),
            //       fontFamily:'Quicksand',
            //       fontWeight: FontWeight.bold
            //     ),
            //   ),
            // )
          ]
      ),
    );
  }
}
