
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:justwravel/View/HomeView/category/category_item.dart';
import 'package:provider/provider.dart';
import '../../../../data/response/api_status.dart';
import '../../../../viewmodel/CategoryViewModel.dart';
import 'package:justwravel/res/style/text_style.dart';
import 'package:justwravel/res/color.dart';
import '../../../../viewmodel/HomeViewModel.dart';


class RatingReviewView extends StatefulWidget {
  const RatingReviewView({ super.key});
  @override
  State<RatingReviewView> createState() => _PopularListViewState();
}
class _PopularListViewState extends State<RatingReviewView> {

  HomeViewViewModel googleReviewViewModel = HomeViewViewModel();

  @override
  void initState() {
    googleReviewViewModel.fetchGoogleReViewApi();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChangeNotifierProvider<HomeViewViewModel>(
            create: (BuildContext context) => googleReviewViewModel,
            child: Consumer<HomeViewViewModel>(builder: (context, value, _) {
              switch (value.getgoogleReview.apiStatus) {
                case ApiStatus.LOADING:
                  return SizedBox(
                    height: height,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                case ApiStatus.ERROR:
                  return Text(value.getgoogleReview.toString());
                case ApiStatus.COMPLETED:

                  return Container(
                     margin: EdgeInsets.all(12),

                      child:
                   Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [

                      Expanded(child: _RatingView()),
                      SizedBox(width:10),
                     
                    Expanded(child: _ReViewView()),
                  ]));
                default:
                  return const Text("Best seller default");
              }
            })),
      ],
    );
  }

  Widget _RatingView() {

    return  Container(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            //color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),


            )
        ),


              child:Row (children: [


        Image.asset("assets/images/Rating.png"),
         SizedBox(width: 5),
         Text("4.8 Star Rating", style: AppStyle.instance.bodySemi.copyWith(
           color: AppColors.blackColor,
         )),

       ]),
        height:  40,
     // width:  80,
      // margin: EdgeInsets.all(10)
    );

  }
  Widget _ReViewView() {

     return  Container(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            //color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),

            )
        ),

          child:  Row (children: [

            Image.asset("assets/images/Reviews.png"),
               SizedBox(width: 5),
              Text("24900 + " ,style: AppStyle.instance.bodySemi.copyWith(
              color: AppColors.blackColor,
              )),
              Text( "Reviews",style: AppStyle.instance.bodySmall.copyWith(
                color: AppColors.blackColor,
              ))]),
         height:  40,


      );
    }
}