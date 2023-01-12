import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeContainer extends StatefulWidget {
  final String? title;
  final String description;
  final ImageProvider? image;

  WelcomeContainer(
      {Key? key, this.title, this.image, required this.description})
      : super(key: key);

  @override
  State<WelcomeContainer> createState() => _WelcomeContainerState();
}

class _WelcomeContainerState extends State<WelcomeContainer> {

  //String? lName;
  //String? fName;
  String? uid;
  //String? profilePic;

  @override
  void initState() {
    //_getDataFromDatabase();
    _fetchUserID();
    print(uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          color: Color(0xff272D2F),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )),
      child: FutureBuilder(
          future: FirebaseFirestore.instance.collection('Users').doc(uid).get(),
          builder: (BuildContext context ,AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return SizedBox();
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (snapshot.connectionState == ConnectionState.done){
              var data = snapshot.data!.data();
              var fName = data['FirstName'];
              var lName = data['LastName'];
              var profilePic = data['profileImage'];
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.title == null ? 'Hey, ${fName} ${lName}' :
                          widget.title! ,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'DMSerifDisplay'),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          widget.description,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    widget.image != null
                        ? CircleAvatar(
                      backgroundImage: profilePic == null ? NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9YhceWoUKbK2wMeimcB0NgVEqYlpd6ccl411nf7jlx4sV5e8y5b8CdsEjPFtmbHoKhb0&usqp=CAU'):NetworkImage(profilePic.toString()),
                      radius: 28,
                      backgroundColor: Colors.white,
                    )
                        : Container(),
                  ],
                );
            }
            else{
              return CircularProgressIndicator();
            }
          },
          ),
    );

  }

  void _fetchUserID() async {
    final prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('uid');
    setState(() {});
    print("UserID:${uid}");
  }
  // Future _getDataFromDatabase () async{
  //   await FirebaseFirestore.instance.collection('Users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get()
  //       .then((snapshot) {
  //     if(snapshot.exists) {
  //       setState((){
  //         String fName = snapshot.data()!['FirstName'];
  //         String lName = snapshot.data()!['LastName'];
  //         String profilePic = snapshot.data()!["profileImage"];
  //       });
  //     }
  //   });
  // }
}
