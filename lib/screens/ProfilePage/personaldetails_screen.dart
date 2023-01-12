import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feeder/Widgets/formfield_title_widget.dart';
import 'package:feeder/Widgets/submit_button.dart';
import 'package:feeder/Widgets/textformfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  String? uid;
  File? imageFile;
  String? imageUrl;
  String? profilePic;
  File? profileFile;

  @override
  void initState() {
    //getDataFromDatabase();
    _fetchUserID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: FirebaseFirestore.instance.collection('Users').doc(uid).get(),
          builder: (_, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return SizedBox();
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data!.data();
              // print(data);
              String fName = data['FirstName'];
              String lName = data['LastName'];
              String eId = data['EmailId'];
              String Mno = data['Phone'];
              String pass = data['Password'];
              String confirmPass = data['Password'];
              var pic = data['profileImage'];

              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SizedBox(width: 3,),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back_outlined)),
                          const SizedBox(width: 10),
                          const Text(
                            'Personal Details',
                            style: TextStyle(
                                fontSize: 26,
                                fontFamily: 'DMSerifDisplay',
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      SizedBox(height: 24),
                      Stack(
                        children: [
                          Container(
                            width: 100,
                            height: 114,
                          ),
                          InkWell(
                            onTap: () {
                              _showChoiceDialog(context);
                            },
                            child: CircleAvatar(
                                radius: 50,
                                backgroundImage: imageFile != null ? Image.file(imageFile!).image :
                                  pic != null ? NetworkImage(pic.toString())
                                      : NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9YhceWoUKbK2wMeimcB0NgVEqYlpd6ccl411nf7jlx4sV5e8y5b8CdsEjPFtmbHoKhb0&usqp=CAU')
                            ),
                          ),
                          Positioned(
                            right: 35,
                            bottom: 0,
                            child: ClipOval(
                                child: Container(
                                    height: 28,
                                    width: 28,
                                    color: Color(0xffFE724C),
                                    padding: EdgeInsets.all(8),
                                    child: Icon(
                                      Icons.edit,
                                      size: 14,
                                      color: Colors.white,
                                    ))),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        '${fName} ${lName}',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            TitleText('First Name'),
                            TextFormFieldWidget(
                              initialValue: fName,
                              onChanged: (value) => fName = value,
                              prefixIcon: Icons.person,
                            ),
                            SizedBox(height: 32),
                            TitleText('Last Name'),
                            TextFormFieldWidget(
                              initialValue: lName,
                              onChanged: (value) => lName = value,
                              prefixIcon: Icons.person,
                            ),
                            SizedBox(height: 32),
                            TitleText('Email Id'),
                            TextFormFieldWidget(
                              initialValue: eId,
                              onChanged: (value) => eId = value,
                              prefixIcon: Icons.mail,
                            ),
                            SizedBox(height: 32),
                            TitleText('Phone number'),
                            TextFormFieldWidget(
                              initialValue: Mno,
                              onChanged: (value) => Mno = value,
                              prefixIcon: Icons.phone,
                            ),
                            SizedBox(height: 32),
                            TitleText('Password'),
                            TextFormFieldWidget(
                              obscureInput: true,
                              initialValue: pass,
                              onChanged: (value) => pass = value,
                              prefixIcon: Icons.lock,
                              suffixIcon: Icon(Icons.visibility_off),
                            ),
                            SizedBox(height: 32),
                            TitleText('Confirm Password'),
                            TextFormFieldWidget(
                              obscureInput: true,
                              initialValue: confirmPass,
                              onChanged: (value) => confirmPass = value,
                              prefixIcon: Icons.lock,
                              suffixIcon: Icon(Icons.visibility_off),
                            ),
                            SizedBox(height: 32),
                            Row(
                              children: [
                                Expanded(
                                  child: SubmitButton(
                                    text: 'Submit',
                                    callBack: () async {
                                      try {
                                        //imageUrl = profilePic.toString();
                                        if (imageFile != null) {
                                          final ref = FirebaseStorage.instance
                                              .ref()
                                              .child('userImages')
                                              .child(DateTime.now().toString() +
                                                  '.jpg');
                                          await ref.putFile(imageFile!);
                                          imageUrl = await ref.getDownloadURL();
                                        }
                                        updateUser(fName, lName, eId, Mno, pass,
                                            imageUrl as dynamic);
                                        Navigator.pop(context);
                                      } catch (error) {
                                        Fluttertoast.showToast(
                                            msg: error.toString());
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    setState(() {
      if (image == null) {
        NetworkImage(
            'https://cdn4.iconfinder.com/data/icons/glyphs/24/icons_user2-256.png');
      } else {
        imageFile = File(image.path);
      }
      print(imageFile);
    });
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Please Select !'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('Gallery'),
                    onTap: () {
                      getImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text('Open Camera'),
                    onTap: () {
                      getImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  final CollectionReference user =
      FirebaseFirestore.instance.collection('Users');

  void _fetchUserID() async {
    final prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('uid');
    setState(() {});
    print("UserID:${uid}");
  }

  Future<void> updateUser(
      firstName, lastName, emailId, phoneNo, password, imageUrl) {
    return user
        .doc(uid)
        .update({
          'FirstName': firstName,
          'LastName': lastName,
          'EmailId': emailId,
          'Phone': phoneNo,
          'Password': password,
          'profileImage': imageUrl
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          profilePic = snapshot.data()!["profileImage"];
        });
      }
    });
  }
}
