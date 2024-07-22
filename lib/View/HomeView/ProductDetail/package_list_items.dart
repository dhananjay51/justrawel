
import 'package:flutter/material.dart';
import 'package:justwravel/View/HomeView/ProductDetail/package_list_view.dart';
import '../../../res/style/text_style.dart';
import 'package:justwravel/res/constant/string_constant.dart';
import '../../../res/color.dart';

class PackageItemslist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  Container(
      // color: Colors.white,

        height:90,
        child:
        HorizontalList()

    );
  }
}
class HorizontalList extends StatelessWidget {
  final List<ListItem> items = [
    ListItem(
      imageUrl: 'https://via.placeholder.com/150',
      text: 'Delhi to Delhi',
    ),
    ListItem(
      imageUrl: 'https://via.placeholder.com/150',
      text: '11 Days',
    ),
    ListItem(
      imageUrl: 'https://via.placeholder.com/150',
      text: 'Jun To Sep',
    ),
    ListItem(
      imageUrl: 'https://via.placeholder.com/150',
      text: '11 Days',
    ),
    ListItem(
      imageUrl: 'https://via.placeholder.com/150',
      text: '11 Days',
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {

        return   Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                // color: Colors.white,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(

                    children: <Widget>[
                      Container(
                          width: 9.0,
                          height: 13.0,
                          alignment: Alignment.center,

                          decoration: new BoxDecoration(


                            image: DecorationImage(
                              image: AssetImage('assets/images/location.png'),

                              fit: BoxFit.fill,

                            ),
                          )),
                      // Image.asset('assets/images/1.png'),

                      Text(
                        items[index].text,
                        style: TextStyle(fontSize: 14.0),
                      )
                    ]),
              )


            ],
          ),
        );

      },
    );
  }
}

class Reviewitemslist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  Container(
      //color: Colors.red,
      // margin: EdgeInsets.all(16.0),
      // height:40,
        child:
        ReviewlistHorizontalList()

    );
  }
}


class ReviewlistHorizontalList extends StatelessWidget {
  final List<ReviewList> items = [
    ReviewList(

        text: 'Organic Meals',
        ratingValue: 'Meals',
        image: 'assets/images/image.png'
    ),
    ReviewList(

        text: 'Hotels',
        ratingValue: 'Stay',
        image: 'assets/images/mage2.png'
    ),
    ReviewList(

        text: 'Best Modes of Travel',
        ratingValue: 'Travel',
        image: 'assets/images/image3.png'
    ),
    ReviewList(

        text: 'Experience',
        ratingValue: '7 Years+',
        image: 'assets/images/image3.png'
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return  Row(

        children: <Widget>[
          Expanded(
              child: SizedBox(
                  height: 74.0,

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {

                      return Container (

                          margin: EdgeInsets.all(10),

                          padding: EdgeInsets.all(10),
                          decoration: new BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),

                          ),

                          child:  Row(
                            // mainAxisAlignment: MainAxisAlignment.s,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children:<Widget> [

                                Container(

                                    width: 20.0,
                                    height: 20.0,
                                    alignment: Alignment.center,
                                    decoration: new BoxDecoration(
                                      color:Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                          image: AssetImage('assets/images/review.png'),
                                          fit: BoxFit.fill
                                      ),
                                    )),

                                Padding(
                                  padding: const EdgeInsets.only(left:8),

                                  child:  Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                      //mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[

                                        Text(
                                            items[index].ratingValue, style: AppStyle.instance.bodyMedium.copyWith(
                                          color: AppColors.blackColor,
                                        )),
                                        Text(items[index].text, style: AppStyle.instance.bodyMedium.copyWith(
                                          color: AppColors.blackColor,
                                        ))
                                      ]),


                                )]));



                      //);

                    },
                  )))]);
  }
}


class ListItem {
  final String imageUrl;
  final String text;

  ListItem({required this.imageUrl, required this.text});
}
class ListMonth {

  final String text;

  ListMonth({required this.text});
}

class ReviewList {

  final String text;
  final String ratingValue;
  final String image;

  ReviewList({required this.text, required this.ratingValue, required this.image});
}
