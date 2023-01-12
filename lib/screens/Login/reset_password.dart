import 'package:feeder/Widgets/formfield_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:feeder/Theme/app_colors.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _password = new TextEditingController();
    final _confirmPassword = new TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      // SizedBox(width: 3,),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_outlined))
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Reset Password',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1),
                  ),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        TitleText('Enter new password'),
                        TextFormField(
                          controller: _password,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Secondary,
                                size: 20,
                              ),
                              suffixIcon: Icon(Icons.visibility_off)),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        TitleText('Confirm new password'),
                        TextFormField(
                          controller: _confirmPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Confirm Password';
                            }
                            if (value != _password.text) {
                              return 'Please enter same Password';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Secondary,
                                size: 20,
                              ),
                              suffixIcon: Icon(Icons.visibility_off)),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.pop(context);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)),
                                      padding: EdgeInsets.symmetric(vertical: 14),
                                      backgroundColor: Color(0xffFE724C)),
                                  child: Text(
                                    'Reset',
                                    style: TextStyle(fontSize: 16),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
