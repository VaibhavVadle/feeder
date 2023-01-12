import 'package:feeder/Widgets/welcome_container_widget.dart';
import 'package:feeder/screens/MyEventPage/past_event_screen.dart';
import 'package:flutter/material.dart';
import 'package:feeder/Theme/app_colors.dart';
import 'upcoming_event_screen.dart';

class MyEventPage extends StatefulWidget {
  const MyEventPage({Key? key}) : super(key: key);

  @override
  State<MyEventPage> createState() => _MyEventPageState();
}

class _MyEventPageState extends State<MyEventPage> {

  bool _hasBeenPressed = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          WelcomeContainer(title: 'My Event', description: 'Lorem Ipsum is simply dummy text \nof the printing and industry.')
          ,Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.27,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                          height: 44,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        _hasBeenPressed = !_hasBeenPressed;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: _hasBeenPressed ? Color(0xffFE724C) : Colors.grey[200],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                      ),
                                      child: Center(
                                        child: Text('Past Events',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: _hasBeenPressed ? Colors.grey[200] : GreyDark,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                
                                Expanded(
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        _hasBeenPressed = !_hasBeenPressed;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: _hasBeenPressed ? Colors.grey[200] :Color(0xffFE724C) ,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                      child: Center(
                                        child: Text('Upcoming events',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: _hasBeenPressed ? GreyDark: Colors.grey[200],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10
              ),
              Visibility(
                visible: _hasBeenPressed,
                child: Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.height * 0.58,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20,),
                          PastEvent(),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.145)
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Visibility(
                visible: !_hasBeenPressed,
                child: Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.height * 0.58,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          UpcomingEvents(),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.145)
                        ],
                      ),
                    ),
                  ),
                ),
              )

            ],
          )
        ],
    );
  }
}
