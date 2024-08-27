
import 'package:flutter/material.dart';
import 'package:justwravel/View/HomeView/category/category_item.dart';
import 'package:provider/provider.dart';
import '../../../../data/response/api_status.dart';
import '../../../../viewmodel/CategoryViewModel.dart';
import 'package:justwravel/View/HomeView/category/category_grid_view.dart';
import 'package:justwravel/data/network/AppUrl.dart';
import 'package:justwravel/res/components/round_button.dart';
import '../../../res/color.dart';
import '../../../res/components/not_avaible_photo.dart';
import '../../../res/style/text_style.dart';
import 'package:justwravel/View/HomeView/category/category_grid_item.dart';
import 'package:justwravel/View/HomeView/ProductDetail/product_detail_view.dart';
import 'package:justwravel/View/HomeView/ProductDetail/package_list_view.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({ super.key});
  @override
  State<CategoryListView> createState() => _PopularListViewState();

   }

 class _PopularListViewState extends State<CategoryListView> {
  CategoryViewModel categoryViewModel = CategoryViewModel();
    var id = 12;
   int selectedIndex = 0;

  @override
  void initState() {
    categoryViewModel.fetchCategoryApi();
    categoryViewModel.fetchCategoriesApi(id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ChangeNotifierProvider<CategoryViewModel>(
            create: (BuildContext context) => categoryViewModel,
            child: Consumer<CategoryViewModel>(builder: (context, value, _) {
              switch (value.categoryList.apiStatus) {
                case ApiStatus.LOADING:
                  return SizedBox(
                    height: height,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                case ApiStatus.ERROR:
                  return Text(value.categoryList.toString());
                case ApiStatus.COMPLETED:
                  return Column(children: [
              SizedBox(
              height: height * .18,
              child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: value.categoryList.data?.data!.categoryDataResult!.length,
              itemBuilder: (context, index) {
                return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                          selectedIndex = index;
                        id =  value.categoryList.data?.data!.categoryDataResult![index].id ?? 0;
                        categoryViewModel.fetchCategoriesApi(id.toString());
                       // print(id);
                      });

                    },
              child:
               Column (
                 children: [

               Container(
                height: 70,
                width: 70,
                decoration:  BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      // filterQuality: FilterQuality.low,
                        fit: BoxFit.cover,
                        image:
                        NetworkImage(Imagepath.categryPath.description + (value.categoryList.data?.data!.categoryDataResult![index].image ?? "")
                        )), shape: BoxShape.circle),
                 ),

                   Container( width: 100 , child:Center( child:  Text(value.categoryList.data?.data!.categoryDataResult![index].title ?? "", textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,  style:  AppStyle.instance.bodyNormal.copyWith(
                       color: selectedIndex == index ? Colors.blue : Colors.black
                 // color: AppColors.blackColor,
                )))),
               ])),

               ],
              ),
              );
              }),
              ),
                  ]);
                default:
                  return const Text("Best seller default");
              }

             })),
         findPackage(id),
        SizedBox(height: 20),
        CustomButton(text: "ViewAll", onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PackageList(url: "", packageType: "")));

        }),
       ],
     );
   }
   Widget findPackage(int index) {

     final height = MediaQuery
         .of(context)
         .size
         .height;
     final width = MediaQuery
         .of(context)
         .size
         .width;
     return Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           ChangeNotifierProvider<CategoryViewModel>(
               create: (BuildContext context) => categoryViewModel,
               child: Consumer<CategoryViewModel>(builder: (context, value, _) {
                 switch (value.categoriesList.apiStatus) {
                   case ApiStatus.LOADING:
                     return SizedBox(
                       height: height,
                       child: const Center(child: CircularProgressIndicator()),
                     );
                   case ApiStatus.ERROR:
                     return Text(value.categoriesList.toString());
                   case ApiStatus.COMPLETED:
                     return Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           //categoriesList(height, width, value)
                             categoriesList(height, value)
                           // (height,width ,value),
                         ]);
                   default:
                     return const Text("Best seller default");
                 }
               })
           ),

         ]
     );
   }
   Widget categoriesList(double height, CategoryViewModel value) {
    return Container(
        margin: EdgeInsets.all(10),
        child: GridView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // number of items in each row
                mainAxisSpacing: 8.0, // spacing between rows
                crossAxisSpacing: 8.0,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height /1.7)

            ),
            itemCount:  value.categoriesList.data!.data?.data?.length, // value.categoriesList.data.data.,
            itemBuilder: (BuildContext context, int index){return   CategoryGridItem(dataItem: value.categoriesList.data!.data!.data![index]); //CategoryGridItem(dataItem: value.categoriesList.data?.data?.data[index]);
            }));
  }

  }

