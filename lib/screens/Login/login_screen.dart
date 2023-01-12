import 'package:email_validator/email_validator.dart';
import 'package:feeder/Widgets/submit_button.dart';
import 'package:feeder/Widgets/formfield_title_widget.dart';
import 'package:feeder/Widgets/textformfield_widget.dart';
import 'package:feeder/screens/homescreen.dart';
import 'package:feeder/screens/Registration/registration_screen.dart';
import 'package:feeder/screens/Login/reset_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:feeder/Theme/app_colors.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _myFormKey = GlobalKey<FormState>();
  var email = "";
  var password = "";
  final emailController = new TextEditingController();
  final _password = new TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'images/Login_image.png',
                scale: 1.0,
              ),
            ),
            Text(
              'Welcome to Feeder',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, left: 16, bottom: 24, right: 16),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Form(
                  key: _myFormKey,
                  child: Column(
                    children: [
                      TitleText('Email Id'),
                      TextFormFieldWidget(
                        prefixIcon: Icons.mail,
                        controller: emailController,
                        textInputType: TextInputType.emailAddress,
                        validate: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid email address'
                                : null,
                      ),
                      SizedBox(height: 32),
                      TitleText('Password'),
                      TextFormFieldWidget(
                        controller: _password,
                        prefixIcon: Icons.lock,
                        suffixIcon: Icon(Icons.visibility_off),
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        obscureInput: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResetPassword()));
                              },
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(color: Color(0xffFE724C)),
                              ))
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: SubmitButton(
                                text: 'Log in',
                                callBack: () {
                                  if (_myFormKey.currentState!.validate()) {
                                    setState(() {
                                      email = emailController.text;
                                      password = _password.text;
                                      userLogin();
                                    });
                                  }
                                }),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text('Or',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Primary)),
                      SizedBox(height: 15),
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
                          SizedBox(width: 16),
                          InkWell(
                            onTap: signInWithGoogle,
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage('images/google_logo.jpg'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don’t have an account?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Registration()));
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(color: Color(0xffFE724C)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  userLogin() async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      final User? user = FirebaseAuth.instance.currentUser;
      final _uid = user!.uid;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('uid',_uid);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No User Found for that Email");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Primary,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        print("Wrong Password Provided by User");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Primary,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        );
      }
    }
  }

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await FirebaseAuth.instance.signInWithCredential(credential);
      }
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    } on FirebaseAuthException catch (e) {
      print('Error ${e.message}');
    }
  }
}
