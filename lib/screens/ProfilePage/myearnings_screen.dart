import 'package:feeder/Widgets/earning_list.dart';
import 'package:feeder/models/Earning.dart';
import 'package:flutter/material.dart';
import 'package:feeder/Theme/app_colors.dart';
import '../../Widgets/commision_list.dart';

class myEarnings extends StatefulWidget {
  myEarnings({Key? key}) : super(key: key);

  @override
  State<myEarnings> createState() => _myEarningsState();
}

class _myEarningsState extends State<myEarnings> {
  bool _hasBeenPressed = true;

  List<Earning> earningList = [
    Earning(
        name: 'Kozy Kitchen',
        date: '20 Mar, 2022',
        amount: 70,
        image:
            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600'),
    Earning(
        name: 'Kitchen Partners',
        date: '22 Mar, 2022',
        amount: 50,
        image:
            'https://images.pexels.com/photos/1547971/pexels-photo-1547971.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    Earning(
        name: 'Cooking King',
        date: '10 Mar, 2022',
        amount: 40,
        image:
            'https://images.pexels.com/photos/428361/pexels-photo-428361.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    Earning(
        name: 'Six Flavours',
        date: '2 Jan, 2022',
        amount: 10,
        image:
            'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(width: 3,),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_outlined)),
                const SizedBox(width: 10),
                const Text(
                  'My Earnings',
                  style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'DMSerifDisplay',
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
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
              ),
            ),
            SizedBox(height: 26,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                height: 63,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total earning',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffFE724C)
                        ),
                      ),
                      Text('€170',
                        style: TextStyle(
                          color: Color(0xffFE724C),
                          fontSize: 24,
                          fontWeight: FontWeight.w700
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12,),
            Visibility(
                visible: _hasBeenPressed,
                child: EarningList()),
            Visibility(
                visible: !_hasBeenPressed,
                child: CommissionList())
          ],
        ),
      ),
    );
  }
}
