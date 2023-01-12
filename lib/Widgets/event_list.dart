import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feeder/models/event_model.dart';
import 'package:flutter/material.dart';

import '../Theme/app_colors.dart';
import '../screens/HomePage/view_event_screen.dart';

class EventList extends StatefulWidget {
  String? name;

  EventList({this.name, Key? key}) : super(key: key);

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: (widget.name != "" && widget.name != null)
            ? FirebaseFirestore.instance
                .collection('Events')
                .where('title',
                    isGreaterThanOrEqualTo: widget.name!.toLowerCase())
                .orderBy('title')
                .startAt([widget.name!.toLowerCase()]).endAt([
                widget.name!.toLowerCase() + '\uf8ff',
              ]).snapshots()
            : FirebaseFirestore.instance.collection('Events').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('!!Something went wrong!!');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          return Column(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return InkWell(
                onTap: () {
                  print(data['eventImage'][0]);
                  // print(data['startTime']);
                  // print(data['endTime']);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewEvent(
                                dataModel: EventModel(
                                    title: data['title'],
                                    price: data['price'],
                                    description: data['description'],
                                    eventDate: data['eventDate'],
                                    startTime: data['startTime'],
                                    endTime: data['endTime'],
                                    guestNum: data['guestNum'],
                                    eventImage: data['eventImage']),
                              )));
                },
                child: Container(
                  height: 200,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                            SizedBox(width: 16),
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
                                  "€${data['price']}",
                                  style: TextStyle(
                                      color: Primary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "By Alison Amanda",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                                SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.supervised_user_circle_sharp,
                                        size: 17),
                                    Text(
                                      " ${data['guestNum']} Guest",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.location_on_outlined, size: 17),
                                    Text(
                                      "${data['state']}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 24)
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        });
  }
}
