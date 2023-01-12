import 'package:feeder/screens/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../Widgets/submit_button.dart';

class OtpVerification extends StatefulWidget {

  final String verificationID;
  final String phone;
  OtpVerification({Key? key,
    required this.phone,
    required this.verificationID}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {

  String code = "";
  OtpFieldController otpController = OtpFieldController();

  void verifyOtp() async{
    final credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationID,
        smsCode: code);

    try {
      await FirebaseAuth.instance
          .signInWithCredential(credential);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    } catch (e) {
      print('Error ${e.toString()}');
    }
  }

  void nextField({required String value, required FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      // SizedBox(width: 3,),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_outlined)),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'OTP Verification',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    'We have sent the code verification to \nyour phone number',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '+91 ${widget.phone}',
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.mode_edit_sharp,
                          size: 15,
                          color: Color(0xffFE724C),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: OTPTextField(
                          width: MediaQuery.of(context).size.width,
                           controller: otpController,
                          fieldWidth: 40,
                         // textFieldAlignment: MainAxisAlignment.spaceAround,
                         fieldStyle: FieldStyle.box,
                         length: 6,
                            onChanged: (pin) {
                              code = pin;
                            },
                            onCompleted: (pin) {
                              code = pin;
                            }
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30
                  ),
                  TweenAnimationBuilder(
                      tween: Tween(begin: 60.0, end: 0),
                      duration: Duration(seconds: 60),
                      builder: (context, value, child) => Text(
                            "(00:${value.toInt()})",
                            style: TextStyle(color: Color(0xffFE724C)),
                          )),
                  const SizedBox(
                    height: 32
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: SubmitButton(
                            text: 'Get OTP',
                            callBack: (){
                              verifyOtp();
                              print('Code:${code}');
                            },
                          )
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Didn’t receive the otp? '),
                      InkWell(
                          onTap: () {},
                          child: const Text(
                            'Resend OTP',
                            style: TextStyle(color: Color(0xffFE724C)),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
