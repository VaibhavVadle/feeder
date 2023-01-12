

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feeder/Widgets/submit_button.dart';
import 'package:feeder/Widgets/viewevent_image_widget.dart';
import 'package:feeder/screens/HomePage/event_chat_screen.dart';
import 'package:feeder/screens/HomePage/eventreview_screen.dart';
import 'package:feeder/screens/HomePage/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:feeder/Theme/app_colors.dart';
import 'package:intl/intl.dart';

import '../../models/event_model.dart';

class ViewEvent extends StatefulWidget {
  final value;
  EventModel? dataModel;
  // int? data;
   ViewEvent({this.value,this.dataModel,super.key
    // , this. data
   });

  @override
  State<ViewEvent> createState() => _ViewEventState();
}

class _ViewEventState extends State<ViewEvent> {
  void formatTimestampToDate() {
    var format = new DateFormat('dd MMM, yyyy');
    Timestamp? eventDate = widget.dataModel?.eventDate;
    var date = eventDate!.toDate();
    d = format.format(date).toString();
  }
  void formatTimestampToStartTime() {
    var format = new DateFormat('hh:mm a');
    Timestamp? eventDate = widget.dataModel?.startTime;
    var date = eventDate!.toDate();
    sTime = format.format(date).toString();
  }
  void formatTimestampToEndTime() {
    var format = new DateFormat('hh:mm a');
    Timestamp? eventDate = widget.dataModel?.endTime;
    var date = eventDate!.toDate();
    eTime = format.format(date).toString();
  }

  String d = "";
  String sTime = "";
  String eTime = "";

  @override
  void initState() {
    formatTimestampToDate();
    formatTimestampToStartTime();
    formatTimestampToEndTime();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_outlined)),
                    const SizedBox(width: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        '${widget.dataModel?.title}',
                        style: const TextStyle(
                            fontSize: 26,
                            fontFamily: 'DMSerifDisplay',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      EventImage(imageUrl: widget.dataModel?.eventImage![0]),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Text(
                                    '${widget.dataModel?.description}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: GreyDark,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWFsZSUyMHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Alison Amanda',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          '517, Ocean Front Walk, Venice, \n'
                                              'California, 90291.',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: GreyDark,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => ReviewScreen())
                                            );
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                '24',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xffFE724C)),
                                              ),
                                              SizedBox(
                                                width: 1,
                                              ),
                                              Text(
                                                'Reviews',
                                                style: TextStyle(
                                                    decoration:
                                                    TextDecoration.underline,
                                                    fontSize: 12,
                                                    color: Color(0xffFE724C)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '5',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Secondary,
                                      size: 16,
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.euro,size: 16,color: Secondary,),
                                    SizedBox(width: 14,),
                                    Text('Price Per Guest',style: TextStyle(fontSize: 14,color: GreyDark),)
                                  ],
                                ),
                                Text('€${widget.dataModel?.price}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                              ],
                            ),
                            const SizedBox(height: 26,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.people_alt_rounded,size: 16,color: Secondary,),
                                    SizedBox(width: 14,),
                                    Text('Guests',style: TextStyle(fontSize: 14,color: GreyDark),)
                                  ],
                                ),
                                Text('${widget.dataModel?.guestNum}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                              ],
                            ),
                            const SizedBox(height: 26,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.calendar_month,size: 16,color: Secondary,),
                                    SizedBox(width: 14,),
                                    Text('Event Date  ',style: TextStyle(fontSize: 14,color: GreyDark),)
                                  ],
                                ),
                                Text('$d',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                              ],
                            ),
                            const SizedBox(height: 26,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.access_time_filled_rounded,size: 16,color: Secondary,),
                                    SizedBox(width: 14,),
                                    Text('Time',style: TextStyle(fontSize: 14,color: GreyDark),)
                                  ],
                                ),
                                Text('${sTime} - ${eTime}'
                                ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
        child: Row(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => EventChat()));
              },
              child: Container(
                width: 44,
                height: 44,
                child: Icon(Icons.messenger_rounded,size: 20 ,color: Color(0xffFE724C),),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color(0xffFE724C)
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),
            ),
            SizedBox(width: 16,),
            Expanded(
                child: SubmitButton(text: 'Book Now',
                  callBack: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen()));
                  },)
            ),
          ],
        ),
      ),
    );
  }
}
