
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

class TripView extends StatefulWidget {
  const TripView({ super.key});
  @override
  State<TripView> createState() => _PopularListViewState();
}

class _PopularListViewState extends State<TripView> {

  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    homeViewViewModel.fetchBestSellersApi();
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
                switch (value.bestSellerList.apiStatus) {
                  case ApiStatus.LOADING:
                    return SizedBox(
                      height: height,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  case ApiStatus.ERROR:
                    return Text(value.bestSellerList.toString());
                  case ApiStatus.COMPLETED:
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Card(

                              margin: EdgeInsets.all(10),
                    child:   Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),

                              child: Column (
                                children: <Widget>[

                                  Row(

                                    children: <Widget>[

                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),

                                   child: Image.asset("assets/images/Image.png")),
                                      Column(
                                        children: <Widget>[
                SizedBox(
                    width: 200,
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                    child:   Text("Leh Ladakh Bike & Backpacking Trip ", maxLines: 2,textDirection: TextDirection.ltr,style: AppStyle.instance.bodySmallBold.copyWith(
                color: AppColors.blackColor,
                ))))
                ,
                                           Container(
                                              height: 35,

                                               margin: EdgeInsets.all(10),
                                               padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                color: AppColors.blurlightColor,
                borderRadius: BorderRadius.circular(20)),

                                            child: Row(
                                              children: [

                                                Text("Try Your Self"),
                                                SizedBox(width: 4),
                                                Image.asset("assets/images/next.png"),
                                                
                                              ],
                                           )

                                              ),
                                      ])
                                    ],
                                  )


                                ],
                              )

                    ))]);
                  default:
                    return const Text("Best seller default");
                }
              })
          ),

        ]
    );
  }
}