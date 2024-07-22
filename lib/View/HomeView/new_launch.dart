import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NewLaunch extends StatefulWidget {
  @override
  _NewLaunchState createState() => _NewLaunchState();
}

class _NewLaunchState extends State<NewLaunch> {
  @override
  Widget build(BuildContext context) {
    return   Container(
        margin: EdgeInsets.all(15),

         child: StaggeredGridView.countBuilder(
            shrinkWrap: true,
           physics:  NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) => new Container(

            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // borderRadius: BorderRadius.only(
              // topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://storage.googleapis.com/storage.justwravel.com/package/images/banner/category_mobile/cropped/JustWravel-1706882599-Deoriatal-Chandrashila-6.jpg"),
              ),
            ),
          ),
          staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2.6 : 2.2),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        )

    );


  }
}