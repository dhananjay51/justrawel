
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:justwravel/View/HomeView/best_Treks/best_treks_item.dart';
import 'package:provider/provider.dart';
import '../../../../data/response/api_status.dart';
import '../../../../viewmodel/HomeViewModel.dart';
import 'package:justwravel/res/components/round_button.dart';
import 'package:justwravel/res/style/text_style.dart';
import 'package:justwravel/res/color.dart';
import 'package:justwravel/res/constant/sizes_helpers.dart';
import 'package:justwravel/View/HomeView/client/trip_view.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:justwravel/models/google_review_model.dart';

class ClientView extends StatefulWidget {
  const ClientView({ super.key});
  @override
  State<ClientView> createState() => _PopularListViewState();
}

class _PopularListViewState extends State<ClientView> {

  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    homeViewViewModel.fetchGoogleReViewApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ChangeNotifierProvider<HomeViewViewModel>(
              create: (BuildContext context) => homeViewViewModel,
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

                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding:EdgeInsets.only(left: 15),child:   Text("What Our Clients Say About Us", style: AppStyle.instance.bodySmallBold.copyWith(
                            color: AppColors.blackColor,
                          ))),
                          //  _BestSellersList(height, value),
                          //_BestSellersList(height, context, value)
                          SizedBox(height: 10),
                          Card(

                              margin: EdgeInsets.all(10),
                              child: Column (
                                 children: <Widget>[
                                   SizedBox(height: 10),
                                   Image.asset("assets/images/comma.png"),
                                   SizedBox(height: 10),
                                    Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 10),
                                 child:   Text(value.getgoogleReview.data?.data?.data?.first.reviewText ?? '', maxLines: 5,textAlign: TextAlign.center),
                                    ), SizedBox(height: 10),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: <Widget>[

                                     Container(
                                     height: 40,
                width: 40,
                decoration:  BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                // filterQuality: FilterQuality.low,
                fit: BoxFit.cover,
                image:

                NetworkImage(value.getgoogleReview.data?.data?.data?.first.authorImageUrl ?? ''
                )), shape: BoxShape.circle),
                ),


                                       //Image.asset("assets/images/Avatar.png"),
                                       SizedBox(width:  10,),
                                       Column(
                                         children: <Widget>[
                                           RatingBarIndicator(
                                             rating: 5,
                                             itemBuilder: (context, index) => Icon(
                                               Icons.star,
                                               color: Colors.amber,
                                             ),
                                             itemCount: 5,
                                             itemSize: 20.0,
                                             direction: Axis.horizontal,
                                           ),
                                           Text(value.getgoogleReview.data?.data?.data?.first.authorName ?? ''),

                                         ],
                                       )

                                     ],
                                   ),
                                   SizedBox(height: 15),
                                 ],

                              )
                          )]);
                  default:
                    return const Text("Best seller default");
                }
              })
          ),
          SizedBox(height: 20),
         // TripView(),
        ]
    );
  }
}