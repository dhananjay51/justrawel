import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:justwravel/View/HomeView/best_seller/best_seller_item.dart';
import 'package:provider/provider.dart';
import '../../../../../data/response/api_status.dart';
import '../../../../../viewmodel/HomeViewModel.dart';
import '../../../res/color.dart';
import '../../../res/components/not_avaible_photo.dart';
import '../../../res/style/text_style.dart';
import 'package:justwravel/View/HomeView/ProductDetail/package_list_view.dart';
import 'package:justwravel/data/network/AppUrl.dart';



class BestSellersListView extends StatefulWidget {
  const BestSellersListView({ super.key});
  @override
  State<BestSellersListView> createState() => _PopularListViewState();
}

class _PopularListViewState extends State<BestSellersListView> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  @override
  void initState() {
    homeViewViewModel.fetchBestSellersApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
                  return Column(children: [

                     Padding(padding: EdgeInsets.only(left: 10, right: 10),
                         child:  Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,


                        children: <Widget>[

                          Text("Best Sellers", textAlign: TextAlign.center, style: AppStyle.instance.bodySmallBold.copyWith(
                             color: AppColors.blackColor)),

              GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PackageList(url: AppUrl.viewallPackageBestSeller, packageType: AppUrl.bestseller)));
              },
              child:  Text("View All", textAlign: TextAlign.center, style: AppStyle.instance.bodySemi.copyWith(
              color: Colors.blue)),
              )



                        ],
                      )),
              Padding(padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                  child:  _BestSellersList(height, value),
                )]);
                 default:
                  return const Text("Best seller default");
              }
            })),
      ],
    );
  }

    Widget _BestSellersList(double height, HomeViewViewModel value) {
    return SizedBox(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 10.0,
          mainAxisExtent: 250,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.2)

        ),
        itemCount: value.bestSellerList.data?.data?.dataResult!.length,
        itemBuilder: (BuildContext context, int index){
          return BestSellerItem(dataItem: value.bestSellerList.data!.data!.dataResult![index]);
        },

      )
    );
  }
}



