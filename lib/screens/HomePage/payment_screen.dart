import 'package:flutter/material.dart';

import '../../Theme/app_colors.dart';
import '../../Widgets/formfield_title_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  bool _isVisible = true;
  bool _Visible = true;

  void SavedCard() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  void NewCard(){
    setState(() {
      _Visible = !_Visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  'Make payment',
                  style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'DMSerifDisplay',
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            SizedBox(
              height: 32.72,
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Cards',
                        style:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  InkWell(
                      onTap: (){
                        setState(() {
                          SavedCard();
                        });
                    },
                    child: Row(
                      children: [
                        Text(
                          '●',
                          style: TextStyle(color: _isVisible ? Color(0xffFE724C) : Grey),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Text(
                          'Saved Card',
                          style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Visibility(
                    visible: _isVisible,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                            ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              height: 135.38,
                              width: 213,
                              child: Image.asset('images/card.png',fit: BoxFit.cover,)
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                                height: 135.38,
                                width: 213,
                                child: Image.asset('images/card.png',fit: BoxFit.cover,)
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '●',
                        style: TextStyle(color: _Visible ? Grey : Color(0xffFE724C)),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                NewCard();
                              });
                            },
                            child: Text(
                              'Add New Card ',
                              style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(height: 16,),
                          Visibility(
                            visible: !_Visible,
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.86,
                              height: 400,

                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    TitleText('Name'),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'Name on the card'
                                      ),
                                    ),
                                    SizedBox(height: 32,),
                                    TitleText('Card Number'),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'xxxx xxxx xxxx xxxx',
                                        suffixIcon: Icon(Icons.credit_card_rounded,size: 18,),
                                      ),
                                    ),
                                    SizedBox(height: 24,),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'MM/YYYY',
                                              labelText: 'Expiry date'
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 16,),
                                        Flexible(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              label: Text('CVV'),
                                              hintText: '- - -',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 32,),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(10)),
                                                  padding: EdgeInsets.symmetric(vertical: 14),
                                                  backgroundColor: Color(0xffFE724C)),
                                              child: Text(
                                                'Save',
                                                style: TextStyle(fontSize: 16),
                                              )),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          )


                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
