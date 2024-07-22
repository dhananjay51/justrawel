import 'package:flutter/material.dart';
import 'package:justwravel/View/HomeView/home.dart';
import 'package:justwravel/View/Setting/SettingView.dart';
import 'package:flutter_svg/svg.dart';
import 'package:justwravel/res/color.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);
  @override
  _BottomNavigationState createState() =>
      _BottomNavigationState();
}
class _BottomNavigationState extends State {
  int _selectedTab = 0;
  List _pages = [
    Center(
        child: Home()
    ),
    Center(
      child: Text("Chat"),
    ),
    Center(
      child: Text("Trips"),
    ),
    Center(
      child: Setting(),
      //child: Text("Contact"),
    ),
    Center(
        child: Setting()
    ),
  ];
  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(

          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.1, 0.1),
                  colors: <Color>[
                    Color(0xff2E4FA4),
                    Color(0xff2E4FA4),

              ]),

            ),
          ),

        automaticallyImplyLeading: true,

        actions: [
          IconButton(
              onPressed: (){
               /// Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));
                //action coe when button is pressed
              },
              icon:  Container(

                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Color(0xFFEDEDF1),
                    shape: BoxShape.circle,
                  ),
                  //  borderRadius: BorderRadius.circular(23)),
                  child:Image.asset("assets/images/Logoslider.png") //Icon(Icons.search, color: Colors.white),
              )),
          IconButton(
              onPressed: (){
                /// Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));
                //action coe when button is pressed
              },
              icon:  Container(

                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Color(0xFFEDEDF1),
                    shape: BoxShape.circle,
                  ),
                  //  borderRadius: BorderRadius.circular(23)),
                  child:Image.asset("assets/images/search.png") //Icon(Icons.search, color: Colors.white),
              )),
             ],

         leading: IconButton(
             onPressed: (){
              /// Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));
               //action coe when button is pressed
             },
             icon:   Container(

                 width: 45,
                 height: 45,

                 child: Image.asset("assets/images/Logo-2.png"),
                  
             ),

             ),
        ),
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.chat_sharp), label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.trip_origin_sharp), label: "Tips"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Profile"),
        ]

      ),
    );
  }
}
