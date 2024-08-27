import 'package:flutter/material.dart';

import 'package:justwravel/res/color.dart';
import 'package:justwravel/res/components/not_avaible_photo.dart';
import 'package:justwravel/res/style/text_style.dart';

import 'package:justwravel/models/trek_model.dart';
import 'package:justwravel/data/network/AppUrl.dart';

class BestTrekItem extends StatelessWidget {
  final TrekDataResult dataItem;
  const BestTrekItem({
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
              :   _bestSellerPoster(height, width),

                  Positioned(
                       top: 20,
                        left: 0,
                      child: tripbananer())
                 ,
               __bestSellerDetail(width ,height)

           //
        ]),
        SizedBox(height: 10),
        tripMode(),
        SizedBox(height: 10),
        tripTitle(),
        SizedBox(height: 10),
        tripLocation(),
      SizedBox(height: 10),
        tripPriceAndRatingLayout(),

      ]),
      //)
     );
    }


  Container tripbananer() {
    var sLoc = dataItem.startingFrom.toString();
    var eLoc = dataItem.endingTo.toString();
    return Container(
        padding: const EdgeInsets.only(left: 10.0, right: 12.0),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColors.flagColor,
          //color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),

            // topLeft: Radius.circular(40.0),
            //  bottomLeft: Radius.circular(40.0)),
            //borderRadius: BorderRadius.circular(8)
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
  SingleChildScrollView tripMode() {

    return  SingleChildScrollView

      ( scrollDirection: Axis.horizontal,


        child:

      Row(children: [
      Container(
         margin: EdgeInsets.all(8),
           height: 25,
          decoration: BoxDecoration(
              color: AppColors.blurlightColor,

               // Set border width
              borderRadius: BorderRadius.all(
                  Radius.circular(10.0)), // Set rounded corner radius
              // Make rounded corner of border
          ),

          child: Padding(padding: EdgeInsets.all(5), child:  Text(dataItem.trekDifficulty ?? "", style: AppStyle.instance.bodyMedium.copyWith(
        color: AppColors.blackColor,

          )
          )
          )
      ),

      Container(  height: 25,
          decoration: BoxDecoration(
        color: AppColors.blurlightColor,

        // Set border width
        borderRadius: BorderRadius.all(
            Radius.circular(10.0)), // Set rounded corner radius
        // Make rounded corner of border
      ),
          child: Padding(padding: EdgeInsets.all(3), child: Text("Bike Trip", style: AppStyle.instance.bodyMedium.copyWith(
            color: AppColors.blackColor,
          )))),
    ]));
  }
   Padding __bestSellerDetail(double width, double height) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0, left: 12.0),
      child: Container(
       // alignment: Alignment.bottomCenter,
        width: width * .5,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             /// dataItem.title == null ? const Text("N/A") : tripTitle(),

              tripPackageTime(),
              const SizedBox(height: 10),
            ]),
      ),
    );
  }

  Padding tripTitle() {
    return Padding(
        padding: const EdgeInsets.only(right: 12.0, left: 12.0),
    child:  Text(dataItem.title.toString(),overflow:TextOverflow.ellipsis, maxLines: 2,
        style: AppStyle.instance.bodySemi.copyWith(
          color: AppColors.blackColor,
        )));
  }
  Container tripLocation() {
    var sLoc = dataItem.startingFrom.toString();
    var eLoc = dataItem.endingTo.toString();
    return Container(
        padding: const EdgeInsets.only(left: 10.0, right: 12.0),
        
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.location_on, color: Colors.blue, size: 14.0),

              Flexible(
                child:
                Text("$sLoc to $eLoc",
                    style: AppStyle.instance.bodyLight.copyWith(
                      color: AppColors.blackColor,
                    ),
                    overflow:TextOverflow.visible, maxLines: 2

                )
                ),



            ]));
  }

  Row tripPackageTime() {
    var day =  (dataItem.duration! - 1).toString()  + "D/" ;
    var duration  = dataItem.duration.toString() + "N";
    return Row(children: [
      const Icon(Icons.lock_clock, color: Colors.white, size: 18.0),

      Text(day + duration,
          style: AppStyle.instance.bodyVerySmallBold.copyWith(
            color: AppColors.whiteColor,
          )),
      Spacer(),
      const Padding(
          padding: EdgeInsets.only(right: 0.5, left: 0.0),
          child: Icon(Icons.lock_clock, color: Colors.white, size: 18.0)),
    Flexible( child:  Text("Aug & Sep",textAlign: TextAlign.left,maxLines: 1,overflow: TextOverflow.ellipsis,
          style: AppStyle.instance.bodyVerySmallBold.copyWith(
            color: AppColors.whiteColor,
          ))),
    ]);
  }

  Row tripPriceAndRatingLayout() {

    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    Padding(
    padding: const EdgeInsets.only(right: 10.0, left: 12, bottom: 8),
     child: Text('\u{20B9} ${dataItem.defaultPrice!.price.toString()}',
          style: AppStyle.instance.bodySemi.copyWith(
            color: AppColors.blackColor,
          ))),
      if (dataItem.defaultPrice?.discountedPrice != null)
      Padding(
          padding: const EdgeInsets.only(right: 12.0, left: 5.0),

          child: Text(
            '\u{20B9} ${dataItem.defaultPrice!.discountedPrice.toString()}',
            style: AppStyle.instance.bodySemi.copyWith(
              color: AppColors.grayColor,
              decoration: TextDecoration.lineThrough,
              decorationColor: AppColors.grayColor, // optional
              decorationThickness: 2,
              decorationStyle: TextDecorationStyle.solid, // optional
            ),
          )),
    ]);
  }
    Container _bestSellerPoster(double height, double width) {

   // String  urlPath  =    Imagepath.categorgridPath.description + (dataItem. status.lowercased() == "Performance".lowercased()  {![5].image ?? "");
    return    Container(
     // margin: const EdgeInsets.only(right: 5, left: 5),
      width: width,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image:  DecorationImage(
          fit: BoxFit.cover,
          image:
          NetworkImage(getCategoryList(dataItem.image!)),

        ),
      ),
     ///  NetworkImage("${AppUrl.photoBaseUrl}${dataItem.image?[0]}"),
    );


  }

  String getCategoryList(List<TrekImage> inputlist) {
    var imgPath ;
      if  (inputlist.length >= 5) {
        for (var item in inputlist) {
          if (item.mainBannerType == "category-mobile") {
            print(item.image);
            imgPath = Imagepath.categorgridPath.description + (item.image ??
                "https://storage.googleapis.com/storage.justwravel.com/common/ads-banner/summer-sale-ads-banner-mobile.webp?v=1?v=1");
          }
        }
        return  imgPath;
      }
      else {

        return  "https://storage.googleapis.com/storage.justwravel.com/common/ads-banner/summer-sale-ads-banner-mobile.webp?v=1?v=1";
        'https://storage.googleapis.com/storage.justwravel.com/common/ads-banner/summer-sale-ads-banner-mobile.webp?v=1?v=1';

    }

    }


}