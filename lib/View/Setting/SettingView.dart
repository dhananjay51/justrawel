import 'package:flutter/material.dart';
class Setting extends StatefulWidget{
  const Setting({Key? key}) : super(key: key);
  @override
  _SettingState createState() =>
      _SettingState();
}
class _SettingState extends State {
  bool isSelect = true;

  List <String> Settinglist =  ["Edit Profile", "Change Password", "Notification", "Update Email","Privacy & Policy", "Logout"];
@override
Widget build(BuildContext context) {
  /*
     return Scaffold(
       appBar: AppBar(
         iconTheme: IconThemeData(
           color: Colors.white, //change your color here
         ),
         backgroundColor: Colors.red,
         title: Text("Setting", style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),

       ),
       */

  return Container(
    //margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    child: ListView.builder(
      itemCount: Settinglist.length,
      itemBuilder:  (context, index) {

        return GestureDetector(
            onTap: (){
              if (index == 5) {

                Navigator.pop(context);
              }
            },
            child:   Card(
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward),
                  title: Text(Settinglist[index]),
                )));
      },
    ),
    //)
  );
  // TODO: implement build

}
}