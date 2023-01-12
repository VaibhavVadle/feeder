import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:feeder/screens/Login/login_screen.dart';
import 'package:feeder/screens/Registration/otp_verification_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Theme/app_colors.dart';
import '../../Widgets/submit_button.dart';
import '../../Widgets/textformfield_widget.dart';
import '../../Widgets/formfield_title_widget.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends  State<Registration> {
  String email = "";
  String password = "";
  String phone = "";

  final _myFormKey = GlobalKey<FormState>();
  final fName = TextEditingController();
  final lName = TextEditingController();
  final Mno = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: _myFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // SizedBox(width: 3,),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_outlined))
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1),
                  ),
                  SizedBox(height: 14),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [TitleText('First name')],
                        ),
                        TextFormFieldWidget(
                          controller: fName,
                          prefixIcon: Icons.person,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter first name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 32),
                        TitleText('Last Name'),
                        TextFormFieldWidget(
                          controller: lName,
                          prefixIcon: Icons.person,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter last name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 32),
                        TitleText('Email Id'),
                        TextFormFieldWidget(
                          controller: emailController,
                          prefixIcon: Icons.mail,
                          validate: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Enter a valid email address'
                              : null,
                        ),
                        SizedBox(height: 32),
                        TitleText('Phone number'),
                        TextFormFieldWidget(
                          textInputType: TextInputType.number,
                          controller: Mno,
                          prefixIcon: Icons.phone,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Mobile number';
                            }
                            if (value.length != 10) {
                              return 'Mobile number should be of 10 digits';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 32),
                        TitleText('Password'),
                        TextFormFieldWidget(
                          controller: _password,
                          prefixIcon: Icons.lock,
                          suffixIcon: Icon(Icons.visibility_off),
                          obscureInput: true,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            if (value.length < 6) {
                              return 'Password should be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 32),
                        TitleText('Confirm Password'),
                        TextFormFieldWidget(
                          controller: _confirmPassword,
                          obscureInput: true,
                          prefixIcon: Icons.lock,
                          suffixIcon: Icon(Icons.visibility_off),
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Confirm Password';
                            }
                            if (value != _password.text) {
                              return 'Please enter same Password';
                            }
                            if (value.length < 6) {
                              return 'Password should be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 32),
                        Row(
                          children: [
                            Expanded(
                                child: SubmitButton(
                                  text: 'Register',
                                  callBack: () async {
                                    try {
                                      if (_myFormKey.currentState!.validate()) {
                                        setState(() {
                                          email = emailController.text;
                                          password = _password.text;
                                          phone = Mno.text;
                                        });
                                        // Create Email and Pass
                                        final credential = await FirebaseAuth
                                            .instance
                                            .createUserWithEmailAndPassword(
                                            email: email, password: password);
                                        final User? user = FirebaseAuth.instance
                                            .currentUser;
                                        final _uid = user!.uid;
                                        // Send OTP
                                        await FirebaseAuth.instance
                                            .verifyPhoneNumber(
                                            phoneNumber: "+91" + Mno.text,
                                            verificationCompleted: (_) {},
                                            verificationFailed: (e) {
                                              print("Error:${e.toString()}");
                                            },
                                            codeSent: (String verificationID,
                                                int? token) {
                                              Navigator.push(
                                                  context, MaterialPageRoute(
                                                builder: (context) {
                                                  return OtpVerification(
                                                    phone: phone,
                                                    verificationID: verificationID,
                                                  );
                                                },
                                              ));
                                            },
                                            codeAutoRetrievalTimeout: (e) {
                                              print("Error:${e.toString()}");
                                            });
                                        final prefs = await SharedPreferences.getInstance();
                                        await prefs.setString('uid', _uid);
                                        // Add user Data to Database.
                                        FirebaseFirestore.instance.collection(
                                            'Users').doc(_uid).set({
                                          'id': _uid,
                                          'FirstName': fName.text,
                                          'LastName': lName.text,
                                          'EmailId': email,
                                          'Phone': phone,
                                          'Password': password,
                                          'creatTime': Timestamp.now()
                                        });
                                      }
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'weak-password') {
                                        print(
                                            'The password provided is too weak.');
                                      } else
                                      if (e.code == 'email-already-in-use') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            backgroundColor: Primary,
                                            content: Text(
                                              'The account already exists for that email.',
                                              style: TextStyle(fontSize: 18.0,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        );
                                      }
                                    }
                                    catch (error) {
                                      print(error.toString());
                                    }
                                  },
                                )),
                          ],
                        ),
                        SizedBox(
                            height: 20
                        ),
                        Text('Or',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffFE724C))),
                        SizedBox(
                            height: 15
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                AssetImage('images/apple_logo.png'),
                              ),
                            ),
                            SizedBox(
                                width: 16
                            ),
                            InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                AssetImage('images/google_logo.jpg'),
                              ),
                            ),
                            SizedBox(width: 16),
                          ],
                        ),
                        SizedBox(
                            height: 15
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(wordSpacing: 1),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: Text(
                                'Log in',
                                style: TextStyle(color: Color(0xffFE724C)),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}