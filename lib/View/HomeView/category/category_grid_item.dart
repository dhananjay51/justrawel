

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justwravel/data/network/AppUrl.dart';
import 'package:justwravel/models/home_category_model.dart';
import '../../../models/up_coming_trips_model.dart';
import '../../../res/color.dart';
import '../../../res/components/not_avaible_photo.dart';
import '../../../res/style/text_style.dart';
import 'package:justwravel/res/constant/string_constant.dart';
import 'package:justwravel/models/home_category_grid_model.dart';
import 'package:justwravel/models/home_category_model.dart';

class CategoryGridItem extends StatelessWidget {
  final  CategoriesResult  dataItem;
  const CategoryGridItem({
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
          dataItem.image  == null
              ? const NotAvaiblePhoto(
            height: 20,
            width: 20,
          )
              : tripPoster(),

          Positioned(
            top: 20,

              child: tripbananer()),
              Positioned(
                  top:  100,
                  child:  Padding(
                      padding: const EdgeInsets.only(right: 0.0, left: 10.0),

                        child: triName())),

              //SizedBox(height: 30),
              Positioned(
                  top:  140,
                  child:  Padding(
                      padding: const EdgeInsets.only(right: 0.0, left: 10.0),
                      child: triplocation())),

               Positioned(

                bottom:  40,
    child:  Padding(
    padding: const EdgeInsets.only(right: 0.0, left: 10.0),
    child: tripPackageInfo())),
              Positioned(
                  bottom:  10,
                  child:  Padding(
                      padding: const EdgeInsets.only(right: 0.0, left: 12.0),
                      child: tripPackageDetails()
                  )
               ),


            ]),
       // const SizedBox(height: 10),

    ), ]);
  }

  Container triplocation() {
    var sLoc = dataItem.startingFrom.toString();
    var eLoc = dataItem.endingTo.toString();
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 12.0),

      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
       ),

      height:  30,
      child: SizedBox(

        child:Center(
            child: Text(sLoc +  " to " + eLoc, textAlign: TextAlign.center, style: AppStyle.instance.bodyLight.copyWith(
              color: AppColors.blackColor,
            ))),
      ),
      //width:  80,
    );
  }
  Container tripbananer() {
    var sLoc = dataItem.startingFrom.toString();
    var eLoc = dataItem.endingTo.toString();
    return Container(
        margin: EdgeInsets.only(left:  4),
      padding: const EdgeInsets.only(left: 10.0, right: 12.0),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColors.flagColor,
          //color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),


          )
      ),
      child: SizedBox(
        child:Center(
            child: Text("Best Seller", textAlign: TextAlign.center, style: AppStyle.instance.bodyLight.copyWith(
              color: AppColors.blackColor,
            ))),
      ),

      height:  20,
      width:  80,
    );
   }

    Row tripPackageInfo() {
    var sLoc = "";
    var eLoc = dataItem.endingTo.toString();

    var day =  (dataItem.duration! - 1).toString()  + "D/" ;
    var duration  = dataItem.duration.toString() + "N";

      return

          Row(children: <Widget>[
            const Icon(Icons.lock_clock, color: Colors.white, size: 18.0),

            SizedBox(width: 5),


            Text( day + duration,
                style: AppStyle.instance.bodySmall.copyWith(
                  // color: AppColors.whiteColor,
                )),
            SizedBox(width: 5),

          ]);
          //const SizedBox(height: 5),
       }
  Column triName() {
        return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [


         Text(dataItem.title.toString(),textAlign: TextAlign.left,maxLines: 3,softWrap: true,
             overflow: TextOverflow.visible,
              style: AppStyle.instance.bodySemi.copyWith(
                color: AppColors.whiteColor,

               ))

       ]);
       }

    Column tripPackageDetails() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text( AppString.instance.currencySymbol + dataItem.defaultPrice!.price.toString(),
                style: AppStyle.instance.bodySemi.copyWith(
                  color: AppColors.whiteColor,
                )),

            SizedBox(width: 25),

            if (dataItem.defaultPrice?.discountedPrice != null)
            Text(AppString.instance.currencySymbol + dataItem.defaultPrice!.discountedPrice.toString(),
              style: AppStyle.instance.bodySemi.copyWith(
                color: AppColors.grayColor,
                decoration: TextDecoration.lineThrough,
                decorationColor: AppColors.grayColor, // optional
                decorationThickness: 2,
                decorationStyle: TextDecorationStyle.solid, // optional
              ),
            ),
          ])
        ]);
  }
  Container tripPoster() {
    return Container(
      margin: const EdgeInsets.only(right: 5, left: 5),

      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.9),
            BlendMode.dstATop,
          ),
          fit: BoxFit.cover,
          image:
          NetworkImage(getCategoryList(dataItem.image!)),

        ),
      ),
      /* NetworkImage("${AppUrl.photoBaseUrl}${dataItem.image?[0]}"))),*/
    );
  }
 }

String getCategoryList(List<ImageResult> inputlist) {

  var imgPath ;

   if (inputlist.length >= 5) {
     for (var item in inputlist) {
       if (item.mainBannerType == "category-mobile") {
         imgPath = Imagepath.categorgridPath.description + (item.image ?? "");
       }
     }
      return imgPath;
   }
      else {
       return  imgPath = "https://storage.googleapis.com/storage.justwravel.com/common/ads-banner/summer-sale-ads-banner-mobile.webp?v=1?v=1";
       }

   // return imgPath;
}