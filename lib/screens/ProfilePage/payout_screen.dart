import 'package:feeder/Widgets/formfield_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:feeder/Theme/app_colors.dart';
class payout extends StatefulWidget {
  const payout({Key? key}) : super(key: key);

  @override
  State<payout> createState() => _payoutState();
}

class _payoutState extends State<payout> {

  bool _hasBeenPressed = true;
  bool? valueFirst = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    'Payout',
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
                        children: [
                          Text('•',style: TextStyle(
                              fontSize: 28,
                            color: _hasBeenPressed ? Color(0xffFE724C) :Grey ,
                          ),
                          ),
                          InkWell(
                              onTap: (){
                                setState(() {
                                  _hasBeenPressed = !_hasBeenPressed;
                                });
                              },
                              child: Image.asset('images/visa.png')),
                          SizedBox(width: 24,),
                          Text('•',style: TextStyle(
                            fontSize: 28,
                            color: _hasBeenPressed ? Grey : Color(0xffFE724C)  ,
                          ),
                          ),
                          InkWell(
                              onTap: (){
                                setState(() {
                                  _hasBeenPressed = !_hasBeenPressed;
                                });
                              },
                              child: Image.asset('images/paypal.png')),

                        ],
                      ),
                      SizedBox(height: 24,),
                      TitleText('Card Number'),
                      TextFormField(
                        decoration:InputDecoration(
                          hintText: 'xxxx xxxx xxxx xxxx',
                          suffixIcon: Icon(Icons.credit_card)
                        ),
                      ),
                      SizedBox(height: 24,),
                      Row(
                        children: [
                          Flexible(
                            child: TextField(
                              decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                  hintText: 'MM/YYYY',
                                  labelText: 'Expiry date'

                              ),
                            ),
                          ),
                          SizedBox(width: 16,),
                          Flexible(
                            child: TextField(
                              decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                label: Text('CVV'),
                                hintText: '- - -',
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 24,),
                      TitleText('Card Holder'),
                      TextFormField(
                        decoration:InputDecoration(
                            hintText: 'Enter card holder name',
                        ),
                      ),
                      SizedBox(height: 15,),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: Color(0xffFE724C),
                    value: this.valueFirst,
                    onChanged: (value) {
                      setState(() {
                        this.valueFirst = value;
                      });
                    },
                  ),
                  Text('Save my payment details for future Purchases',
                  style: TextStyle(
                    fontSize: 12,
                    color: GreyDark
                  ),)
                ],
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    TitleText('Transfer Money '),
                    TextFormField(
                      decoration:InputDecoration(
                      ),
                    ),
                    SizedBox(height: 24,),
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
                                'Transfer',
                                style: TextStyle(fontSize: 16),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
