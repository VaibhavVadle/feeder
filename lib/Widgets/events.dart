import 'package:feeder/Theme/app_colors.dart';
import 'package:flutter/material.dart';

class Event extends StatelessWidget {

  final value;

  const Event(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: [
                Image.asset('images/EventImage.png',width:134,height: 164,),
                SizedBox(width: 16,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(value['title'].toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                      ),),
                    SizedBox(height: 6,),
                    Text("€${value['price'].toString()}",
                      style: TextStyle(
                          color: Primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(height: 6,),
                    Text("By ${value['name'].toString()}",
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
                        Text(" ${value['guest'].toString()} Guest",
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
                        Text(" ${value['location'].toString()}",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                          ),)
                      ],
                    ),

                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 24,)
        ],
      ),
    );
  }
}
