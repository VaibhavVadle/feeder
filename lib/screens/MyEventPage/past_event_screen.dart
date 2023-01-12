import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Theme/app_colors.dart';

class PastEvent extends StatefulWidget {
  const PastEvent({Key? key}) : super(key: key);

  @override
  State<PastEvent> createState() => _PastEventState();
}

class _PastEventState extends State<PastEvent> {

  final _eventStream = FirebaseFirestore.instance.collection('Events').where('eventDate',isLessThanOrEqualTo: DateTime.now()).snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _eventStream,
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError) {
            return Text('!!Something went wrong!!');
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }
          if (snapshot.hasData == false ){
            return Column(
              children: [
                SizedBox(height: 25),
                Center(
                  child: Image.asset("images/NoEvent.png"),
                ),
                Text(
                  'No events!',
                  style: TextStyle(
                      fontSize: 20,
                      color: GreyDark
                  ),
                )
              ],
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: snapshot.data!.docs.map((DocumentSnapshot document){
              Map<String,dynamic> data = document.data()! as Map<String,dynamic>;
              return Column(
                children: [
                  InkWell(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> EditEvent(
                      //   dataModel: EventModel(
                      //       title: data['title'],
                      //       description: data['description'],
                      //       price: data['price'],
                      //       guestNum: data['guestNum'],
                      //       eventDate: data['eventDate'],
                      //       startTime: data['startTime'],
                      //       endTime: data['endTime'],
                      //       landmark: data['landmark'],
                      //       state: data['state']
                      //   ),
                      // )));
                    },
                    child: Container(
                      height: 164,
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
                                      image: NetworkImage(data['eventImage'][0].toString(),),
                                      fit: BoxFit.cover,
                                    ),
                                    // color: Colors.black,
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                              ),
                              SizedBox(width: 16,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:MediaQuery.of(context).size.width * 0.4,
                                    child: Text(
                                      data['title'].toString(),
                                      softWrap: true,maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 6,),
                                  Text('€${data['price']}',
                                    style: TextStyle(
                                        color: Color(0xffFE724C),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  SizedBox(height: 6,),
                                  Text("By Alison Amanda",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14
                                    ),
                                  ),
                                  SizedBox(height: 6,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.supervised_user_circle_sharp,size: 17,),
                                      Text("${data['guestNum']} Guest",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400
                                        ),)
                                    ],
                                  ),
                                  SizedBox(height: 6,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.location_on_outlined,size: 17,),
                                      Text(data['state'],
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400
                                        ),),

                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Icon(Icons.more_vert,size: 18,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),
                ],
              );
            }).toList(),
          );
        }
    );
  }
}
