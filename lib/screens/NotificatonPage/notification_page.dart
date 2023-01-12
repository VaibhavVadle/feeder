import 'package:feeder/Widgets/welcome_container_widget.dart';
import 'package:feeder/presentation/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:feeder/Theme/app_colors.dart';
import '../../presentation/right_icons.dart';
import '../../Widgets/notification_widget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.33),
                NotificationWidget(
                    message: 'Booking Create successfully',
                    icon: Right.vector,
                    bgColor: Color(0xff3FBD61),

                ),
                Divider(
                  height: 24,
                  color: GreyLight,
                ),
                NotificationWidget(
                    message: 'New message arrived',
                    icon: CustomIcon.vector,
                    bgColor: Color(0xff016CE6)),
                Divider(
                  height: 24,
                  color: GreyLight,
                ),
                NotificationWidget(
                    message: 'Payment successful',
                    icon: Right.vector,
                    bgColor: Color(0xff3FBD61)
                ),
                Divider(
                  height: 24,
                  color: GreyLight,
                ),

              ],
            ),
          ),
          WelcomeContainer(title: 'Notification',
          description: 'Lorem Ipsum is simply dummy text \nof the printing and industry.')
        ],
    );
  }
}
