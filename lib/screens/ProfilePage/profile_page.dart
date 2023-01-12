
import 'package:feeder/Widgets/welcome_container_widget.dart';
import 'package:feeder/screens/ProfilePage/aboutus_screen.dart';
import 'package:feeder/screens/ProfilePage/feedback_screen.dart';
import 'package:feeder/screens/ProfilePage/mycarddetails_screen.dart';
import 'package:feeder/screens/ProfilePage/myearnings_screen.dart';
import 'package:feeder/screens/ProfilePage/payout_screen.dart';
import 'package:feeder/screens/ProfilePage/personaldetails_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Theme/app_colors.dart';
import '../Login/login_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(
          children: [
            WelcomeContainer(
                description: 'We hope you are in good mood for \ncooking',
              image: AssetImage('images/homepage.png'),

            ),
            Column(
             children: [
               SizedBox(
                 height: MediaQuery.of(context).size.height * 0.324,
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 18.0),
                 child: Container(
                     child: Column(
                       children: [
                         InkWell(
                           onTap: (){
                             Navigator.push(context,
                             MaterialPageRoute(builder: (context) => PersonalDetails()));
                           },
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Row(
                                 children: [
                                   CircleAvatar(
                                     backgroundColor: Colors.white,
                                     child: Icon(Icons.person,color: Color(0xffFE724C),),
                                   ),
                                   SizedBox(width: 12,),
                                   Text('Personal Details',
                                     style: TextStyle(
                                       fontSize: 16,
                                       fontWeight: FontWeight.w500,
                                     ),)
                                 ],
                               ),
                               Icon(Icons.arrow_forward_ios,size: 13,)
                             ],
                           ),
                         ),
                         Divider(
                           color: GreyLight,
                           height: 24,
                         ),
                         InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => MyCardDetails()));
                           },
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Row(
                                 children: [
                                   CircleAvatar(
                                     backgroundColor: Colors.white,
                                     child: Icon(Icons.credit_card,color: Color(0xffFE724C)),
                                   ),
                                   SizedBox(width: 12,),
                                   Text('My Card Details',
                                     style: TextStyle(
                                       fontSize: 16,
                                       fontWeight: FontWeight.w500,
                                     ),)
                                 ],
                               ),
                               Icon(Icons.arrow_forward_ios,size: 13,)
                             ],
                           ),
                         ),
                         Divider(
                           color: GreyLight,
                           height: 24,
                         ),
                         InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => feedback()));
                           },
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Row(
                                 children: [
                                   CircleAvatar(
                                     backgroundColor: Colors.white,
                                     child: Icon(Icons.question_answer,color: Color(0xffFE724C)),
                                   ),
                                   SizedBox(width: 12,),
                                   Text('Reviews & Feedback',
                                     style: TextStyle(
                                       fontSize: 16,
                                       fontWeight: FontWeight.w500,
                                     ),)
                                 ],
                               ),
                               Icon(Icons.arrow_forward_ios,size: 13,)
                             ],
                           ),
                         ),
                         Divider(
                           color: GreyLight,
                           height: 24,
                         ),
                         InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => myEarnings()));
                           },
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Row(
                                 children: [
                                   CircleAvatar(
                                     backgroundColor: Colors.white,
                                     child: Icon(Icons.euro,color: Color(0xffFE724C)),
                                   ),
                                   SizedBox(width: 12,),
                                   Text('My Earnings',
                                     style: TextStyle(
                                       fontSize: 16,
                                       fontWeight: FontWeight.w500,
                                     ),)
                                 ],
                               ),
                               Icon(Icons.arrow_forward_ios,size: 13,)
                             ],
                           ),
                         ),
                         Divider(
                           color: GreyLight,
                           height: 24,
                         ),
                         InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => payout()));
                           },
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Row(
                                 children: [
                                   CircleAvatar(
                                     backgroundColor: Colors.white,
                                     child: Icon(Icons.security,color: Color(0xffFE724C)),
                                   ),
                                   SizedBox(width: 12,),
                                   Text('Payout',
                                     style: TextStyle(
                                       fontSize: 16,
                                       fontWeight: FontWeight.w500,
                                     ),)
                                 ],
                               ),
                               Icon(Icons.arrow_forward_ios,size: 13,)
                             ],
                           ),
                         ),
                         Divider(
                           color: GreyLight,
                           height: 24,
                         ),
                         InkWell(
                           onTap: () async{
                             await FirebaseAuth.instance.signOut();
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> Login()));
                           },
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Row(
                                 children: [
                                   CircleAvatar(
                                     backgroundColor: Colors.white,
                                     child: Icon(Icons.logout,color: Color(0xffFE724C)),
                                   ),
                                   SizedBox(width: 12,),
                                   Text('Logout',
                                     style: TextStyle(
                                       fontSize: 16,
                                       fontWeight: FontWeight.w500,
                                     ),)
                                 ],
                               ),
                               Icon(Icons.arrow_forward_ios,size: 13,)
                             ],
                           ),
                         ),
                         Divider(
                           color: GreyLight,
                           height: 24,
                         ),

                         InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => aboutUs()));
                           },
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Row(
                                 children: [
                                   CircleAvatar(
                                     backgroundColor: Colors.white,
                                     child: Icon(Icons.info,color: Color(0xffFE724C)),
                                   ),
                                   SizedBox(width: 12,),
                                   Text('About us',
                                     style: TextStyle(
                                       fontSize: 16,
                                       fontWeight: FontWeight.w500,
                                     ),)
                                 ],
                               ),
                               Icon(Icons.arrow_forward_ios,size: 13,)
                             ],
                           ),
                         ),
                         SizedBox(height: MediaQuery.of(context).size.height * 0.145,)
                       ],
                     )
                 ),
               )
             ],
              )
          ],
        ),
    );
  }
}
