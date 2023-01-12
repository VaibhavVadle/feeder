import 'package:flutter/material.dart';

class EventImage extends StatelessWidget {

  String? imageUrl;

  EventImage({Key? key,this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 187,
            decoration: BoxDecoration(
                color:Colors.transparent,
                image: DecorationImage(
                  image: NetworkImage(imageUrl!),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
          ),
        ),
      ],
    );
  }
}
