
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../res/style/text_style.dart';
import 'package:justwravel/res/constant/string_constant.dart';
import '../../../res/color.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:justwravel/models/package_detail_lists_models.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';


class itinearyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        //padding: EdgeInsets.only(top: 10),
         body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
             children: [   
               Expanded(child: HorizontalList())
             ],
             ),




         );
      }
     }
class HorizontalList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return _itinearyListControl();
      }, separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white,), itemCount: 2,

    );
  }
}

Widget _itinearyListControl() => ListTile(
  leading: Column(
    children: [
      Container(
        decoration: new BoxDecoration(
          color:AppColors.grayColor,
          borderRadius: BorderRadius.all(Radius.circular(7)),

        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "1st", style: AppStyle.instance.bodySemi.copyWith(
                color: AppColors.blackColor,
              )),Text(
                  "day", style: AppStyle.instance.bodyMedium.copyWith(
                color: AppColors.blackColor,
              )),
            ],),
        ),
      ),
    ],
  ),
  title: Text('Delhi to Manali | Overnight Journey',style: AppStyle.instance.bodyTooSemi.copyWith(
    color: AppColors.blackColor,
  )),
  subtitle: Text('The group will assemble at the pick-up point by 7 PM (tentative) in the evening.'
      ,style: AppStyle.instance.priceRegular.copyWith(
        color: AppColors.blackColor,
      )
  ),
);












