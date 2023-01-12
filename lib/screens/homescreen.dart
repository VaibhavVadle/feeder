import 'package:feeder/presentation/custom_icon1_icons.dart';
import 'package:feeder/screens/NotificatonPage/notification_page.dart';
import 'package:feeder/screens/MessagePage/message_page.dart';
import 'package:feeder/screens/HomePage/create_event.dart';
import 'package:feeder/screens/HomePage/home_page.dart';
import 'package:feeder/screens/MyEventPage/myevent_page.dart';
import 'package:feeder/screens/ProfilePage/profile_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final screens = [
    HomePage(),
    ChatPage(),
    MyEventPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  // Future getDataFromDatabase () async{
  //   await FirebaseFirestore.instance.collection('Users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get()
  //       .then((snapshot) {
  //     if(snapshot.exists) {
  //       setState((){
  //         _fName = snapshot.data()!['FirstName'];
  //         _lName = snapshot.data()!['LastName'];
  //         _email = snapshot.data()!['EmailId'];
  //         _email = snapshot.data()!['EmailId'];
  //         _email = snapshot.data()!['EmailId'];
  //         _email = snapshot.data()!['EmailId'];
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateEvent()));
        },
        backgroundColor: Color(0xffFE724C),
        child: Icon(Icons.add, size: 35),
      ),
      extendBody: true,
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.13,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), // adjust to your liking
            topRight: Radius.circular(50), // adjust to your liking
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
          color: Colors.white10, // put the color here
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined, size: 30),
                  label: selectedIndex == 0 ? '•' : ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message_outlined),
                  label: selectedIndex == 1 ? '•' : ''),
              BottomNavigationBarItem(
                  icon: Icon(CustomIcon1.icon),
                  label: selectedIndex == 2 ? '•' : ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: selectedIndex == 3 ? '•' : ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: selectedIndex == 4 ? '•' : ''),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Color(0xffFE724C),
            unselectedItemColor: Colors.black45,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(
              fontSize: 20,
            ),
            onTap: (index) => setState(() => selectedIndex = index),
          ),
        ), // don't forget to put it
      ),
      // appBar: AppBar(title: Text('Feeder'),),
      // body: IndexedStack(
      //   index: selectedIndex,
      //   children: screens,
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.shifting,
      //     items:const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.home),label: '•'),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.message),label: '•'),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.fastfood),label: '•'),
      //
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.notifications),label:'•'),
      //
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.person),label: '•'),
      //     ],
      //   currentIndex: selectedIndex,
      //   selectedItemColor:Colors.blue[800],
      //   unselectedItemColor: Colors.black,
      //   onTap: (index) =>setState(() =>selectedIndex = index),
      // ),
    );
  }
}
