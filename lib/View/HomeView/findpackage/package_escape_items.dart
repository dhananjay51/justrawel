
import 'package:flutter/material.dart';
import  'package:justwravel/models/best_sellers_model.dart';
import 'package:justwravel/res/color.dart';
import 'package:justwravel/res/components/not_avaible_photo.dart';
import 'package:justwravel/res/style/text_style.dart';
import 'package:justwravel/res/color.dart';
import 'package:justwravel/models/internation_package_model.dart';

class PackageItem extends StatelessWidget {
  final PackageResult dataItem;
  const PackageItem({
    super.key,
    required this.dataItem,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return   Card (
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,

          children: [
            Stack(alignment: Alignment.bottomCenter, children: [

              dataItem.image?[0] == null
                  ? const NotAvaiblePhoto(
                height: 20,
                width: 20,
              )
                  :

                   _bestSellerPoster(),

              Positioned(
                  bottom: 20,
                  left: 0,
                  child: tripLocation()),


              //
            ]),


          ]),
      //)
    );
  }



  Container tripLocation() {

    return Container(


         color:  Colors.white,
           height: 60,
        margin:  const EdgeInsets.all(10),
        child: Column(
          //  mainAxisSize: MainAxisSize.min,
           // crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text(dataItem.name ?? "",
                  style: AppStyle.instance.bodyVerySmallBold.copyWith(
                    color: AppColors.blackColor,
                  )),

               Row( children: [

                  Text("Starting At "),
                  Text(' \u{20B9} ${dataItem.startingFrom.toString()}'),


               ])

            ])
     );
      }
      Container _bestSellerPoster() {
   // String iconUrl = '${AppUrl.appImageUrl}${dataItem.image?[0]}';
    return Container(
      decoration:  BoxDecoration(

        // borderRadius: BorderRadius.only(
        // topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage("https://storage.googleapis.com/storage.justwravel.com/package/images/banner/category_mobile/cropped/JustWravel-1706882599-Deoriatal-Chandrashila-6.jpg"),
        ),
      ),
      /* NetworkImage("${AppUrl.photoBaseUrl}${dataItem.image?[0]}"))),*/
    );
  }
}
