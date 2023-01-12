import 'package:feeder/Widgets/welcome_container_widget.dart';
import 'package:feeder/screens/HomePage/filter_screen.dart';
import 'package:flutter/material.dart';
import '../../Widgets/event_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String name = "";
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                SizedBox(height:MediaQuery.of(context).size.height * 0.36),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Upcoming Events',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'DMSerifDisplay'
                        ),
                      ),
                      Text('See all'
                      ,style: TextStyle(
                          color: Color(0xffFE724C)
                        )
                        ,)
                    ],
                  ),
                ),
                SizedBox(height: 24,),
                EventList(name: name),
                SizedBox(height: MediaQuery.of(context).size.height * 0.145,)
              ],
            ),
            WelcomeContainer(
                description: 'We hope you are in good mood for \ncooking',
              image: AssetImage('images/homepage.png'),
                ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.28,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left:20,top:2,right:0,bottom: 2),
                            child: TextFormField(
                              controller: _searchController,
                              onChanged: (val){
                                setState(() {
                                  name = val;
                                });
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search',
                                  suffixIcon: Icon(Icons.search)
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 10,),
                      InkWell(
                        onTap: (){
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0)
                              )
                            ),
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => Wrap(children: [FilterScreen()]),
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          child: Icon(Icons.filter_alt_outlined,size: 20,color: Color(0xffFE724C),),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
    );
  }
}
