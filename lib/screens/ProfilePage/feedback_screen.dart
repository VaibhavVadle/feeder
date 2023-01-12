import 'package:feeder/Widgets/rating.dart';
import 'package:feeder/Widgets/formfield_title_widget.dart';
import 'package:flutter/material.dart';

import '../../List/rating.dart';

class feedback extends StatefulWidget {
  const feedback({Key? key}) : super(key: key);

  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                    'Feedback',
                    style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'DMSerifDisplay',
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  child: Flexible(
                    child: Text(
                      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.\n\n'
                      'It look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.',
                      style: TextStyle(
                          wordSpacing: 2,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  child: Column(
                    children: [
                      TitleText('Rate your experience'),
                      SizedBox(
                        height: 10.5,
                      ),
                      Rating(),
                      SizedBox(
                        height: 32,
                      ),
                      TitleText('What’s your feedback about us?'),
                      DropdownButtonFormField(
                        items: ratings.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TitleText('Description'),
                      TextFormField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.symmetric(vertical: 14),
                                    backgroundColor: Color(0xffFE724C)),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(fontSize: 16),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
