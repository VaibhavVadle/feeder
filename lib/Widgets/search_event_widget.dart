import 'package:flutter/material.dart';

import '../Theme/app_colors.dart';

class SearchEventWidget extends StatefulWidget {

  final String string1;
  final String string2;

  const SearchEventWidget({Key? key,
    required this.string1,
    required this.string2
  }) : super(key: key);

  @override
  State<SearchEventWidget> createState() => _SearchEventWidgetState();
}

class _SearchEventWidgetState extends State<SearchEventWidget> {

  bool _hasBeenPressed = true;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                BorderRadius.all(Radius.circular(10),),),
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
                            child: Text('Event',
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
                            child: Text('Commission',
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
    );
  }
}
