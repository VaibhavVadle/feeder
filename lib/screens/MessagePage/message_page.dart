import 'package:feeder/Widgets/chat_container_widget.dart';
import 'package:feeder/Widgets/welcome_container_widget.dart';
import 'package:feeder/screens/MessagePage/viewmessage_screen.dart';
import 'package:flutter/material.dart';
import 'package:feeder/List/messages.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.34),
                ...(messages)
                    .map((value) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ViewChat(value)));
                        },
                        child: ChatContainer(value)))
                    .toList(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.145)
              ],
            ),
          ),
        ),
        WelcomeContainer(
            title: 'Messages',
            description:
                'Lorem Ipsum is simply dummy text\nof the printing and industry.'),
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.275,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 2, right: 0, bottom: 2),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search',
                              suffixIcon: Icon(Icons.search)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      // showModalBottomSheet(
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.vertical(
                      //           top: Radius.circular(25.0)
                      //       )
                      //   ),
                      //   isScrollControlled: true,
                      //   context: context,
                      //   builder: (context) => Wrap(children: [FilterScreen()]),
                      // );
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.more_vert,
                        size: 20,
                        color: Color(0xffFE724C),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 16)
          ],
        ),
      ],
    );
  }
}
