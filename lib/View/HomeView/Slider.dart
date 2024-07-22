import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class  SliderImg extends StatefulWidget {
  @override
  _SliderImgState createState() => _SliderImgState();
}

class _SliderImgState extends State<SliderImg> {
  @override
  final controller = PageController(viewportFraction: .788);

  Widget build(BuildContext context) {
    return   Container(
        margin: EdgeInsets.all(15),

        child:  SmoothPageIndicator(
          controller: controller,
          count: 6,
          effect: SlideEffect(
              spacing: 4.0,
              radius: 6.0,
              dotWidth: 14.0,
              dotHeight: 5.0,
              paintStyle: PaintingStyle.stroke,
              strokeWidth: 1.5,
              dotColor: Colors.grey,
              activeDotColor: Colors.indigo
          ),
        )
    );
         /*

        CarouselSlider.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
              Container(
                child: new Container(

                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // borderRadius: BorderRadius.only(
                    // topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://storage.googleapis.com/storage.justwravel.com/package/images/banner/category_mobile/cropped/JustWravel-1706882599-Deoriatal-Chandrashila-6.jpg"),
                    ),
                  ),
                ),
              ), options: CarouselOptions(
          height: 200,
          aspectRatio: 16/9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          //  onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ),

          */
       // )
      /*
        child:  (
          shrinkWrap: true,
          physics:  NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) => new Container(

            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // borderRadius: BorderRadius.only(
              // topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://storage.googleapis.com/storage.justwravel.com/package/images/banner/category_mobile/cropped/JustWravel-1706882599-Deoriatal-Chandrashila-6.jpg"),
              ),
            ),
          ),
          staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2.6 : 2.2),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        )

       */
    //);


  }
}