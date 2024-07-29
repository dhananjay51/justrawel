import 'package:flutter/material.dart';
import '../../../../models/best_sellers_model.dart';
import '../../../../res/color.dart';
import '../../../../res/components/not_avaible_photo.dart';
import '../../../../res/style/text_style.dart';

class BestSellerItem extends StatelessWidget {
  final DataResult dataItem;
  const BestSellerItem({
    super.key,
    required this.dataItem,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(alignment: Alignment.bottomCenter, children: [
          dataItem.image?[0] == null
              ? const NotAvaiblePhoto(
                  height: 20,
                  width: 20,
                )

              :


          _bestSellerPoster(height, width),
          Positioned(
              top: 80,
              left: 10,
              right: 5,
              child: tripTitle()),

       Padding(
               padding: const EdgeInsets.only(right: 0.0, left: 10.0),
                  child: tripLocation()),

          Padding(
                  padding: const EdgeInsets.only(right: 0.0, left: 10.0, top: 8),
                  child:  __bestSellerDetail(height, width)),


        ]),
      ],
    );
  }

  Padding __bestSellerDetail(double width, double height) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0, left: 12.0),
      child: Container(
        alignment: Alignment.bottomCenter,
        width: width * .5,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              tripPackageTime(),
              const SizedBox(height: 20),

            ]),
      ),
    );
  }

  Text tripTitle() {

    return
   Text(dataItem.title.toString(),
        style: AppStyle.instance.bodySemi.copyWith(
          color: AppColors.whiteColor,
        ));
  }
  Container tripLocation() {
    var sLoc = dataItem.startingFrom.toString();
    var eLoc = dataItem.endingTo.toString();
    return Container(
        padding: const EdgeInsets.only(left: 0.0, right: 5.0),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: AppColors.whiteColor,
            width: 3.0,
          ),
        ),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          const Icon(Icons.location_on, color: Colors.blue, size: 14.0),
          Text("$sLoc to $eLoc",
              style: AppStyle.instance.bodyVerySmallBold.copyWith(
                color: AppColors.blackColor,
              )),
        ]));
  }

  Row tripPackageTime() {
    var day =  (dataItem.duration! - 1).toString()  + "D/" ;
    var duration  = dataItem.duration.toString() + "N";
    return Row(children: [
      const Icon(Icons.lock_clock, color: Colors.white, size: 18.0),
      Text(day +  duration,
          style: AppStyle.instance.bodyVerySmallBold.copyWith(
            color: AppColors.whiteColor,
          )),
      Spacer(),
      const Padding(
          padding: EdgeInsets.only(right: 0.0, left: 5.0),
          child: Icon(Icons.lock_clock, color: Colors.white, size: 18.0)),
      Text("Aug & Sep",
          style: AppStyle.instance.bodyVerySmallBold.copyWith(
            color: AppColors.whiteColor,
          )),
    ]);
  }

  Row tripPriceAndRatingLayout() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text('\u{20B9} ${dataItem.defaultPrice!.price.toString()}',
          style: AppStyle.instance.bodyVerySmallBold.copyWith(
            color: AppColors.whiteColor,
          )),
      if (dataItem.defaultPrice?.price != null)
       Padding(
           padding: const EdgeInsets.only(right: 5.0, left: 5.0),
          child: Text(
            '\u{20B9} ${dataItem.defaultPrice!.discountedPrice.toString()}',
            style: AppStyle.instance.bodyVerySmallBold.copyWith(
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
    return Container(
      margin: const EdgeInsets.only(right: 5, left: 5),
      width: width,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
          ),
        ),
      ),
      /* NetworkImage("${AppUrl.photoBaseUrl}${dataItem.image?[0]}"))),*/
    );
  }
}
