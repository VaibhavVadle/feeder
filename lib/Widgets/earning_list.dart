import 'package:flutter/material.dart';
import 'package:feeder/Theme/app_colors.dart';
import '../models/Earning.dart';

class EarningList extends StatefulWidget {
  EarningList({Key? key}) : super(key: key);

  @override
  State<EarningList> createState() => _EarningListState();
}

class _EarningListState extends State<EarningList> {
  List<Earning> earningDetails = [
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
    return ListView.builder(
      itemCount: earningDetails.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
          child: Container(
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      child: Container(
                        width: 56,
                        height: 56,
                        child: Image.network(
                          earningDetails[index].image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          earningDetails[index].name!,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          earningDetails[index].date!,
                          style: TextStyle(
                              fontSize: 14, color: GreyDark),
                        ),
                      ],
                    )
                  ],
                ),
                Text('€${earningDetails[index].amount}',
                  style: TextStyle(
                      color: Color(0xffFE724C),
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                  ),
                )
              ],
            ),
          ),
        );
        //   ListTile(
        //   title: Text(eventModelList[index].name!),
        // );
      },
    );
  }
}
