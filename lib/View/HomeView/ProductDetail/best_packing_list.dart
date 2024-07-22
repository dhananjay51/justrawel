import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justwravel/View/HomeView/carousel_slider.dart';
import 'package:justwravel/data/network/AppUrl.dart';
import '../../../models/up_coming_trips_model.dart';
import '../../../res/color.dart';
import '../../../res/components/not_avaible_photo.dart';
import '../../../res/style/text_style.dart';
import 'package:justwravel/res/constant/string_constant.dart';
import 'package:justwravel/View/HomeView/banner/banner_view.dart';
import 'package:justwravel/View/HomeView/ProductDetail/details.dart';
import 'package:justwravel/View/HomeView/ProductDetail/details.dart';
import 'package:justwravel/View/HomeView/Slider.dart';
import '../../../res/style/text_style.dart';
import 'package:justwravel/res/constant/string_constant.dart';
import '../../../res/color.dart';
import 'package:justwravel/View/HomeView/client/client_view.dart';
import 'package:justwravel/View/HomeView/ProductDetail/product_detail_view.dart';
import 'package:justwravel/viewmodel/HomeViewModel.dart';
import '../../../../data/response/api_status.dart';
import 'package:provider/provider.dart';
import 'package:justwravel/models/package_detail_lists_models.dart';
import 'package:justwravel/data/network/AppUrl.dart';
import 'package:justwravel/models/filter_via_category_model.dart';
import 'package:justwravel/View/HomeView/ProductDetail/package_video_list_view.dart';
import 'package:justwravel/models/custom_package_model.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:justwravel/models/best_packing_category.dart';

class BackPackageList extends StatelessWidget {
  final String url;
  final String packageType;

  const BackPackageList({
    super.key,
    required this.url,
    required this.packageType
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.1, 0.1),
                  colors: <Color>[
                    Color(0xff2E4FA4),
                    Color(0xff2E4FA4),

                  ]),

            ),
          ),

          automaticallyImplyLeading: true,

          actions: [
            IconButton(
                onPressed: (){
                  /// Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));
                  //action coe when button is pressed
                },
                icon:  Container(

                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xFFEDEDF1),
                      shape: BoxShape.circle,
                    ),
                    //  borderRadius: BorderRadius.circular(23)),
                    child:  Image.asset("assets/images/Logoslider.png") //Icon(Icons.search, color: Colors.white),
                )),
            IconButton(
                onPressed: (){
                  /// Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));
                  //action coe when button is pressed
                },
                icon:  Container(

                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xFFEDEDF1),
                      shape: BoxShape.circle,
                    ),
                    //  borderRadius: BorderRadius.circular(23)),
                    child:Image.asset("assets/images/search.png") //Icon(Icons.search, color: Colors.white),
                )),
          ],

          leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
              /// Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));
              //action coe when button is pressed
            },
            icon:   Container(

              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.4),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/backbt.png'),
                    fit: BoxFit.fill
                ),
              ),

              // child: Image.asset("assets/images/backbt.png"),

            ),

          ),
        ),

        body:  Container(
            child:SingleChildScrollView(

                child: Column(
                  //crossAxisAlignment: ,
                    children: <Widget>[
                      Container(
                          color: AppColors.backGroundColor,

                          child: Padding(
                              padding: const EdgeInsets.only(right: 10.0, left: 5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 30),
                                  IntroScreen(),
                                  SizedBox(height: 10),

                                  Detaillist(),

                                  Reviewlist(),

                                  // SizedBox(height: 30),
                                  AboutScreen(),

                                  //Sorting(),

                                 // packageType == AppUrl.customDomestiPackage || packageType == AppUrl.customInternationalPackage ?   CustomPackage(packageurl: url, type: packageType) :  ProItems(packageurl: url, type: packageType),
                                  ProItems(packageurl: url, type: packageType),

                                  Touriustlist(),

                                  Center(

                                    child: Text("Videos"),
                                  ),
                                  Center(

                                    child: Text("Memories For Life", style: AppStyle.instance.bodySemi.copyWith(
                                      color: AppColors.blackColor,
                                    )),
                                  ),

                                  PackageVideoList(sendType: "backpacking-trips"),

                                  DiscountBannar(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text("What Our Clients Say About Us", style: AppStyle.instance.bodySemi.copyWith(
                                          color: AppColors.blackColor,
                                        )),
                                      ),
                                    ],
                                  ),

                                  ClientView(),
                                  MenuList(),
                                  OganizedList(),

                                ],
                              )
                          )
                        //)
                      )]
                )
            )
        ));}
}


class ProItems extends StatefulWidget {
  final String packageurl;
  final String type;
  const ProItems({ super.key,
    required this.packageurl,
    required this.type
  });
  @override
  State<ProItems> createState() => _ProItemsState();
}

class _ProItemsState extends State<ProItems> {

  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  int selectedIndex = 0;
  int segmentedControlValue = 1;

  @override
  void initState() {
    print(AppUrl.backpackingtripsCategory);
   homeViewViewModel.fetchBackPackingCategories(AppUrl.backpackingtripsCategory);

     print(AppUrl.viewallPackagebackpacking);
    homeViewViewModel.fetchFiltetCategotyApi(AppUrl.viewallPackagebackpacking
    + "sort[field]=is_recommended&filter[states]=15&filter[countries]=&filter[month]=&filter[is_international]=0&page=1");

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<String> ? all = ["All"];
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Column(
        children:[

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),

            child:   ChangeNotifierProvider<HomeViewViewModel>(
                create: (BuildContext context) => homeViewViewModel,
                child: Consumer<HomeViewViewModel>(builder: (context, value, _) {

                  List<String> result =    value.getBackPackingCategories.data?.data ?? [];

                  switch (value.getBackPackingCategories.apiStatus) {
                    case ApiStatus.LOADING:
                      return SizedBox(
                        height: height,
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    case ApiStatus.ERROR:
                      return Text(value.getBackPackingCategories.toString());
                    case ApiStatus.COMPLETED:
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 35,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:  result.length,
                                itemBuilder: (context, index) => buildCategory(index, result),
                              ),

                            ),
                            // (height,width ,value),
                          ]);
                    default:
                      return const Text("Best seller default");
                  }
                })
            ),
          ), Container(
              margin:  EdgeInsets.all(10),
              child:  packageListViw(selectedIndex))
        ]);
  }

  Widget _segmentedControl() =>

      CustomSlidingSegmentedControl<int>(
        initialValue:  segmentedControlValue ,
        fixedWidth:     100,

        children: {
          1: Text('India', style: TextStyle(
            fontWeight: FontWeight.bold,
            color:  Colors.black ,
            // decoration: selectedIndex == index ?  TextDecoration.underline :  TextDecoration.none ,
          ),),
          2: Text('World',style: TextStyle(
            fontWeight: FontWeight.bold,
            color:  Colors.black ,
            // decoration: selectedIndex == index ?  TextDecoration.underline :  TextDecoration.none ,
          ),),

        },
        decoration: BoxDecoration(

          color:  CupertinoColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        thumbDecoration: BoxDecoration(

          color: Colors.blue,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color:  Colors.black.withOpacity(.3),
              blurRadius: 4.0,
              spreadRadius: 1.0,
              offset: Offset(
                0.0,
                2.0,
              ),
            ),
          ],
        ),

        ///duration: Duration(milliseconds: 300),
        curve: Curves.easeInToLinear,
        onValueChanged: (v) {
          print(v);
          setState(() {
            segmentedControlValue = v;
            super.initState();
          });
        },
      );

  Widget buildCategory(int index, List<String> value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          var category =   value[index]  ?? "";
          if  ( category == "All") {

           // homeViewViewModel.fetchViewAllPackageApi(widget.packageurl);
          }
          else {

           // homeViewViewModel.fetchViewAllPackageApi(widget.packageurl + "?page=1&filter[state_slug]=" + category);
          }
          super.initState();
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(
                  bottom: 5, // Space between underline and text
                ),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(
                      color: selectedIndex == index ? kTextColor : Colors.transparent,
                      width:2.0, // Underline thickness
                    ))
                ),
                child:  Text(
                  value[index]  ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: selectedIndex == index ? kTextColor : kTextLightColor,
                    // decoration: selectedIndex == index ?  TextDecoration.underline :  TextDecoration.none ,
                  ),
                )),

          ],
        ),
      ),
    );
  }
  Widget packageListViw(int index) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ChangeNotifierProvider<HomeViewViewModel>(
              create: (BuildContext context) => homeViewViewModel,
              child: Consumer<HomeViewViewModel>(builder: (context, value, _) {

                switch (value.getPackageViewAllList.apiStatus) {
                  case ApiStatus.LOADING:
                    return SizedBox(
                      height: height,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  case ApiStatus.ERROR:
                    return Text(value.getPackageViewAllList.toString());
                  case ApiStatus.COMPLETED:
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _viewAllPackageList(height, width, value)
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

  Widget _viewAllPackageList(double height, double width, HomeViewViewModel value) {
    return GestureDetector(
        onTap: () {

          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailView()));
        },

        child: ListView.builder(

            itemCount: value.getPackageViewAllList.data?.data?.data?.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return
                Card(
                    color: Colors.white,
                    elevation: 16,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Stack(alignment: Alignment.topLeft, children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover, image: NetworkImage(Imagepath.PackageListinPath.description + getImage( value.getPackageViewAllList.data!.data!.data![index].image!))),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                color: Colors.redAccent,
                              ),
                            ),
                            Positioned(
                                top: 20,
                                left: 0,

                                child:
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    color: Colors.green,
                                  ),
                                  // color: Colors.greenAccent
                                  height: 25,
                                  child: Text("Best Saller", style: AppStyle.instance.bodyVerySmall.copyWith(
                                    color: AppColors.blackColor,
                                  )),

                                )
                            ),

                          ],

                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: Triplist(),
                          ),
                          SizedBox(height:10),
                          Padding(
                              padding: const EdgeInsets.only(left: 10, right:10),

                              child: Column(

                                  children: [
                                    Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Expanded (
                                              child: Text(value.getPackageViewAllList.data!.data!.data![index].title ?? "", style: AppStyle.instance.bodySmallBold.copyWith(
                                                color: AppColors.blackColor,
                                              ))),
                                          Container(
                                            padding: const EdgeInsets.all(5.0),
                                            // color: Colors.blue,
                                            decoration: BoxDecoration(

                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                              color: Colors.blue,
                                            ),
                                            child: Column(children: [
                                              Text("Save upto"),
                                              Text("₹ 2500")
                                            ]),
                                          )

                                        ]),
                                    Row(

                                      mainAxisAlignment: MainAxisAlignment.start,

                                      children: [

                                        Expanded(child:
                                        Text((value.getPackageViewAllList.data!.data!.data![index].startingFrom ?? "") + " to " +  (value.getPackageViewAllList.data!.data!.data![index].endingTo ?? "") + " " + (value.getPackageViewAllList.data!.data!.data![index].duration! - 1).toString()  + "N/" + (value.getPackageViewAllList.data!.data!.data![index].duration).toString() + "D" )),

                                      ],),
                                  ])
                          ),
                          SizedBox(height:10),
                          Padding(
                              padding: const EdgeInsets.only(left: 10, right:10),

                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [

                                    Expanded(child:
                                    Monthlist(dateList: value.getPackageViewAllList.data!.data!.data![index].batches!)),
                                    Container(
                                      padding: const EdgeInsets.all(10.0),

                                      child: Column(children: [

                                        Text("₹" + (value.getPackageViewAllList.data!.data!.data![index].defaultPrice?.price ?? "").toString(),
                                            style: AppStyle.instance.bodySmallBold.copyWith(
                                              color: AppColors.blackColor,

                                            )),

                                        if (value.getPackageViewAllList.data!.data!.data![index].defaultPrice?.discountedPrice != null)
                                          Text("₹" + (value.getPackageViewAllList.data!.data!.data![index].defaultPrice?.discountedPrice ?? "").toString(), style: AppStyle.instance.bodySmall.copyWith(
                                              color: AppColors.blackColor,
                                              decoration: TextDecoration.lineThrough))

                                      ]),
                                    )

                                  ])),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right:10),
                            child: Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                          ),
                          SizedBox(height:10),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 10,right: 10),
                            child: Menulist(),
                          ),
                        ]));

            }));
  }

  String getImage(List<ViewAllPackageImage> inputlist) {

    var imgPath ;
    for (var item in inputlist)  {

      if(item.mainBannerType == "detail-desktop") {

        imgPath =  item.image;

      }
    }
    return imgPath;
  }

}


class CustomPackage extends StatefulWidget {
  final String packageurl;
  final String type;
  const CustomPackage({ super.key,
    required this.packageurl,
    required this.type
  });
  @override
  State<CustomPackage> createState() => _CustomPackagItemsState();
}

class _CustomPackagItemsState extends State<CustomPackage> {

  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  int selectedIndex = 0;
  @override
  void initState() {
    print(widget.type);
    homeViewViewModel.fetchCustomPackage(widget.type);
    // homeViewViewModel.fetchFiltetCategotyApi(AppUrl.customizedpackagesstatelist  + "");

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<CustomoPackageData> all = [
      CustomoPackageData(
        id: 0,
        name: "All",
        slug:  "All",
      )];
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Column(
        children:[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),

            child:   ChangeNotifierProvider<HomeViewViewModel>(
                create: (BuildContext context) => homeViewViewModel,
                child: Consumer<HomeViewViewModel>(builder: (context, value, _) {

                  List<CustomoPackageData> result =    all +   value.getCustomPackageList.data!.data!;

                  switch (value.getCustomPackageList.apiStatus) {
                    case ApiStatus.LOADING:
                      return SizedBox(
                        height: height,
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    case ApiStatus.ERROR:
                      return Text(value.getCustomPackageList.toString());
                    case ApiStatus.COMPLETED:
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 35,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:  result.length,
                                itemBuilder: (context, index) => buildCategory(index, result),
                              ),

                            ),
                            // (height,width ,value),
                          ]);
                    default:
                      return const Text("Best seller default");
                  }
                })
            ),

          ),
          Container(
              margin:  EdgeInsets.all(10),
              child:  packageListViw())
        ]);
  }
  Widget buildCategory(int index, List<CustomoPackageData> value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          var category =   (value[index].slug  ?? "").toString();
          if  ( category == "All Tour") {
            homeViewViewModel.fetchViewAllPackageApi(widget.packageurl);
          }
          else {
            print(widget.packageurl + category + "?sort[field]=price&sort[dir]=desc");

            homeViewViewModel.fetchViewAllPackageApi(widget.packageurl + category + "?sort[field]=price&sort[dir]=desc");
          }
          super.initState();
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(
                  bottom: 5, // Space between underline and text
                ),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(
                      color: selectedIndex == index ? kTextColor : Colors.transparent,
                      width:2.0, // Underline thickness
                    ))
                ),
                child:  Text(
                  value[index].name  ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: selectedIndex == index ? kTextColor : kTextLightColor,
                    // decoration: selectedIndex == index ?  TextDecoration.underline :  TextDecoration.none ,
                  ),
                )),
          ],
        ),
      ),
    );
  }
  Widget packageListViw() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ChangeNotifierProvider<HomeViewViewModel>(
              create: (BuildContext context) => homeViewViewModel,
              child: Consumer<HomeViewViewModel>(builder: (context, value, _) {
                switch (value.getPackageViewAllList.apiStatus) {
                  case ApiStatus.LOADING:
                    return SizedBox(
                      height: height,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  case ApiStatus.ERROR:
                    return Text(value.getPackageViewAllList.toString());
                  case ApiStatus.COMPLETED:
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _viewAllPackageList(height, width, value)
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
  Widget _viewAllPackageList(double height, double width, HomeViewViewModel value) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailView()));
        },
        child: ListView.builder(
            itemCount: value.getPackageViewAllList.data?.data?.data?.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return
                Card(
                    color: Colors.white,
                    elevation: 16,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Stack(alignment: Alignment.topLeft, children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover, image: NetworkImage(Imagepath.PackageListinPath.description + getImage( value.getPackageViewAllList.data!.data!.data![index].image!))),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                color: Colors.redAccent,
                              ),
                            ),
                            Positioned(
                                top: 20,
                                left: 0,

                                child:
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    color: Colors.green,
                                  ),
                                  // color: Colors.greenAccent

                                  height: 25,
                                  child: Text("Best Saller", style: AppStyle.instance.bodyVerySmall.copyWith(
                                    color: AppColors.blackColor,
                                  )),

                                )
                            ),

                          ],

                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: Triplist(),
                          ),
                          SizedBox(height:10),
                          Padding(
                              padding: const EdgeInsets.only(left: 10, right:10),

                              child: Column(

                                  children: [
                                    Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Expanded (
                                              child: Text(value.getPackageViewAllList.data!.data!.data![index].title ?? "", style: AppStyle.instance.bodySmallBold.copyWith(
                                                color: AppColors.blackColor,
                                              ))),
                                          Container(
                                            padding: const EdgeInsets.all(5.0),
                                            // color: Colors.blue,
                                            decoration: BoxDecoration(

                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                              color: Colors.blue,
                                            ),
                                            child: Column(children: [
                                              Text("Save upto"),
                                              Text("₹ 2500")
                                            ]),
                                          )

                                        ]),
                                    Row(

                                      mainAxisAlignment: MainAxisAlignment.start,

                                      children: [

                                        Expanded(child:
                                        Text((value.getPackageViewAllList.data!.data!.data![index].startingFrom ?? "") + " to " +  (value.getPackageViewAllList.data!.data!.data![index].endingTo ?? "") + " " + (value.getPackageViewAllList.data!.data!.data![index].duration! - 1).toString()  + "N/" + (value.getPackageViewAllList.data!.data!.data![index].duration).toString() + "D" )),

                                      ],),
                                  ])
                          ),
                          SizedBox(height:10),
                          Padding(
                              padding: const EdgeInsets.only(left: 10, right:10),

                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [

                                    Expanded(child:
                                    Monthlist(dateList: value.getPackageViewAllList.data!.data!.data![index].batches!)),
                                    Container(
                                      padding: const EdgeInsets.all(10.0),

                                      child: Column(children: [

                                        Text("₹" + (value.getPackageViewAllList.data!.data!.data![index].defaultPrice?.price ?? "").toString(),
                                            style: AppStyle.instance.bodySmallBold.copyWith(
                                              color: AppColors.blackColor,

                                            )),

                                        if (value.getPackageViewAllList.data!.data!.data![index].defaultPrice?.discountedPrice != null)
                                          Text("₹" + (value.getPackageViewAllList.data!.data!.data![index].defaultPrice?.discountedPrice ?? "").toString(), style: AppStyle.instance.bodySmall.copyWith(
                                              color: AppColors.blackColor,
                                              decoration: TextDecoration.lineThrough))

                                      ]),
                                    )

                                  ])),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right:10),
                            child: Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                          ),
                          SizedBox(height:10),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 10,right: 10),
                            child: Menulist(),
                          ),
                        ]));

            }));
  }

  String getImage(List<ViewAllPackageImage> inputlist) {

    var imgPath ;

    for (var item in inputlist)  {

      if(item.mainBannerType == "detail-desktop") {

        imgPath =  item.image;
      }
    }
    return imgPath;
  }
}
class Sorting extends StatefulWidget {
  @override
  _SortingState createState() => _SortingState();
}
class _SortingState extends State<Sorting> {

  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Container
      (
        margin: EdgeInsets.all(10),
        height: 50,
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 40,
              width: 127,
              // margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)
              ),
              child: Row(
                children: [
                  Text("Sort By:price"),
                ],
              ),

            ),
            Container(
              height: 40,
              width: 127,
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)
              ),
              child: Row(
                children: [
                  Text("Monthly:sep"),
                ],
              ),
            ),
          ],
        )
    );
    //);
  }
}
class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}
class _MenuListState extends State<MenuList> {

  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Container
      (
      margin: EdgeInsets.all(10),
      height: 110,
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column( children: <Widget>[
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                // color: Colors.blueAccent.withOpacity(0.4),
                // shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/travel.png'),
                    fit: BoxFit.fill
                ),
              ),

              // child: Image.asset("assets/images/backbt.png"),

            ),
            SizedBox(height: 10),
            Text("50,000+",  style: AppStyle.instance.bodySemi.copyWith(
              color: AppColors.blackColor,
            )),
            SizedBox(height: 5),
            Text("Travelers", style: AppStyle.instance.bodySmall.copyWith(
              color: AppColors.blackColor,
            ))

          ],),
          Column( children: <Widget>[
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                // color: Colors.blueAccent,

                image: DecorationImage(
                    image: AssetImage('assets/images/trip.png'),
                    fit: BoxFit.fill
                ),
              ),

              // child: Image.asset("assets/images/backbt.png"),

            ),
            SizedBox(height: 10),
            Text("50,00+", style: AppStyle.instance.bodySemi.copyWith(
              color: AppColors.blackColor,
            )),
            SizedBox(height: 5),
            Text("Successful Trips",  style: AppStyle.instance.bodySmall.copyWith(
              color: AppColors.blackColor,
            ))

          ],),
          Column( children: <Widget>[
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                //color: Colors.blueAccent,

                image: DecorationImage(
                    image: AssetImage('assets/images/bike.png'),
                    fit: BoxFit.fill
                ),
              ),

              // child: Image.asset("assets/images/backbt.png"),

            ),
            SizedBox(height: 10),
            Text("250+",  style: AppStyle.instance.bodySemi.copyWith(
              color: AppColors.blackColor,
            )),
            SizedBox(height: 5),
            Text("Bike Trips",  style: AppStyle.instance.bodySmall.copyWith(
              color: AppColors.blackColor,
            ))

          ],)

        ],
      ),

    );
    //);
  }
}
class OganizedList extends StatefulWidget {
  @override
  _OganizedListState createState() => _OganizedListState();
}
class _OganizedListState extends State<OganizedList> {
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Container
      (
      margin: EdgeInsets.all(10),
      height: 120,
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column( children: <Widget>[
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                // color: Colors.blueAccent.withOpacity(0.4),
                // shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/pan.png'),
                    fit: BoxFit.fill
                ),
              ),

              // child: Image.asset("assets/images/backbt.png"),

            ),
            SizedBox(height: 10),
            Text("Customized \n Corporate",  style: AppStyle.instance.bodySemi.copyWith(
              color: AppColors.blackColor,
            )),
            SizedBox(height: 5),
            Text("Tours PAN India", style: AppStyle.instance.bodySmall.copyWith(
              color: AppColors.blackColor,
            ))
          ],),
          Column( children: <Widget>[
            Container(

              width: 45,
              height: 45,
              decoration: BoxDecoration(
                // color: Colors.blueAccent,
                image: DecorationImage(
                    image: AssetImage('assets/images/organizationpng.png'),
                    fit: BoxFit.fill
                ),
              ),
            ),
            SizedBox(height: 10),
            Text("Organized", style: AppStyle.instance.bodySemi.copyWith(
              color: AppColors.blackColor,
            )),
            SizedBox(height: 5),
            Text("Travel Itineraries",  style: AppStyle.instance.bodySmall.copyWith(
              color: AppColors.blackColor,
            ))
          ],),
          Column( children: <Widget>[
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                //color: Colors.blueAccent,
                image: DecorationImage(
                    image: AssetImage('assets/images/review.png'),
                    fit: BoxFit.fill
                ),
              ),
            ),
            SizedBox(height: 10),
            Text("2500+",  style: AppStyle.instance.bodySemi.copyWith(
              color: AppColors.blackColor,
            )),
            SizedBox(height: 5),
            Text("Reviews",  style: AppStyle.instance.bodySmall.copyWith(
              color: AppColors.blackColor,
            ))

          ],)

        ],
      ),
    );
    //);
  }
}
class DiscountBannar extends StatefulWidget {
  @override
  _DiscountBannarState createState() => _DiscountBannarState();
}
class _DiscountBannarState extends State<DiscountBannar> {
  List<String> categories = ["111.png", "112.png"];
  // By default our first item will be selected
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) => buildImages(index),
        ),
      ),
    );
  }
  Widget buildImages(int index) {
    return
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 160,
              margin:  EdgeInsets.all(10),
              // child: iah categories[index],
              decoration: BoxDecoration(
                // color: Colors.blueAccent,
                image: DecorationImage(
                    image: AssetImage('assets/images/' + categories[index]),
                    fit: BoxFit.fill
                ),
              ),
            ),
          ],
        ),
      );
  }
}
const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);
const kDefaultPaddin = 20.0;

