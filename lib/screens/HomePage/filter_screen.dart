import 'package:feeder/Widgets/formfield_title_widget.dart';
import 'package:feeder/Widgets/submit_button.dart';
import 'package:feeder/Widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Theme/app_colors.dart';
import '../../List/Numbers.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues values = RangeValues(1.0, 50.0);
  final date = TextEditingController();
  TextEditingController time = TextEditingController();
  String dropdownvalue = '1';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: MediaQuery.of(context).size.height * 0.78,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filters',
                        style: const TextStyle(
                            fontSize: 26,
                            fontFamily: 'DMSerifDisplay',
                            fontWeight: FontWeight.w400),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Reset',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFE724C)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 14),
                  TitleText('Location'),
                  TextFormFieldWidget(
                    prefixIcon: Icons.location_on_sharp,
                  ),
                  SizedBox(height: 28),
                  TitleText('Price'),
                  SizedBox(
                    height: 14,
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 1,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 12.0),
                    ),
                    child: RangeSlider(
                      activeColor: Color(0xffFE724C),
                      inactiveColor: Grey,
                      // thumbColor: Color(0xffFE724C),
                      values: values,
                      min: 1,
                      max: 50,
                      divisions: 50,
                      labels: RangeLabels(
                          '\€${values.start.toInt()}', '\€${values.end.toInt()}'),
                      onChanged: (value) {
                        setState(() {
                          values = value;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '  €1',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Text('€50 ',
                          style:
                              TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  TitleText('Nearest Event'),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                      Icons.directions,
                      size: 18,
                      color: Secondary,
                    )),
                    value: null,
                    items: null,
                    onChanged: (Null value) {},
                  ),
                  SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: TextFormFieldWidget(
                          textInputType: TextInputType.datetime,
                          readOnly: true,
                          controller: date,
                          isDense: true,
                          labelText: 'Date',
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter date';
                            }
                            return null;
                          },
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100));

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('dd MMM, yyyy').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              setState(() {
                                date.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                        ),
                      ),
                      SizedBox(width: 14),
                      Flexible(
                          child: TextFormFieldWidget(
                        readOnly: true,
                        controller: time,
                        labelText: 'Time',
                        suffixIcon: Icon(Icons.keyboard_arrow_down),
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context,
                          );

                          if (pickedTime != null) {
                            print(pickedTime.format(context)); //output 10:51 PM
                            DateTime parsedTime = DateFormat.jm()
                                .parse(pickedTime.format(context).toString());
                            //converting to DateTime so that we can further format on different pattern.
                            print(parsedTime); //output 1970-01-01 22:53:00.000
                            String formattedTime = pickedTime.format(context);
                            print(formattedTime); //output 14:59:00
                            //DateFormat() is from intl package, you can format the time on any pattern you need.

                            setState(() {
                              time.text =
                                  formattedTime; //set the value of text field.
                            });
                          } else {
                            print("Time is not selected");
                          }
                        },
                      )),
                    ],
                  ),
                  SizedBox(height: 28),
                  TitleText('Number of guest'),
                  DropdownButtonFormField(
                      icon: Icon(Icons.keyboard_arrow_down),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 12),
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.people_alt,
                          color: Secondary,
                          size: 24,
                        ),
                      ),
                      value: dropdownvalue,
                      items: number.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      }),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: SubmitButton(
                          text: 'Apply',
                          callBack: () {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
