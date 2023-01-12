import 'package:flutter/material.dart';
import 'package:feeder/Theme/app_colors.dart';

class Rating extends StatefulWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  int _rating = 0;

  void rate(int rating) {
    //Other actions based on rating such as api calls.
    setState(() {
      _rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        new GestureDetector(
          child: new Icon(
            Icons.star,
            color: _rating >= 1 ? Secondary : Colors.grey,
          ),
          onTap: () => rate(1),
        ),
        SizedBox(width: 10,),
        new GestureDetector(
          child: new Icon(
            Icons.star,
            color: _rating >= 2 ? Secondary : Colors.grey,
          ),
          onTap: () => rate(2),
        ),
        SizedBox(width: 10,),
        new GestureDetector(
          child: new Icon(
            Icons.star,
            color: _rating >= 3 ? Secondary : Colors.grey,
          ),
          onTap: () => rate(3),
        ),
        SizedBox(width: 10,),
        new GestureDetector(
          child: new Icon(
            Icons.star,
            color: _rating >= 4 ? Secondary : Colors.grey,
          ),
          onTap: () => rate(4),
        ),
        SizedBox(width: 10,),
        new GestureDetector(
          child: new Icon(
            Icons.star,
            color: _rating >= 5 ? Secondary : Colors.grey,
          ),
          onTap: () => rate(5),
        )
      ],
    );
  }
}
