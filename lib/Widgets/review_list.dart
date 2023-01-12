import 'package:flutter/material.dart';
import 'package:feeder/Theme/app_colors.dart';

class ReviewList extends StatelessWidget {

  final review;
  const ReviewList(this.review, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 101,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            child: Container(
              width: 65,
              height: 65,
              child: Image.network('https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWFsZSUyMHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.cover,),
            ),
          ),
          SizedBox(width: 16,),
          Container(
            width:  MediaQuery.of(context).size.width * 0.635,
            height: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(review['name'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),),
                SizedBox(height: 6,),
                Row(
                  children: [
                    Flexible(
                        child: Text(
                          review['description']
                          ,softWrap: false,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14,
                              color: GreyDark,
                              fontWeight: FontWeight.w400
                          ),
                        )
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
