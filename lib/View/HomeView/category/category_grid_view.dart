import 'package:flutter/material.dart';
import 'package:justwravel/View/HomeView/upcoming_trips/upcoming_trips_item.dart';
import 'package:provider/provider.dart';
import '../../../../data/response/api_status.dart';
import '../../../../viewmodel/HomeViewModel.dart';
import '../best_seller/best_seller_item.dart';
import 'package:justwravel/res/components/round_button.dart';
import 'package:justwravel/View/HomeView/category/category_grid_item.dart';
import 'package:justwravel/View/HomeView/ProductDetail/product_detail_view.dart';
import 'package:justwravel/viewmodel/CategoryViewModel.dart';
import 'package:justwravel/View/HomeView/ProductDetail/package_list_view.dart';



class CategoryGridView extends StatefulWidget {

  final int  id;
   CategoryGridView({
     super.key,
     required this.id
   }
       );

  @override
  State<CategoryGridView> createState() => _PopularListViewState();
}

class _PopularListViewState extends State<CategoryGridView> {
  CategoryViewModel categoryViewModel = CategoryViewModel();
  @override
  void initState() {
     categoryViewModel.fetchCategoriesApi(widget.id.toString());
     super.initState();
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
     print(widget.id);
    categoryViewModel.fetchCategoriesApi(widget.id.toString());
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
              switch (value.categoriesList.apiStatus) {
                case ApiStatus.LOADING:
                  return SizedBox(
                    height: height,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                case ApiStatus.ERROR:
                  return Text(value.categoriesList.toString());
                case ApiStatus.COMPLETED:
                  return  Column(children: [

                    categoriesList(height, value),
                  ]);
                default:
                  return const Text("Best seller default");
              }
            })),

        SizedBox(height: 30),
        CustomButton(text: "ViewAll", onPressed: () {
          _navigateToNextScreen(context);



        }),
      ],
    );
  }
  void _navigateToNextScreen(BuildContext context) {

    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PackageList(url: "", packageType: "")));
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