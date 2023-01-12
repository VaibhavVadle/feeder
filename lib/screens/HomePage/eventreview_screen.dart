import 'package:feeder/Widgets/review_appbar.dart';
import 'package:feeder/Widgets/review_list.dart';
import 'package:flutter/material.dart';

import '../../List/messages.dart';
import '../../Widgets/select_rating_widget.dart';

class ReviewScreen extends StatefulWidget {


  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ReviewAppbar(),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('All Guests'),
                          const SizedBox(height: 16,),
                          Row(
                            children: const [
                              SelectRating(rating: '5',),
                              SizedBox(width: 12,),
                              SelectRating(rating: '4',),
                              SizedBox(width: 12,),
                              SelectRating(rating: '3',),
                              SizedBox(width: 12,),
                              SelectRating(rating: '2',),
                              SizedBox(width: 12,),
                              SelectRating(rating: '1',),
                              SizedBox(height: 24,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24,),
                    ...(messages).map((review){
                      return ReviewList(review);
                    }).toList(),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
