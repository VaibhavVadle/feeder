import 'package:flutter/material.dart';
import '../Theme/app_colors.dart';

class ChatContainer extends StatelessWidget {

  final value;
  const ChatContainer(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage('https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWFsZSUyMHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60')
                ),
                SizedBox(width: 16,),
                Container(
                  width: 215,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(value['name'],
                        softWrap: false,
                        maxLines: 1,
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.ellipsis
                        ),
                      ),
                      Text(value['description'],
                        softWrap: false,
                        maxLines: 1,
                        style: TextStyle(
                            color: GreyDark,
                            overflow: TextOverflow.ellipsis
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(value['time'],style: TextStyle(fontSize: 10,color: GreyDark,),),
          ],
        ),
        SizedBox(height: 8,),
        Divider(
          color: GreyLight,
        ),

      ],
    );
  }
}
