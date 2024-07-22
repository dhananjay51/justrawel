
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
import 'package:justwravel/View/HomeView/ProductDetail/package_list_items.dart';
import 'package:justwravel/View/HomeView/ProductDetail/package_list_view.dart';
 import 'package:justwravel/models/package_details_model.dart';
 import 'package:justwravel/data/network/AppUrl.dart';
 import 'package:justwravel/models/package_details_model.dart';
 import 'package:justwravel/repository/HomeRepository.dart';

import '../../../../data/response/api_status.dart';
import 'package:provider/provider.dart';
import 'package:justwravel/viewmodel/HomeViewModel.dart';
import 'package:readmore/readmore.dart';


class ProductDetailView extends StatelessWidget {
  const ProductDetailView({
    super.key,
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
                                  Reviewitemslist(),
                                  SizedBox(height: 30),
                                  PackageInfoDetail(packageurl: "", type: ""),
                                  SizedBox(height: 30),
                                  Center(
                                    child: Text("Videos"),
                                  ),
                                  Center(
                                    child: Text("Memories For Life", style: AppStyle.instance.bodySemi.copyWith(
                                      color: AppColors.blackColor,
                                    )),
                                  ),

                                  Memories(sendType:""),


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


                                ],
                              )
                          )
                        //)
                      )]
                )
            )
        ));}}


class PackageInfoDetail extends StatefulWidget {
  final String packageurl;
  final String type;
  const PackageInfoDetail({ super.key,
    required this.packageurl,
    required this.type
  });

  @override
  _PackageInfoState createState() => _PackageInfoState();

}
class _PackageInfoState extends State<PackageInfoDetail> {

  int selectedIndex = 0;
  int segmentedControlValue = 0;

  @override
  Widget build(BuildContext context) {
    List<String> Infolist = ["OverView", "Tour detail", "Tour Informat"];
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    // TODO: implement build
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Infolist.length,
                  itemBuilder: (context, index) => buildCategory(index, Infolist),
                ),

                ),
              // (height,width ,value)
              Container(
                  margin:  EdgeInsets.all(10),
                  child:  packageListViw(selectedIndex)),

               SizedBox(height: 20),
              _segmentedControl()

             ])

          );
        }

    Widget buildCategory(int index, List<String> value) {

    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;

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
                  value[index],
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
   Widget packageListViw(int index ) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


           Container(



       child:  ReadMoreText(

       " A Leh Ladakh bike trip is on top of the bucket list of many travelers. The reason is that Ladakh is renowned for being a biker's paradise. The ever-changing terrains, the thrill of offroading, and the contrasting landscape make it a dream destination. In the past few years, the popularity of Ladakh has increased tenfold. Travelers from all over the globe come to visit the Land of High passes for many different reasons but the topmost reason remains the same, a bike trip where they get to traverse      trimMode: TrimMode.Line",
      trimLines: 2,
      colorClickableText: Colors.blue,
      trimCollapsedText: '--Read More',
      // trimExpandedText: '',
      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      )
           )
        ]
    );

  }
  Widget _segmentedControl() => Container(
    width: 500,
    height: 50,
    child: CupertinoSegmentedControl<int>(
      selectedColor: Colors.blue,
      borderColor: Colors.white,
      children: {
        0:Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Itinerary')),
       // 0: Text('Itinerary'),
        1: Padding(
      padding: EdgeInsets.all(12.0),
      child:  Text('Pricing')),

        2: Padding(
            padding: EdgeInsets.all(12.0),
            child:  Text('Batches')),
      },
      onValueChanged: (int val) {
        setState(() {
          segmentedControlValue = val;
        });
      },
      groupValue: segmentedControlValue,
    ),

  );


}





