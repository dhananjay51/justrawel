import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:justwravel/View/HomeView/back_packing_tour/pack_packing_tour_item.dart';
import 'package:justwravel/View/HomeView/best_Treks/best_treks_item.dart';
import 'package:provider/provider.dart';
import '../../../../data/response/api_status.dart';
import '../../../../viewmodel/HomeViewModel.dart';
import 'package:justwravel/res/components/round_button.dart';
import 'package:justwravel/res/style/text_style.dart';
import 'package:justwravel/res/color.dart';
import 'package:justwravel/View/HomeView/ProductDetail/package_list_view.dart';
import 'package:justwravel/data/network/AppUrl.dart';
import 'package:justwravel/View/HomeView/ProductDetail/best_packing_list.dart';

class PackingListView extends StatefulWidget {
  const PackingListView({ super.key});
  @override
  State<PackingListView> createState() => _PopularListViewState();
}
class _PopularListViewState extends State<PackingListView> {

  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    homeViewViewModel.fetchBestPackingApi();
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

                switch (value.bestPackingList.apiStatus) {
                  case ApiStatus.LOADING:
                    return SizedBox(
                      height: height,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  case ApiStatus.ERROR:
                    return Text(value.bestPackingList.toString());
                  case ApiStatus.COMPLETED:
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding:EdgeInsets.only(left: 15),child:   Text("Backpacking Tour", style: AppStyle.instance.bodySmallBold.copyWith(
                            color: AppColors.blackColor,
                          ))),
                          _BestSellersList(height,width ,value),
                        ]);
                  default:
                    return const Text("Best seller default");
                }
              })
          ),
          SizedBox(height: 20),
          CustomButton(text: "ViewAll", onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => BackPackageList(url: AppUrl.viewallPackagebackpacking, packageType: "")));
          })]
    );
  }

  Widget _BestSellersList(double height, double width, HomeViewViewModel value) {

    return  Container(
      margin: EdgeInsets.all(10),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 10.0,
            // mainAxisExtent:200,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.1)
        ),
        itemCount: value.bestPackingList.data?.data?.data!.length,
        itemBuilder: (BuildContext context, int index){
          return BackpackItem(dataItem: value.bestPackingList.data!.data!.data![index]);
        },
      )
      /*ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: value.bestSellerList.data?.data?.dataResult!.length,
          itemBuilder: (context, index) {
            return
              BestSellerItem(dataItem: value.bestSellerList.data!.data!.dataResult![index]!);
          })*/,
    );
  }
}





