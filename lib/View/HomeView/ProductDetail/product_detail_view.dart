
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
import 'package:justwravel/View/HomeView/best_seller/best_seller_item.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_html/flutter_html.dart';

class ProductDetailView extends StatefulWidget {
 final String slug;
  ProductDetailView({
    super.key,
     required this.slug
  });
  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}
class _ProductDetailViewState extends State<ProductDetailView> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {

     print(AppUrl.PackageDetails + widget.slug);
    homeViewViewModel.fetchPackingDetail(AppUrl.PackageDetails + widget.slug);

    super.initState();
  }
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

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1),

                        child:   ChangeNotifierProvider<HomeViewViewModel>(
                            create: (BuildContext context) => homeViewViewModel,
                            child: Consumer<HomeViewViewModel>(builder: (context, value, _) {
                              switch (value.getPackageDetails.apiStatus) {
                                case ApiStatus.LOADING:
                                  return SizedBox(
                                    height: 200,
                                    child: const Center(child: CircularProgressIndicator()),
                                  );
                                case ApiStatus.ERROR:
                                  return Text(value.getPackageDetails.toString());

                                case ApiStatus.COMPLETED:
                                  return Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 30),
                                        IntroScreen(),
                                        SizedBox(height: 10),
                                        Detaillist(),
                                        Reviewitemslist(),
                                        SizedBox(height: 30),
                                        PackageInfoDetail(packageurl: "", type: "", packageDetail: value.getPackageDetails.data!.data!.data!.first),
                                        SizedBox(height: 30),
                                        SimilarPackageListView(),
                                        //SizedBox(height: 30),
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

                                      ]);
                                default:
                                  return const Text("Best seller default");
                              }
                            })
                        ),
                      ),

                      /*
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
                      )
                      */
                    ]

                )
            )
        ));}}


class PackageInfoDetail extends StatefulWidget {
  final String packageurl;
  final String type;
  final PackageDetailDataResult packageDetail;
  const PackageInfoDetail({ super.key,
    required this.packageurl,
    required this.type,
    required this.packageDetail
  });

  @override
  _PackageInfoState createState() => _PackageInfoState();

}
class _PackageInfoState extends State<PackageInfoDetail> {


  int selectedIndex = 0;
  int segmentedControlValue = 0;
  int thinknowsegmentedValue = 0;
  int pricingSegmentedControlValue = 0;
  int inclusionsSegmentedControlValue = 0;
  int selectedInclusionIndex = 0;
  var selectedInclusionTab = "Inclusion";
  List<String> Inclusions = ["Inclusions", "Exclusions"];


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
              _segmentedControl(),

              SizedBox(height: 20),
              Container(
                  child: segmentedControlValue==0?_itinearyControl(widget.packageDetail.itineraries![0].itineraryDayWise ?? []):
                  segmentedControlValue==1?_pricingControl():
                  segmentedControlValue==2?_batchesControl():_itinearyControl(widget.packageDetail.itineraries![0].itineraryDayWise ?? [])
              ),
              SizedBox(height: 20),
              _InclusionsSegmentedControl(),
              Container(
                  child: inclusionsSegmentedControlValue==0?_inclusionControl():
                  inclusionsSegmentedControlValue==1?_cancellationControl():_inclusionControl()
              ),
              SizedBox(height: 20,),
              SizedBox(height: 20),


              _thinkssegmentedControl(),
              SizedBox(height: 20),

              if (thinknowsegmentedValue == 0) ThinkknowPackageView() else ThinkknowView(widget.packageDetail.thingsToPack ?? [])

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


  //pradeep code

  Widget _itinearyControl(List<ItineraryDayWise>?  itineraryDayWise) => Container(
    width: double.infinity,

    margin: EdgeInsets.all(10),

    padding: EdgeInsets.all(10),
    decoration: new BoxDecoration(
      color:Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),

    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Itinerary", style: AppStyle.instance.bodySmallBold.copyWith(
          color: AppColors.blackColor,
        )),
        SizedBox(height: 10,),
        Divider(height: 1,color: AppColors.grayTextColor,),
        SizedBox(height: 10,),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: ListView.separated(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return _itinearyListControl(itineraryDayWise,index);
                }, separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white,), itemCount: 2,

              ),

            ),
          ],
        ),
        SizedBox(height: 20,),
        Center(
          child: Text(
              "View more", style: AppStyle.instance.bodySemi.copyWith(
            color: AppColors.appbarlinearColor,
          )),
        ),

      ],
    ),

  );

  Widget _pricingControl() => Container(
    width: double.infinity,

    margin: EdgeInsets.all(10),

    padding: EdgeInsets.all(10),
    decoration: new BoxDecoration(
      color:Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),

    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Pricing", style: AppStyle.instance.bodySmallBold.copyWith(
          color: AppColors.blackColor,
        )),
        SizedBox(height: 10,),
        Divider(height: 1,color: AppColors.grayTextColor,),
        SizedBox(height: 10,),
        Text(
            "Select Occupancy", style: AppStyle.instance.bodySemi.copyWith(
          color: AppColors.blackColor,
        )),
        SizedBox(height: 10,),
        _pricingSegmentedControl(),
        SizedBox(height: 10,),
        pricingSegmentedControlValue==0?Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: ListView.separated(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return _pricingListControl();
                }, separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white,), itemCount: 2,

              ),

            ),
          ],
        ):pricingSegmentedControlValue==1?Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(

              child: ListView.separated(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return _pricingListControl();
                }, separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white,), itemCount: 2,
              ),
            ),
          ],
        ):pricingSegmentedControlValue==2?Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: ListView.separated(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return _pricingListControl();
                }, separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white,), itemCount: 2,

              ),

            ),
          ],
        ):Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: ListView.separated(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return _pricingListControl();
                }, separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white,), itemCount: 2,

              ),

            ),
          ],
        ),
        SizedBox(height: 10,),

      ],
    ),

  );

  Widget _itinearyListControl(List<ItineraryDayWise>?  itineraryDayWise,int index) => Column(
     children: [
       Row(
         children: [
           Container(
             decoration: new BoxDecoration(
               color:AppColors.grayColor,
               borderRadius: BorderRadius.all(Radius.circular(7)),

             ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                       itineraryDayWise![index].dayNumber.toString()+"st", style: AppStyle.instance.bodySemi.copyWith(
                     color: AppColors.blackColor,
                   )),Text(
                       "day", style: AppStyle.instance.bodyMedium.copyWith(
                     color: AppColors.blackColor,
                   )),
                 ],),
             ),
           ),
           SizedBox(width: 10,),
           Expanded(
             child: Text(itineraryDayWise![index].heading.toString(),style: AppStyle.instance.bodySemi.copyWith(
               color: AppColors.blackColor,
             )),
           ),
         ],
       ),
       SizedBox(height: 1,),
       Html(data: itineraryDayWise![index].description.toString()),
       itineraryDayWise[index].itineraryDayWiseImages!.isNotEmpty?Container(
         height: 60,
         child: ListView.separated(
           scrollDirection: Axis.horizontal,
           shrinkWrap: true,
           physics: ScrollPhysics(),
           itemBuilder: (BuildContext context, int indexI) {
             return _itinearyImageListControl(itineraryDayWise[index].itineraryDayWiseImages,indexI);
           }, separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white,), itemCount: 2,

         ),

       ):Container(),
     ],
  );
  Widget _itinearyImageListControl(List<ItineraryDayWiseImages>?  itineraryDayWiseImages,int index) => Container(
      height: 60,
      width: 55,
      decoration: new BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            // filterQuality: FilterQuality.low,
              fit: BoxFit.cover,
              image:
              NetworkImage(Imagepath.categryPath.description + "packages/images/itineraries/Parashar_Lake_-_JustWravel_(49)-5-JustWravel.JPG"
              ))
      )

  );

  //Controller
  Widget _pricingSegmentedControl() => Container(
    width: double.infinity,
    height: 45,
    child: CupertinoSegmentedControl<int>(
      selectedColor: Colors.blue,
      borderColor: AppColors.whiteColor,
      unselectedColor: AppColors.whiteColor,
      children: {
        0:Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Double')),
        // 0: Text('Itinerary'),
        1: Padding(
            padding: EdgeInsets.all(12.0),
            child:  Text('Triple')),

        2: Padding(
            padding: EdgeInsets.all(12.0),
            child:  Text('Quad')),
      },
      onValueChanged: (int val) {
        setState(() {
          pricingSegmentedControlValue = val;

        });
      },
      groupValue: pricingSegmentedControlValue,
    ),

  );


  Widget _pricingListControl() => Padding(
    padding: const EdgeInsets.only(left: 5,right: 5,top: 2,bottom: 2),
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: new BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Own Bike", style: AppStyle.instance.bodyVerySmallBold.copyWith(
            color: AppColors.blackColor,
          )),
          SizedBox(height: 10,),
          Divider(height: 1,color: AppColors.grayTextColor,),
          SizedBox(height: 10,),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(


                child: ListView.separated(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return _pricingSubListControl();
                  }, separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white,), itemCount: 2,

                ),

              ),
            ],
          ),
        ],
      ),
    ),
  );
  Widget _pricingSubListControl() => Container(
    padding: EdgeInsets.all(1),
    decoration: new BoxDecoration(
      color:Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Solo Rider", style: AppStyle.instance.bodyVerySmall.copyWith(
          color: AppColors.blackColor,
        )),
        Spacer(),
        Text(
            "₹ 5,000", style: AppStyle.instance.bodyVerySmall.copyWith(
          color: AppColors.blackColor,
        )),

      ],
    ),
  );

  Widget _batchesControl() => Container(
    width: double.infinity,

    margin: EdgeInsets.all(10),

    padding: EdgeInsets.all(10),
    decoration: new BoxDecoration(
      color:Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),

    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Batches", style: AppStyle.instance.bodySmallBold.copyWith(
          color: AppColors.blackColor,
        )),
        SizedBox(height: 10,),
        Divider(height: 1,color: AppColors.grayTextColor,),
        SizedBox(height: 10,),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(


              child: ListView.separated(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return _batchesListControl();
                }, separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white,), itemCount: 3,

              ),

            ),
          ],
        ),
        SizedBox(height: 10,),


      ],
    ),

  );

  Widget _batchesListControl() => Padding(
    padding: const EdgeInsets.only(left: 5,right: 5,top: 2,bottom: 2),
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: new BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "10-Sep To 30-Sep", style: AppStyle.instance.bodySemi.copyWith(
                color: AppColors.blackColor,
              )),
              LinearPercentIndicator(
                width: 110.0,
                lineHeight: 20.0,
                percent: 0.8,
                animation: true,
                linearStrokeCap: LinearStrokeCap.roundAll,
                barRadius: Radius.circular(10),
                center: Text("only 5 left",style: AppStyle.instance.bodyLight10.copyWith(
                  color: AppColors.whiteColor,
                )),
                backgroundColor: AppColors.lightOrangeGroundColor,
                progressColor: AppColors.musturedGroundColor,
              ),
              Image(image: AssetImage("assets/images/up_icon.png"),width: 20,height: 20,)
            ],
          ),
          SizedBox(height: 10,),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(

                child: ListView.separated(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return _batchesSubListControl();
                  }, separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white,), itemCount: 2,

                ),

              ),
            ],
          ),
        ],
      ),
    ),
  );
  Widget _batchesSubListControl() => Container(
    padding: EdgeInsets.all(10),
    decoration: new BoxDecoration(
      border: Border.all(
          color: Colors.grey,
          width: 1.0,
          style: BorderStyle.solid
      ),
      color:Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                "Start Point : Delhi", style: AppStyle.instance.bodyTooSemi.copyWith(
              color: AppColors.blackColor,
            )),
            SizedBox(height: 5,),
            Text(
                "12Aug, 2023 (7:00 PM)", style: AppStyle.instance.bodyLight.copyWith(
              color: AppColors.blackColor,
            )),
          ],
        ),
        Image(image: AssetImage("assets/images/right_arrow.png"),width: 30,height: 20,),
        Column(
          children: [
            Text(
                "End Point : Delhi", style: AppStyle.instance.bodyTooSemi.copyWith(
              color: AppColors.blackColor,
            )),
            SizedBox(height: 5,),
            Text(
                "12Aug, 2023 (7:00 PM)", style: AppStyle.instance.bodyLight.copyWith(
              color: AppColors.blackColor,
            )),
          ],
        ),



      ],
    ),
  );

  Widget _InclusionsSegmentedControl() => Container(
    width: 500,
    child: CupertinoSegmentedControl<int>(
      selectedColor: Colors.blue,
      borderColor: Colors.white,
      children: {
        0:Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Inclusions & Exclusions',style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500
            ),)),
        // 0: Text('Itinerary'),
        1: Padding(
            padding: EdgeInsets.all(12.0),
            child:  Text('Cancellation Policy',style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500
            ))),
      },
      onValueChanged: (int val) {
        setState(() {
          inclusionsSegmentedControlValue = val;

        });
      },
      groupValue: inclusionsSegmentedControlValue,
    ),

  );

  Widget _inclusionControl() => Container(
    width: double.infinity,

    margin: EdgeInsets.all(10),

    padding: EdgeInsets.all(10),
    decoration: new BoxDecoration(
      color:Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),

    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedInclusionTab="Inclusion";

                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 10,top: 10),
                width: 120,
                alignment: AlignmentDirectional.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Inclusion", style: AppStyle.instance.bodyNormal.copyWith(
                        color: selectedInclusionTab=="Inclusion"?AppColors.appbarlinearColor:AppColors.grayColor)),
                    SizedBox(height: 10,),
                    selectedInclusionTab=="Inclusion"?Divider(height: 2,color: selectedInclusionTab=="Inclusion"?AppColors.appbarlinearColor:AppColors.grayColor):Container()
                  ],
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedInclusionTab="Excusions";

                });

              },
              child: Container(
                margin: EdgeInsets.only(right: 10,top: 10),
                width: 120,
                alignment: AlignmentDirectional.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Excusions", style: AppStyle.instance.bodyNormal.copyWith(
                        color: selectedInclusionTab=="Excusions"?AppColors.appbarlinearColor:AppColors.grayColor)),
                    SizedBox(height: 10,),
                    selectedInclusionTab=="Excusions"?Divider(height: 2,color: selectedInclusionTab=="Excusions"?AppColors.appbarlinearColor:AppColors.grayColor):Container(),


                  ],
                ),
              ),
            ),

          ],),
        SizedBox(height: 10,),
        Divider(height: 1,color: AppColors.grayColor,),
        // (height,width ,value)
        SizedBox(height: 20,),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(

              child: ListView.separated(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return _inclusionsListControl();
                }, separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white,), itemCount: 6,

              ),

            ),
          ],
        ),


      ],
    ),

  );

  Widget _inclusionsListControl() => Container(
    padding: EdgeInsets.only(left: 10,right: 10,top: 5),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage("assets/images/green_arrow.png"),width: 20,height: 20,),
            SizedBox(width: 5),
            Expanded(
              child: Text(
                  maxLines: 5,
                  "Transportation in Tempo Traveller from Manali to Manali", style: AppStyle.instance.bodyTooSemi.copyWith(
                color: AppColors.blackColor,
              )),
            ),
          ],
        ),
      ],
    ),
  );

  Widget _cancellationControl() => Container(
    width: double.infinity,

    margin: EdgeInsets.all(10),

    padding: EdgeInsets.all(10),
    decoration: new BoxDecoration(
      color:Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),

    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Cancellation Policy", style: AppStyle.instance.bodySmallBold.copyWith(
          color: AppColors.blackColor,
        )),
        SizedBox(height: 10,),
        Divider(height: 1,color: AppColors.grayTextColor,),
        SizedBox(height: 10,),


        Center(
          child: Text(
              "Coming Soon", style: AppStyle.instance.bodySemi.copyWith(
            color: AppColors.appbarlinearColor,
          )),
        ),

      ],
    ),

  );



  Widget _thinkssegmentedControl() => Container(
    width: 400,
    height: 50,
    child: CupertinoSegmentedControl<int>(
      selectedColor: Colors.blue,
      borderColor: Colors.white,
      children: {
        0:Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Things To Pack')),
        // 0: Text('Itinerary'),
        1: Padding(
            padding: EdgeInsets.all(12.0),
            child:  Text('Things To Know')),
      },
      onValueChanged: (int val) {
        setState(() {
          thinknowsegmentedValue = val;
        });
      },
      groupValue: thinknowsegmentedValue,
    ),

  );

}




Widget ThinkknowView(List<ThingsToPack> thinktopack) {
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10),

              padding: EdgeInsets.all(10),
              decoration: new BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),

              ),
              child: ListView.builder(

                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: thinktopack.length,
                  itemBuilder: (context, index) =>
                      Container(

                          child: Row(

                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.all(10),
                                  child:
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                        "assets/images/thinknow.png",
                                        width: 80.0,
                                        height: 100.0,
                                        fit: BoxFit.cover),
                                  )),

                              Expanded(child:
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(thinktopack[index].title ?? "",
                                      style: AppStyle.instance.bodySemi
                                          .copyWith(
                                        color: AppColors.blackColor,
                                      )),
                                  //SizedBox(height: 10),
                                  ReadMoreText(
                                    thinktopack[index].description ?? "",
                                    trimLines: 2,
                                    colorClickableText: Colors.blue,
                                    trimCollapsedText: '--Read More',
                                    trimExpandedText: 'show',
                                    moreStyle: TextStyle(fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )

                                ],


                              ))


                            ],
                          )
                      )),
            ),
          ])

  );
}



Widget ThinkknowPackageView() {
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10),

              padding: EdgeInsets.all(10),
              decoration: new BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),

              ),
              child: ListView.builder(

                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) =>
                      Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Row(
                                  children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.all(10),
                                        child:
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: Image.asset(
                                              "assets/images/Icon.png", width: 38.0,
                                              height: 38.0,
                                              fit: BoxFit.cover),
                                        )),

                                    Expanded(child:
                                    Text("Floaters or Sandals:",
                                        style: AppStyle.instance.bodySemi
                                            .copyWith(
                                          color: AppColors.blackColor,
                                        )),
                                      //SizedBox(height: 10),
                                    ),
                                  ],
                                ),
                                Text("When you are on a local sightseeing tour, you are required to carry only a few necessary items and for that, you need a day backpack as you will leave your bigger one at your designated stay.")
                              ])
                      )),
            ),
          ])

  );
}
class SimilarPackageListView extends StatefulWidget {
  const SimilarPackageListView({ super.key});
  @override
  State<SimilarPackageListView> createState() => _PopularListViewState();
}

class _PopularListViewState extends State<SimilarPackageListView> {
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

                            Text("Similar Packages", textAlign: TextAlign.center, style: AppStyle.instance.bodySmallBold.copyWith(
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








