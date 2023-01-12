import 'package:flutter/material.dart';

class ReviewAppbar extends StatelessWidget {
  const ReviewAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              'Reviews',
              style: const TextStyle(
                  fontSize: 26,
                  fontFamily: 'DMSerifDisplay',
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              height: 26,
              width: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color(0xffFE724C)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('5',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  Icon(Icons.star,color: Colors.white,size: 14,)
                ],
              ),
            ),
            SizedBox(width: 16,)
          ],
        )
      ],
    );
  }
}
