import 'package:flutter/material.dart';
import 'package:feeder/Theme/app_colors.dart';

class SelectRating extends StatefulWidget {

  final String rating;

  const SelectRating({Key? key,required this.rating}) : super(key: key);

  @override
  State<SelectRating> createState() => _SelectRatingState();
}

class _SelectRatingState extends State<SelectRating> {

  bool _hasBeenPressed = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          _hasBeenPressed = !_hasBeenPressed;
        });
      },
      child: Container(
        width:36,
        height: 24,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.all(Radius.circular(6)),
            border: Border.all(
                width: 1,
                color: _hasBeenPressed ? Colors.grey.shade200 : Colors.amber
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(widget.rating,style: TextStyle(fontSize: 12),),
            Icon(Icons.star,size: 14,color: Secondary,)
          ],
        ),
      ),
    );
  }
}
