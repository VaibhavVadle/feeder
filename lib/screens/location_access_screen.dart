import 'dart:ui';
import 'package:feeder/screens/Login/login_screen.dart';
import 'package:flutter/material.dart';

class LocationAccessScreen extends StatefulWidget {
  const LocationAccessScreen({Key? key}) : super(key: key);

  @override
  State<LocationAccessScreen> createState() => _LocationAccessScreenState();
}

class _LocationAccessScreenState extends State<LocationAccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // child: Image.network(
            //   'https://images.pexels.com/photos/1109197/pexels-photo-1109197.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            //   fit: BoxFit.cover,
            // ),
            decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage('images/SplashBlur.png'),
              fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect( // make sure we apply clip it properly
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: new Container(
                  decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
        ),
      ),

          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
              ),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 24,bottom: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.location_on,color: Color(0xffFE724C),size: 29,),
                        SizedBox(height: 16.36,),
                        Text(
                            'Allow Feeder to access \n device’s Location?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 1,
                            fontWeight: FontWeight.w700,
                            fontSize: 20
                          ),
                        ),
                      ],
                    ),

                    InkWell(
                        onTap: (){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login()));
                        },
                        child: Text(
                          'Allow only while using the app',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xffFE724C),
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login()));
                      },
                      child: Text(
                        'Deny',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xffFE724C),
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
