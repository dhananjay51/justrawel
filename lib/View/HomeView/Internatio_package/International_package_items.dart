import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justwravel/data/network/AppUrl.dart';
import '../../../models/up_coming_trips_model.dart';
import '../../../res/color.dart';
import '../../../res/components/not_avaible_photo.dart';
import '../../../res/style/text_style.dart';
import 'package:justwravel/res/constant/string_constant.dart';
import 'package:justwravel/models/internation_package_model.dart';

class InternationItem extends StatelessWidget {
  final PackageResult dataItem;
  const InternationItem({
    super.key,
    required this.dataItem,
  });
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child:  Stack(alignment: Alignment.topLeft, children: [
                dataItem.image?[0] == null
                    ? const NotAvaiblePhoto(
                  height: 20,
                  width: 20,
                )
                    : tripPoster(),

                Positioned(
                    bottom: 20,
                    left: 10,
                     right:10,
                    child: tripLocation()),
                // child:tripPackageInfo())

              ]),
              // const SizedBox(height: 10),

            ), ]);
         }


  Widget tripLocation() {

    return   Container(
        alignment: Alignment.center,
        decoration:  BoxDecoration(
          color:  Colors.white,
          borderRadius: BorderRadius.circular(10),
          // borderRadius: BorderRadius.only(
          // topLeft: Radius.circular(10), topRight: Radius.circular(10)),

        ),

        height: 60,

        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(dataItem.name ?? "",
                  style: AppStyle.instance.bodyNormal.copyWith(
                    color: AppColors.blackColor,
                  )),

              Row(

                //mainAxisAlignment: MainAxisAlignment.end,

                  children: [

                    Padding(padding: EdgeInsets.only(left: 7)),
                    Text("Package Starting -",  style: AppStyle.instance.bodyMedium.copyWith(
                      color: AppColors.grayColor,
                    )),

                    Text(' \u{20B9} ${dataItem.startingFrom.toString()}', style: AppStyle.instance.bodySemi.copyWith(
                      color: AppColors.blackColor,
                    )),

                  ])

            ])
    );
  }

  Container tripPoster() {
    String  urlPath  =    Imagepath.internationalPath.description + (dataItem.image ?? "");

    return Container(
      margin: const EdgeInsets.only(right: 5, left: 5),

       decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // borderRadius: BorderRadius.only(
        // topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(urlPath),
        ),
      ),
      /* NetworkImage("${AppUrl.photoBaseUrl}${dataItem.image?[0]}"))),*/
    );
  }
}
