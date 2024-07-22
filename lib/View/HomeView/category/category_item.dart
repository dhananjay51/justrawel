import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../models/home_category_model.dart';
import '../../../res/color.dart';
import '../../../res/components/not_avaible_photo.dart';
import '../../../res/style/text_style.dart';
import 'package:justwravel/data/network/AppUrl.dart';
import 'package:justwravel/viewmodel/CategoryViewModel.dart';
import 'package:justwravel/View/HomeView/category/category_grid_view.dart';

class CategortyItem extends StatelessWidget {
  CategoryViewModel categoryViewModel = CategoryViewModel();

  final CategoryDataResult categoryItem;
   CategortyItem({
    super.key,
    required this.categoryItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
               print(categoryItem.id);
               categoryViewModel.fetchCategoriesApi(categoryItem.id.toString());
               },
              child: _bestSellerPoster(70, 70)
           ),
           _movieTitle(),
          ],
      ),
    );
   }
   Container _movieTitle() {
    return Container ( width: 100 , child:Center( child:  Text(categoryItem.title ?? "", textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,  style:  AppStyle.instance.bodyNormal.copyWith(
                  color: AppColors.blackColor,
                ))));
     }
     Container _bestSellerPoster(double height, double width, ) {
    return Container(
      height: height,
      width: width,
      decoration:  BoxDecoration(
        color: Colors.red,
          image: DecorationImage(
             // filterQuality: FilterQuality.low,
              fit: BoxFit.cover,
              image:
              NetworkImage(Imagepath.categryPath.description + (categoryItem.image ?? "")
              )), shape: BoxShape.circle),
    );
   }
}

