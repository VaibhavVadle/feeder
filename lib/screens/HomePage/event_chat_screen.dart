import 'package:flutter/material.dart';
import 'package:feeder/Theme/app_colors.dart';
class EventChat extends StatelessWidget {
  const EventChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
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
                      Text(
                        'Alison Amanda',
                        style: const TextStyle(
                            fontSize: 26,
                            fontFamily: 'DMSerifDisplay',
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: 24,),
                  Text('22 Mar, 2022 Tuesday',style: TextStyle(fontSize: 16,color: GreyDark),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 44,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Grey
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 13.0),
                              child: InkWell(
                                  onTap: (){},
                                  child: Icon(Icons.emoji_emotions,color: GreyDark)
                              ),
                            ),
                            Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 6.0),
                                  child: TextField(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Type Here...'
                                    ),
                                  ),
                                )
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 13.0),
                              child: InkWell(
                                  onTap: (){},
                                  child: Icon(Icons.send_rounded,color: Color(0xffFE724C),)
                              ),
                            )
                          ],
                        ),

                      ),
                    ),
                    SizedBox(width: 12,),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Grey
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        width: 44,
                        height: 44,

                        child: Icon(Icons.perm_media,size: 16,color: GreyDark,),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
