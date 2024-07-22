import 'package:flutter/material.dart';
import 'package:justwravel/data/network/AppUrl.dart';
import '../../../models/up_coming_trips_model.dart';
import '../../../res/color.dart';
import '../../../res/components/not_avaible_photo.dart';
import '../../../res/style/text_style.dart';
import 'package:justwravel/res/constant/string_constant.dart';

class UpComingTripsItem extends StatelessWidget {
  final Data dataItem;
  const UpComingTripsItem({
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
        Stack(alignment: Alignment.bottomCenter, children: [
          dataItem.image?[0] == null
              ? const NotAvaiblePhoto(
                  height: 20,
                  width: 20,
                )

              : tripPoster(height, width),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 10.0),
            child: tripPackageInfo(),
          ),
        ]),
        const SizedBox(height: 10),
        Padding(
            padding: const EdgeInsets.only(right: 0.0, left: 10.0),
            child: tripPackageDetails()),
      ],
     );
  }

    Column tripPackageInfo() {
    var sLoc = dataItem.startingFrom.toString();
    var eLoc = dataItem.endingTo.toString();
    var day =  (dataItem.duration! - 1).toString()  + "D/" ;
    var duration  = dataItem.duration.toString() + "N";
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const Icon(Icons.lock_clock, color: Colors.white, size: 18.0),

            SizedBox(width: 5),

            Text(day + duration,
                style: AppStyle.instance.bodySmall.copyWith(
                 // color: AppColors.whiteColor,
                )),
          ]),
          const SizedBox(height: 5),
          Row(
             // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.location_on, color: Colors.white, size: 12.0),
               Expanded(child:
               Text("$sLoc to $eLoc",textAlign: TextAlign.left,maxLines: 1,overflow: TextOverflow.ellipsis,
                    style: AppStyle.instance.bodySmall.copyWith(
                      color: AppColors.whiteColor,
                    ))),
              ]),
          const SizedBox(height: 10),
        ]);
     }
     Column tripPackageDetails() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dataItem.title.toString(),textAlign: TextAlign.left,maxLines: 2,overflow: TextOverflow.ellipsis,
              style: AppStyle.instance.bodyNormal.copyWith(
                color: AppColors.blackColor,

              )),
          const SizedBox(height: 5),

          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text( AppString.instance.currencySymbol + dataItem.defaultPrice!.price.toString(),
                style: AppStyle.instance.bodySemi.copyWith(
                  color: AppColors.blackColor,
                )),


           SizedBox(width: 10),

            if (dataItem.defaultPrice?.price != null)
               Text(AppString.instance.currencySymbol + dataItem.defaultPrice!.price.toString(),
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
  Container tripPoster(double height, double width) {
    String iconUrl = '${AppUrl.appImageUrl}${dataItem.image?[0]}';
    return Container(
      margin: const EdgeInsets.only(right: 5, left: 5),
      width: width,
      height: 120,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(Imagepath.categorgridPath.description + dataItem.image![5].image!//NetworkImage('https://storage.googleapis.com/storage.justwravel.tech/package/images/banner/category_mobile/cropped/JustWravel-1707150826-spiti-4x4-6.jpg'
          ),
        ),
      ),
      /* NetworkImage("${AppUrl.photoBaseUrl}${dataItem.image?[0]}"))),*/
    );
  }
}
