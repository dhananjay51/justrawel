
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:justwravel/View/HomeView/banner/banner_item.dart';
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
import 'package:flutter/material.dart';
import 'package:justwravel/View/HomeView/upcoming_trips/upcoming_trips_item.dart';
import 'package:provider/provider.dart';
import '../../../../data/response/api_status.dart';
import '../../../../viewmodel/HomeViewModel.dart';
import '../best_seller/best_seller_item.dart';
import 'package:justwravel/res/components/round_button.dart';
import 'package:justwravel/View/HomeView/category/category_grid_item.dart';
import 'package:justwravel/View/HomeView/Internatio_package/International_package_items.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:justwravel/View/HomeView/ProductDetail/package_list_view.dart';
import 'package:justwravel/data/network/AppUrl.dart';


class InternationPackage extends StatefulWidget {
  const InternationPackage({super.key});

  @override
  State<InternationPackage> createState() => _PopularListViewState();
}

class _PopularListViewState extends State<InternationPackage> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  double _activePage = 0;
  final _pageController = PageController(viewportFraction: 0.95);

  @override
  void initState() {
    homeViewViewModel.fetchPackageApi();
    _pageController.addListener(() {
      setState(() {
        _activePage = _pageController.page!.toDouble() ; //.page!.toDouble();
        //print(currentPage);
      });
    });

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
            create: (BuildContext context) => homeViewViewModel,
            child: Consumer<HomeViewViewModel>(builder: (context, value, _) {
              switch (value.packageList.apiStatus) {
                case ApiStatus.LOADING:
                  return SizedBox(
                    height: height,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                case ApiStatus.ERROR:
                  return Text(value.packageList.toString());
                case ApiStatus.COMPLETED:
              return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PackageList(url:AppUrl.custominternationalPackagelist, packageType:AppUrl.customInternationalPackage)));

                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailView()));
              },
                  child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(padding:EdgeInsets.only(left: 15),child:   Text("International Packages", style: AppStyle.instance.bodySmallBold.copyWith(
                          color: AppColors.blackColor,
                        ))),
                        SizedBox(height: 20),
                    upComingTripsList(height, value),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                (value.packageList.data?.data?.data!.length ?? 0),
                       // value.upComingTripsList.data?.dataResult?.data!.length,
                            (index) {
                          return Container(
                            margin: EdgeInsets.only(right: 5),
                            alignment: Alignment.center,
                            height: 9,
                            width: 9,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _activePage == index
                                  ? Colors.green
                                  : Colors.black,
                            ),
                          );
                        },
                      ),
                    )  ]
                  ));
                default:
                  return const Text("Best seller default");
              }
            })),

      ],
    );
  }

  Widget upComingTripsList(double height, HomeViewViewModel value) {

    return Container(

        height:   (MediaQuery.of(context).size.width /1.7),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: PageView.builder(

            controller: _pageController,
            physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,

            itemCount: value.packageList.data?.data?.data?.length,
            itemBuilder: (BuildContext context, int index){return   InternationItem(dataItem: value.packageList.data!.data!.data![index]);
            }));
  }
}



