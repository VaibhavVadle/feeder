import 'dart:io';
import 'dart:math';

import 'package:feeder/Widgets/submit_button.dart';
import 'package:feeder/Widgets/formfield_title_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:feeder/List/list_of_states.dart';
import 'package:feeder/List/Landmark.dart';
import 'package:feeder/Theme/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../List/Numbers.dart';
import '../../Widgets/textformfield_widget.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final db = FirebaseFirestore.instance;

  TextEditingController Date = TextEditingController();
  TextEditingController sTime = TextEditingController();
  TextEditingController eTime = TextEditingController();
  TextEditingController eventTitle = TextEditingController();
  TextEditingController detail = TextEditingController();
  TextEditingController numbers = TextEditingController();

  String stateValue = 'Gujarat';
  String landmarkValue = 'Taj Mahal';
  String dropdownValue = '1';
  String title = '';
  String description = '';
  late int price;
  String eventDate = '';
  String startTime = '';
  String endTime = '';

  DateTime? _selectedDate;
  DateTime? _startTime;
  DateTime? _endTime;

  final _myFormKey = GlobalKey<FormState>();
  final ImagePicker imgPicker = ImagePicker();
  List<XFile> imageFile = [];
  List<String> imageUrls = [];

  String? uid;

  @override
  void initState() {
    _fetchUserID();
    sTime.text = "";
    eTime.text = "";
    super.initState();
  }

  @override
  void dispose() {
    Date.dispose();
    sTime.dispose();
    eTime.dispose();
    detail.dispose();
    eventTitle.dispose();
    numbers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _myFormKey,
            child: Column(
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
                      'Create Event',
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'DMSerifDisplay',
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleText('Event Title'),
                      TextFormFieldWidget(
                        controller: eventTitle,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter title';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const TitleText('Description'),
                      TextFormFieldWidget(
                        controller: detail,
                        textInputType: TextInputType.multiline,
                        maxLines: null,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter description';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      const TitleText('Number of guests'),
                      DropdownButtonFormField(
                        icon: Icon(Icons.keyboard_arrow_down),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 12),
                          isDense: true,
                          prefixIcon: Icon(
                            Icons.people_alt,
                            size: 24,
                            color: Secondary,
                          ),
                        ),
                        value: dropdownValue,
                        items: number.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                      const SizedBox(height: 32),
                      const TitleText('Price per guests'),
                      TextFormFieldWidget(
                        controller: numbers,
                        prefixIcon: Icons.euro_symbol_sharp,
                      ),
                      const SizedBox(height: 32),
                      const TitleText('Add Event Photo'),
                      const SizedBox(height: 8),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              imageFile.length == 0
                                  ? Container()
                                  : Wrap(
                                      children: imageFile.map((imageOne) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            child: Container(
                                              height: 94,
                                              width: 103,
                                              color: Colors.grey[300],
                                              child: Image.file(
                                                File(imageOne.path),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                              InkWell(
                                onTap: () {
                                  openImages();
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(13),
                                  child: Container(
                                    height: 94,
                                    width: 103,
                                    color: Colors.grey[300],
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.cloud_upload,
                                            color: Secondary,
                                          ),
                                          SizedBox(
                                            height: 11,
                                          ),
                                          Text('Upload')
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(height: 32),
                      TitleText('Date'),
                      TextFormFieldWidget(
                        readOnly: true,
                        textInputType: TextInputType.datetime,
                        controller: Date,
                        prefixIcon: Icons.date_range,
                        suffixIcon: Icon(Icons.keyboard_arrow_down),
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter date';
                          }
                          return null;
                        },
                        onTap: selectDate,
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: TextFormFieldWidget(
                              readOnly: true,
                              controller: sTime,
                              onTap: selectStartTime,
                              labelText: 'Start Time',
                              suffixIcon: Icon(Icons.keyboard_arrow_down),
                            ),
                          ),
                          SizedBox(width: 32),
                          Flexible(
                            child: TextFormFieldWidget(
                                readOnly: true,
                                controller: eTime,
                                labelText: 'End Time',
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                onTap: selectEndTime),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Flexible(
                            child: DropdownButtonFormField(
                                isExpanded: true,
                                icon: Icon(Icons.keyboard_arrow_down),
                                decoration:
                                    InputDecoration(labelText: 'Landmark'),
                                value: landmarkValue,
                                items: Landmark.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    landmarkValue = newValue!;
                                  });
                                }),
                          ),
                          SizedBox(width: 16),
                          Flexible(
                            child: DropdownButtonFormField(
                                isExpanded: true,
                                icon: Icon(Icons.keyboard_arrow_down),
                                decoration: InputDecoration(labelText: 'State'),
                                value: stateValue,
                                items: states.map((String value) {
                                  return DropdownMenuItem<String>(
                                    // overflow: TextOverflow.ellipsis,
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    stateValue = newValue!;
                                  });
                                }),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                      Row(
                        children: [
                          Expanded(
                            child: SubmitButton(
                              text: 'Submit',
                              callBack: () {
                                if (_myFormKey.currentState!.validate()) {
                                  setState(() {
                                    startTime = sTime.text;
                                    endTime = eTime.text;
                                    title = eventTitle.text;
                                    price = int.parse(numbers.text);
                                    eventDate = Date.text;
                                    description = detail.text;
                                  });
                                  // for(var image in imageFile) {
                                  //   print('File = ${image}');
                                  //   final ref = FirebaseStorage.instance
                                  //       .ref()
                                  //       .child('eventImage')
                                  //       .child(
                                  //           DateTime.now().toString() + '.jpg');
                                  //    UploadTask upload = ref.putFile(File(image.path));
                                  //    upload.whenComplete(() {
                                  //      ref.getDownloadURL();
                                  //     //      .then((value) {
                                  //     //   FirebaseFirestore.instance.collection('Events').doc(uid!).update({
                                  //     //     'eventImage':[value.toString()]
                                  //     //   });
                                  //     // });
                                  //   });
                                  // }
                                  uploadFunction(imageFile);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 36)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void uploadFunction(List<XFile> _images) async {
    for (int i = 0; i < _images.length; i++) {
      var url = await uploadFile(_images[i]);
      imageUrls.add(url.toString());
    }
    FirebaseFirestore.instance
        .collection('Events')
        .doc()
        .set({
          'id': uid,
          'title': title,
          'eventDate': _selectedDate,
          'description': description,
          'price': price,
          'startTime': _startTime as DateTime,
          'endTime': _endTime as DateTime,
          'landmark': landmarkValue,
          'state': stateValue,
          'guestNum': int.parse(dropdownValue),
          'eventImage': imageUrls
        })
        .then((value) => Navigator.pop(context))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<String> uploadFile(XFile _file) async {
    Reference ref =
        FirebaseStorage.instance.ref().child('eventImage').child(_file.name);
    await ref.putFile(File(_file.path)).whenComplete(() {
      print(ref.getDownloadURL());
    });
    return await ref.getDownloadURL();
  }

  void selectStartTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    _endTime = DateTime(_selectedDate!.year, _selectedDate!.month,
        _selectedDate!.day, pickedTime!.hour, pickedTime.minute);

    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
          DateFormat.jm().parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
      String formattedTime = pickedTime.format(context);
      print(formattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.

      setState(() {
        sTime.text = formattedTime; //set the value of text field.
      });
    } else {
      print("Time is not selected");
    }
  }

  void selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2100));

    _selectedDate = pickedDate;

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('dd MMM, yyyy').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      setState(() {
        Date.text = formattedDate; //set output date to TextField value.
      });
    } else {}
  }

  void selectEndTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    _startTime = DateTime(_selectedDate!.year, _selectedDate!.month,
        _selectedDate!.day, pickedTime!.hour, pickedTime.minute);
    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
          DateFormat.jm().parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
      String formattedTime = pickedTime.format(context);
      print(formattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.

      setState(() {
        eTime.text = formattedTime; //set the value of text field.
      });
    } else {
      print("Time is not selected");
    }
  }

  void _fetchUserID() async {
    final prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('uid');
    setState(() {});
    print("UserID:${uid}");
  }

  openImages() async {
    try {
      final List<XFile>? img = await imgPicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (img != null) {
        imageFile.addAll(img);
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("print ${e.toString()}");
    }
  }
}
