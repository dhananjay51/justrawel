import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../viewmodel/HomeViewModel.dart';
import 'package:provider/provider.dart';
import '../../../../data/response/api_status.dart';
import '../../../../viewmodel/HomeViewModel.dart';
import 'package:justwravel/models/video_model.dart';
import 'package:justwravel/data/network/AppUrl.dart';
import 'package:justwravel/View/HomeView/ProductDetail/video_player_view.dart';

class  Memories extends StatefulWidget {
  final  String sendType;
  const Memories({
    super.key,
    required this.sendType,

  });
  @override

  _MemoriesState createState() => _MemoriesState();
}
class _MemoriesState extends State<Memories> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
     if (widget.sendType == "")
    {
      homeViewViewModel.fetchVedioApi();
    }
     else {

     }

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
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [

    Container(
    margin: EdgeInsets.all(15),

    child: CarouselSlider.builder(
    itemCount: value.getVideoList.data?.data?.videos?.length,
    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
    GestureDetector(
    onTap: () {
    setState(() {
      print(value.getVideoList.data!.data!.videos![itemIndex]);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoPlayer(id: value.getVideoList.data!.data!.videos![itemIndex])));

      //selectedIndex = index;
    });
    },
   child: Container(
    child: Container(
      alignment: Alignment.center,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    // borderRadius: BorderRadius.only(
    // topLeft: Radius.circular(10), topRight: Radius.circular(10)),
    image: DecorationImage(
    fit: BoxFit.cover,
    image: NetworkImage(getCategoryList(value.getVideoList.data!.data!.videos![itemIndex]) ),
    ),
    ),
    child: Icon(
    Icons.play_circle_fill_rounded,
    color: Colors.white,
    ),
    ),

   )),
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
    )]);
    default:
    return const Text("Best seller default");
    }
    })
    ),
        ]
    );
    }
  String getCategoryList(String inputlist) {
    return "https://img.youtube.com/vi_webp/" + inputlist + "/maxresdefault.webp";
  }
}