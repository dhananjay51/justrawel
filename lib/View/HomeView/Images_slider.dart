import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../viewmodel/HomeViewModel.dart';
import 'package:provider/provider.dart';
import '../../../../data/response/api_status.dart';
import '../../../../viewmodel/HomeViewModel.dart';
import 'package:justwravel/models/video_model.dart';
import 'package:justwravel/data/network/AppUrl.dart';
import 'package:justwravel/View/HomeView/ProductDetail/video_player_view.dart';
class  MemoriesSlider extends StatefulWidget {
  @override
  _MemoriesState createState() => _MemoriesState();
}
class _MemoriesState extends State<MemoriesSlider> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    homeViewViewModel.fetchVedioApi();
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
                switch (value.getVideoList.apiStatus) {
                  case ApiStatus.LOADING:
                    return SizedBox(
                      height: height,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  case ApiStatus.ERROR:
                    return Text(value.bestSellerList.toString());
                  case ApiStatus.COMPLETED:


                return new Stack(
                children: <Widget>[
                // The containers in the background
                new Column(
                children: <Widget>[


                          Container(
                              margin: EdgeInsets.all(15),

                              child: CarouselSlider.builder(
                                itemCount: value.getVideoList.data?.data?.videos?.length,
                                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>

                                    Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              // borderRadius: BorderRadius.only(
                                              // topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(getCategoryList(value.getVideoList.data!.data!.packages![itemIndex].bannerImage!) ),
                                              ),
                                             ),


                                          ),

                                options: CarouselOptions(
                                  height: 200,
                                  aspectRatio: 16/9,
                                  viewportFraction: 0.8,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 3),
                                  //autoPlayAnimationDuration: Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.3,
                                  //  onPageChanged: callbackFunction,
                                  scrollDirection: Axis.horizontal,
                                ),


                          )

                          ),

                     ]
                      ),
                ]);
                  default:
                    return const Text("Best seller default");
                }
              })
          ),
        ]
    );

  }
  String getCategoryList(List<BannerImage> inputlist) {

     var imgPath ;

      for (var item in inputlist)  {

       if(item.mainBannerType == "video-support") {

        imgPath =  Imagepath.VideoImgpath.description + item.image!;

        }
    }
    return imgPath;
  }
}