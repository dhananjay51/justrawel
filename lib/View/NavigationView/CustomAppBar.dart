import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double height =
        (mediaQuery.size.height - mediaQuery.padding.top) * 45;
    return AppBar(
      title: Image(image: AssetImage("assets/images/newlogo.png")),
      backgroundColor: Colors.white,
      leading: Image(image: AssetImage("assets/images/Back_icon.png")),
    );
    return Container(
      height: height,
      child: Row(
        children: <Widget>[
          Image(image: AssetImage("assets/images/Back_icon.png")),
          Image(image: AssetImage("assets/images/newlogo.png")),
          Image(image: AssetImage("assets/images/Menu_sky.png"))

        ],
      ),
    );
  }
}