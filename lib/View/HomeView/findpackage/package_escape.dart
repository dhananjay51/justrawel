import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:justwravel/View/HomeView/best_Treks/best_treks_item.dart';
import 'package:justwravel/data/network/AppUrl.dart';
import 'package:provider/provider.dart';
import '../../../../data/response/api_status.dart';
import '../../../../viewmodel/HomeViewModel.dart';
import 'package:justwravel/res/components/round_button.dart';
import 'package:justwravel/res/style/text_style.dart';
import 'package:justwravel/res/color.dart';
import 'package:justwravel/res/constant/sizes_helpers.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:justwravel/View/HomeView/findpackage/package_escape_items.dart';
import 'package:justwravel/res/components/not_avaible_photo.dart';
import 'package:justwravel/View/HomeView/ProductDetail/package_list_view.dart';
import 'package:justwravel/data/network/AppUrl.dart';


class PackageListView extends StatefulWidget {
  const PackageListView({ super.key});
  @override
  State<PackageListView> createState() => _PopularListViewState();
}
class _PopularListViewState extends State<PackageListView> {

  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    homeViewViewModel.fetchDemosticApi();
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
                switch (value.packageList.apiStatus) {
                  case ApiStatus.LOADING:
                    return SizedBox(
                      height: height,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  case ApiStatus.ERROR:
                    return Text(value.packageList.toString());
                  case ApiStatus.COMPLETED:
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding:EdgeInsets.only(left: 15),child:   Text("Find The Perfect Escape", style: AppStyle.instance.bodySmallBold.copyWith(
                            color: AppColors.blackColor,
                          ))),


                Container(

                margin: EdgeInsets.all(15),

                child: StaggeredGridView.countBuilder(
                shrinkWrap: true,
                physics:  NeverScrollableScrollPhysics(),
                crossAxisCount: 2,

                itemCount: value.packageList.data?.data?.data!.length,    // Total number of items
                itemBuilder: (BuildContext context, int index) {

                 return

                   Stack(alignment: Alignment.bottomCenter, children: [

                 Container(

                 decoration:  BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                 // borderRadius: BorderRadius.only(
                 // topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                 image: DecorationImage(
                   fit: BoxFit.cover,
                   image: NetworkImage("${Imagepath.domesticPath.description }${value.packageList.data?.data?.data![index].image}") //Imagepath.domesticPath  +  value.packageList.data?.data?.data![index].image ?? "" ),
                 ),
                  ),
                  /* NetworkImage("${AppUrl.photoBaseUrl}${dataItem.image?[0]}"))),*/
                  ),

                   Positioned(
                       bottom: 20,
                       right: 10,
                        left:10,

                       child: tripLocation(value.packageList.data!.data!.data![index])),


                   //
                 ]);
                 //PackageItem(dataItem: value.packageList.data!.data!.data![index]);

                },
                staggeredTileBuilder: (int index) {
                return StaggeredTile.count(1, index.isEven ? 1.6 : 1.4); // Item height varies
                },
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                ),
                )]);

                  default:
                    return const Text("Best seller default");
                }
              })
          ),
          SizedBox(height: 10),
          CustomButton(text: "ViewAll", onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PackageList(url:AppUrl.customizedpackagesstatelist, packageType:AppUrl.customDomestiPackage)));
          })]
    );
  }
  Widget tripLocation(data) {

   return   Container(
        alignment: Alignment.center,
       decoration:  BoxDecoration(
         color:  Colors.white,
         borderRadius: BorderRadius.circular(10),
         // borderRadius: BorderRadius.only(
         // topLeft: Radius.circular(10), topRight: Radius.circular(10)),

       ),

        height: 70,
          // margin:  const EdgeInsets.all(10),
         //padding:  const EdgeInsets.only(left: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(padding: EdgeInsets.only(left: 10),
             child: Text(data.name,
                  style: AppStyle.instance.bodyNormal.copyWith(
                    color: AppColors.blackColor,
                  ))),

               Row(
                   children: [

                     Padding(padding: EdgeInsets.only(left: 7)),
                Text("Starting At ",  style: AppStyle.instance.bodyMedium.copyWith(
    color: AppColors.grayColor,
    )),

                Text(' \u{20B9} ${data.startingFrom.toString()}', style: AppStyle.instance.bodySemi.copyWith(
                  color: AppColors.blackColor,
                )),

              ])

            ])
    );
  }


}






