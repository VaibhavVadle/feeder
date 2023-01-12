import 'package:flutter/material.dart';

class aboutUs extends StatelessWidget {
  const aboutUs({Key? key}) : super(key: key);

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
                  'About us',
                  style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'DMSerifDisplay',
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('• '),
                      Flexible(
                          child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,  but also the leap into electronic typesetting,'
                          ,style: TextStyle(
                              wordSpacing: 2,
                              fontSize: 16,
                              color: Color(0xff828382)
                            ),
                          ),
                      )
                    ],
                  ),
                    SizedBox(height: 24,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('• '),
                        Flexible(
                          child: Text('remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
                            ,style: TextStyle(
                                wordSpacing: 2,
                                fontSize: 16,
                                color: Color(0xff828382)
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 24,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('• '),
                        Flexible(
                          child: Text('remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
                            ,style: TextStyle(
                                wordSpacing: 2,
                                fontSize: 16,
                                color: Color(0xff828382)
                            ),
                          ),
                        )
                      ],
                    )
                ],),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
