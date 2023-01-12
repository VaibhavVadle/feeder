import 'dart:core';
import 'package:feeder/Widgets/formfield_title_widget.dart';
import 'package:feeder/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:feeder/List/list_of_states.dart';
import 'package:feeder/List/Landmark.dart';
import 'package:feeder/Theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../List/Numbers.dart';
import '../../Widgets/submit_button.dart';
import '../../Widgets/textformfield_widget.dart';
import '../../Widgets/upload_image_widget.dart';

class EditEvent extends StatefulWidget {

  EventModel? dataModel;
  EditEvent({Key? key,this.dataModel}) : super(key: key);

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {

  String? uid;
  String? title ;
  String? description;
  String? price;
  String? guest;
  // late String? eDate = widget.dataModel!.eventDate;
  // late String? sTime = widget.dataModel!.startTime;
  // late String? eTime = widget.dataModel!.endTime;
  String? landmark;
  String? eState;
  TextEditingController date = TextEditingController();
  TextEditingController startTime = TextEditingController();
  TextEditingController endTime = TextEditingController();

  String stateValue = 'Gujarat';
  String landmarkValue = 'Taj Mahal';

  DateTime? _selectedDate;


  final _myFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    // date = new TextEditingController(text: eDate);
    // startTime = new TextEditingController(text: sTime);
    // endTime = new TextEditingController(text: eTime);
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.dataModel!.startTime);
    print(widget.dataModel!.endTime);
    print(widget.dataModel!.eventDate);
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
                      'Edit Event',
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
                    children: [
                      const TitleText('Event Title'),
                      TextFormFieldWidget(
                        initialValue: widget.dataModel?.title,
                        controller: null,
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
                        initialValue: widget.dataModel?.description,
                        controller: null,
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
                        value: guest,
                        items: number.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            guest = newValue!;
                          });
                        },
                      ),
                      const SizedBox(height: 32),
                      const TitleText('Price per guests'),
                      TextFormFieldWidget(
                        initialValue: price,
                        prefixIcon: Icons.euro_symbol_sharp,
                      ),
                      const SizedBox(height: 32),
                      const TitleText('Add Event Photo'),
                      const SizedBox(height: 8),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: UploadImage(),
                        ),
                      ),
                      const SizedBox(height: 32),
                      TitleText('Date'),
                      TextFormFieldWidget(
                        // initialValue: eDate!,
                        readOnly: true,
                        textInputType: TextInputType.datetime,
                        controller: date,
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
                              // initialValue: sTime!,
                              readOnly: true,
                              controller: startTime,
                              onTap: selectStartTime,
                              labelText: 'Start Time',
                              suffixIcon: Icon(Icons.keyboard_arrow_down),
                            ),
                          ),
                          SizedBox(width: 32),
                          Flexible(
                            child: TextFormFieldWidget(
                              // initialValue: eTime!,
                                readOnly: true,
                                controller: endTime,
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
                                value: landmark,
                                items: Landmark.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    landmark = newValue!;
                                  });
                                }),
                          ),
                          SizedBox(width: 16),
                          Flexible(
                            child: DropdownButtonFormField(
                                isExpanded: true,
                                icon: Icon(Icons.keyboard_arrow_down),
                                decoration: InputDecoration(labelText: 'State'),
                                value: eState,
                                items: states.map((String value) {
                                  return DropdownMenuItem<String>(
                                    // overflow: TextOverflow.ellipsis,
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    eState = newValue!;
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
                              text: 'Register',
                              callBack: () {
                                if (_myFormKey.currentState!.validate()) {
                                  Navigator.pop(context);
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
  void selectStartTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    if (pickedTime != null) {
      print(pickedTime); //output 10:51 PM
      DateTime parsedTime =
      DateFormat.jm().parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
      String formattedTime = pickedTime.format(context);
      print(formattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.

      setState(() {
        startTime.text = formattedTime; //set the value of text field.
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
        date.text = formattedDate; //set output date to TextField value.
      });
    } else {}
  }

  void selectEndTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

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
        endTime.text = formattedTime; //set the value of text field.
      });
    } else {
      print("Time is not selected");
    }
  }

  void fetchData(){
    title = widget.dataModel?.title;
    description = widget.dataModel?.description;
    guest = widget.dataModel?.guestNum.toString();
    price = widget.dataModel?.price.toString();
    // eDate = widget.dataModel?.eventDate;
    // sTime = widget.dataModel?.startTime;
    // eTime = widget.dataModel?.endTime;
    landmark = widget.dataModel?.landmark;
    eState = widget.dataModel?.state;
  }
}
