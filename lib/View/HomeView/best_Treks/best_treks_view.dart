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
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:justwravel/View/HomeView/ProductDetail/package_list_view.dart';
import 'package:justwravel/data/network/AppUrl.dart';


class BesttreksListView extends StatefulWidget {
  const BesttreksListView({ super.key});
  @override
  State<BesttreksListView> createState() => _PopularListViewState();
}

class _PopularListViewState extends State<BesttreksListView> {

  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    homeViewViewModel.fetchTreksApi();
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
              switch (value.treksList.apiStatus) {
                case ApiStatus.LOADING:
                  return SizedBox(
                    height: height,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                case ApiStatus.ERROR:
                  return Text(value.treksList.toString());
                case ApiStatus.COMPLETED:
                  return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Padding(padding:EdgeInsets.only(left: 15),child:   Text("Our Best Treks", style: AppStyle.instance.bodySmallBold.copyWith(
               color: AppColors.blackColor,
              ))),
                  //  _BestSellersList(height, value),
                        //_BestSellersList(height, context, value)

                        Container(
                          margin: EdgeInsets.all(10),

            child:  DynamicHeightGridView(
                  physics: const NeverScrollableScrollPhysics(),
              itemCount: value.treksList.data?.data?.data!.length ?? 0,
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              builder: (ctx, index) {
              return BestTrekItem(dataItem: value.treksList.data!.data!.data![index]);
              /// return your widget here.
              }
              ),
                        )
                      ]);
                default:
                  return const Text("Best seller default");
              }
            })
        ),
    SizedBox(height: 10),
    CustomButton(text: "ViewAll", onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PackageList(url: AppUrl.viewAllPackageUrl, packageType: AppUrl.treksPackage)));


    })]
    );

  }
}





