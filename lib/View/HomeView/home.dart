import 'package:flutter/material.dart';
import 'package:justwravel/View/HomeView/Banner.dart';
import 'package:justwravel/View/HomeView/Internatio_package/International_package_view.dart';
import 'package:justwravel/View/HomeView/back_packing_tour/pack_packing_tour_view.dart';
import 'best_seller/best_sellers_view.dart';
import  'package:justwravel/View/HomeView/category/category_view.dart';
import 'package:justwravel/View/HomeView/upcoming_trips/upcoming_trips_view.dart';
import 'package:justwravel/View/HomeView/best_Treks/best_treks_view.dart';
import 'package:justwravel/View/HomeView/back_packing_tour/pack_packing_tour_item.dart';
import 'package:justwravel/View/HomeView/category/category_grid_view.dart';
import 'package:justwravel/View/HomeView/banner/banner_view.dart';
import 'package:justwravel/View/HomeView/rating/rating_reviewview.dart';
import 'package:justwravel/View/HomeView/Internatio_package/International_package_items.dart';
import 'package:justwravel/View/HomeView/client/client_view.dart';
import 'package:justwravel/res/color.dart';
import 'package:justwravel/res/style/text_style.dart';
 import 'package:justwravel/View/HomeView/new_launch.dart';
 import 'package:justwravel/View/HomeView/findpackage/package_escape.dart';
 import 'package:justwravel/View/HomeView/carousel_slider.dart';
import 'package:justwravel/View/HomeView/Slider.dart';
import 'package:justwravel/View/HomeView/ProductDetail/details.dart';

import 'package:justwravel/View/HomeView/ProductDetail/product_detail_view.dart';
import 'package:justwravel/View/HomeView/best_seller/best_sellers_view.dart';
import 'package:justwravel/View/HomeView/Images_slider.dart';

class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() =>
      _HomeState();
}
class _HomeState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(

              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                AppColors.appbarlinearColor,
                AppColors.backGroundColor,

              ], // Gradient from https://learnui.design/tools/gradient-generator.html
              tileMode: TileMode.mirror,
            ),
          ),

            child:SingleChildScrollView(

                child: Column(
                  //crossAxisAlignment: ,
                  children: <Widget>[
                    Container(
                decoration: const BoxDecoration(
                gradient: LinearGradient(

                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.9, 0.1],

                   colors: <Color>[
                    AppColors.appbarlinear1Color,
                    AppColors.appbarlinear1Color,

                  ], // Gradient from https://learnui.design/tools/gradient-generator.html
                  tileMode: TileMode.mirror,
                ),
            ),

                    child:   Column (children: [
                      Container(

                        margin: EdgeInsets.all(15),
                        height: 45,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          readOnly: true,
                          onTap: () {

                          } ,
                          cursorColor: Color(0xFF000000),
                          //controller: _searchController,
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.search,
                                color: Color(0xFF000000).withOpacity(0.5),
                              ),
                                hintText: "Search Location...",
                              hintStyle: AppStyle.instance.bodyNormal.copyWith(
                            color: AppColors.blackColor,
                           ),
                              contentPadding: EdgeInsets.all(10.0),
                              border: InputBorder.none),

                        )),

                      RatingReviewView(),
                  ])),
                    SizedBox(height: 15),
                    Bananer(),
                    SizedBox(height: 10),

                    CategoryListView(),

                    SizedBox(height: 30),

                    UpcomingTripsView(),

                    SizedBox(height: 30),

                   BestSellersListView(),

                    SizedBox(height: 30),

                   BesttreksListView(),

                    SizedBox(height: 30),

                    IntroScreen(),

                    SizedBox(height: 30),

                  // PackingListView() ,

                    SizedBox(height: 30),

                     PackageListView(),

                    SizedBox(height: 30),

                    InternationPackage(),
                    SizedBox(height: 30),
                    ClientView(),
                    Memories(sendType: ""),
                    SizedBox(height: 30),
                    MemoriesSlider(),
                    //Memories(),

                   ],
                )
            )
        ));
     }
   }