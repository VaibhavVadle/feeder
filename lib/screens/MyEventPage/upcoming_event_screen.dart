import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feeder/Theme/app_colors.dart';
import 'package:feeder/models/event_model.dart';
import 'package:feeder/screens/MyEventPage/editevent_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpcomingEvents extends StatefulWidget {
  // final value;
  // const UpcomingEvents(this.value );
  @override
  State<UpcomingEvents> createState() => _UpcomingEventsState();
}

class _UpcomingEventsState extends State<UpcomingEvents> {

  Timer? countdownTimer;
  Timestamp? timeStamp;
  String d = "";

  void formatTimestampToDate() {
    var format = new DateFormat('dd MMM, yyyy');
    Timestamp? eventDate = timeStamp;
    var date = eventDate!.toDate();
    d = format.format(date).toString();
  }

  Duration myDuration = Duration(minutes: 10);
  final doc = FirebaseFirestore.instance
      .collection('Events')
      .where('eventDate',
          isGreaterThanOrEqualTo: DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day))
      .get();
  final Stream<QuerySnapshot> _eventsStream = FirebaseFirestore.instance
      .collection('Events')
      .where('eventDate',
          isGreaterThanOrEqualTo: DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day))
      .snapshots();

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(days: 5));
  }

  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  Future getTimeStampFromDatabase() async {
    await FirebaseFirestore.instance
        .collection('Events')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot){
          if(snapshot.exists){
            setState(() {
              timeStamp = snapshot.data()!['eventDate'];
            });
          }
    });
  }

  // @override
  // void initState() {
  //   getTimeStampFromDatabase();
  //   print(timeStamp.toString());
  //   // TODO: implement initState
  //   super.initState();
  //   startTimer();
  // }

  @override
  Widget build(BuildContext context) {


    String strDigits(int n) => n.toString().padLeft(2, '0');
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    // var value;
    return StreamBuilder(
        stream: _eventsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('!!Something went wrong!!');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          // if (snapshot.hasData == false) {
          //   return Column(
          //     children: [
          //       SizedBox(height: 25),
          //       Center(
          //         child: Image.asset("images/NoEvent.png"),
          //       ),
          //       Text(
          //         'No events!',
          //         style: TextStyle(fontSize: 20, color: GreyDark),
          //       )
          //     ],
          //   );
          // }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditEvent(
                                    dataModel: EventModel(
                                        title: data['title'],
                                        description: data['description'],
                                        price: data['price'],
                                        guestNum: data['guestNum'],
                                        eventDate: data['eventDate'],
                                        startTime: data['startTime'],
                                        endTime: data['endTime'],
                                        landmark: data['landmark'],
                                        state: data['state']),
                                  )));
                    },
                    child: Container(
                      height: 164,
                      //width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 134,
                                height: 164,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        data['eventImage'][0].toString(),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    // color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Text(
                                      data['title'].toString(),
                                      softWrap: true,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    '€${data['price']}',
                                    style: TextStyle(
                                        color: Color(0xffFE724C),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "By Alison Amanda",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.supervised_user_circle_sharp,
                                        size: 17,
                                      ),
                                      Text(
                                        "${data['guestNum']} Guest",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 17,
                                      ),
                                      Text(
                                        data['state'],
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: Colors.green[100],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Text(
                                      '${hours}h : ${minutes}m : ${seconds}s',
                                      style:
                                          TextStyle(color: Color(0xff27AE60)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Icon(
                            Icons.more_vert,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              );
            }).toList(),
          );
        });
  }
}
