import 'package:feeder/Theme/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {

  final String message;
  final IconData icon;
  final Color bgColor;
  final Color textColor;
  final String time;

  const NotificationWidget({Key? key,
    required this.message,
    required this.icon,
    this.time = '3:00 AM',
    required this.bgColor,
    this.textColor = GreyDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: bgColor
                ),
                child: Icon(icon,color: Colors.white,size: 22,),
              ),
              SizedBox(width: 16,),
              Text(message,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                ),
              )
            ],
          ),
          Text(time,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
