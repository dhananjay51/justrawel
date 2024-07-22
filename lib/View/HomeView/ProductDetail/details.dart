
import 'package:flutter/material.dart';
import '../../../res/style/text_style.dart';
import 'package:justwravel/res/constant/string_constant.dart';
import '../../../res/color.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:justwravel/models/package_detail_lists_models.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Detaillist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  Container(
      color: Colors.white,
        //padding: EdgeInsets.only(top: 10),

        height:65,
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

          Card(
          child: Container(
             // height: 60,
             // padding: EdgeInsets.all(10.0),

            /*
         constraints: BoxConstraints(
          minWidth: 100.0,
          maxWidth: 300.0, // Set a maximum width to prevent the card from becoming too wide
        ),
        */


         child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          /*
          Image.network(
            items[index].imageUrl,
            width: 25,
            height: 25,
            //fit: BoxFit.fitWidth,
          ),


           */
         Container(
             width: 120.0,
             height: 50.0,
             alignment: Alignment.center,
             decoration: new BoxDecoration(

               image: DecorationImage(
                   image: AssetImage('assets/images/1.png'),
                   fit: BoxFit.fill
               ),
             )),
         // Image.asset('assets/images/1.png'),
          /*
          Text(
            items[index].text,
            style: TextStyle(fontSize: 14.0),
          ),
         // SizedBox(height: 8.0),

         Text(
            items[index].text,
          style: TextStyle(fontSize: 14.0),
        ),

           */
      ]),
        )
          )],
          ),
        );

      },
    );
  }
}

class Reviewlist extends StatelessWidget {
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

      text: 'Reviews',
        ratingValue: '2500+',
      image: 'assets/images/image.png'
    ),
    ReviewList(

        text: 'Wravelers',
        ratingValue: '50,000+',
        image: 'assets/images/mage2.png'
    ),
    ReviewList(

      text: 'Reviews',
        ratingValue: '2500+',
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
       // crossAxisAlignment: CrossAxisAlignment.start,
       // mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
     Expanded(
   child: SizedBox(

       height: 70.0,

     child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {

          return Container (
              color: Colors.white,
               padding: EdgeInsets.all(10),
             // margin: EdgeInsets.only(left: 16, right:16),
          child:  Row(
                 // mainAxisAlignment: MainAxisAlignment.s,
             // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget> [

                    Container(
                        width: 20.0,
                        height: 20.0,
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(

                          image: DecorationImage(
                              image: AssetImage('assets/images/review.png'),
                              fit: BoxFit.fill
                          ),
                        )),

              Padding(
                  padding: const EdgeInsets.only(left:8),

               child:  Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                     //crossAxisAlignment: CrossAxisAlignment.start,
                       //mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[

                          Text(
                              items[index].ratingValue, style: AppStyle.instance.bodySmallBold.copyWith(
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

class Triplist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  Container(

       height:40,
        child:
        TripHorizontalList()

    );
  }
}


class TripHorizontalList extends StatelessWidget {
  final List<ListMonth> items = [
    ListMonth(

      text: 'Easy to Mordrate',
    ),
    ListMonth(

      text: 'Bike Trip',
    ),
    ListMonth(

      text: 'Best Seller',
    ),
    ListMonth(

      text: 'Best Seller',
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

            child:  Container(

              margin: const EdgeInsets.all(5),
              padding: EdgeInsets.all(5.0),
              height: 35,
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(15),
                color: Colors.blue.withOpacity(0.3),

              ),

              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    Text(
                      items[index].text),
                  ]),
            )

        ); },
    );
  }
 }

class Monthlist extends StatelessWidget {
  final List<Batches>  dateList ;
    Monthlist({
    super.key,
      required this.dateList,
  });
  @override
  Widget build(BuildContext context) {
    return  Container(

        height:60,
        child:
        MonthHorizontalList(items: dateList)

    );
  }
}
class MonthHorizontalList extends StatelessWidget {

  final List<Batches>  items ;
  MonthHorizontalList({
    super.key,
    required this.items,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {

        return   Center(
            child:  Container(
                    //  height: 60,
                     margin: const EdgeInsets.all(5),
                    padding: EdgeInsets.all(6.0),
                     height: 35,
                   decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)
                  ),

                    child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(convertdate(items[index].lastdate  ?? ""),

                          ),
                        ]),
                  )

          ); },
    );
  }
  String convertdate(String date) {

    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat.LLL().format(dateTime);
    return formattedDate;
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

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<AboutScreen> {

  final PageController  _pageController = PageController();
  int _activePage = 0;

  void onNextPage(){
    if(_activePage  < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,);
    }
  }

  final List<Map<String, dynamic>> _pages = [
    {
      'color': '#ffe24e',
      'title': 'Hmmm, Healthy food',
      'image': 'https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80',
      'description': "A variety of foods made by the best chef. Ingredients are easy to find, all delicious flavors can only be found at cookbunda",
      'skip': true
    },
    {
      'color': '#a3e4f1',
      'title': 'Fresh Drinks, Stay Fresh',
      'image': 'https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80',
      'description': 'Not all food, we provide clear healthy drink options for you. Fresh taste always accompanies you',
      'skip': true
    },
    {
      'color': '#31b77a',
      'title': 'Let\'s Cooking',
      'image': 'https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80',
      'description': 'Are you ready to make a dish for your friends or family? create an account and cooks',
      'skip': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 96,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  //color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),


                  )
              ),
              child:
             PageView.builder(
                      controller: _pageController,
                      //shrinkWrap: true,
                       physics: ScrollPhysics(),
                      itemCount: _pages.length,
                      onPageChanged: (int page) {
                        setState(() {
                          _activePage = page;
                        });
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return AboutWidget(
                           image: 'Hello',
                           desc: 'My first bike trip and made it . Ladakh Biking & Backpacing Trip. i will try again this trip.My first bike trip and made it . Ladakh Biking & Backpacing Trip. i will try again this trip',
                            rating: '5'

                        );
                      }
                   ),

                ),

                      Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: List.generate(
                           _pages.length,
                               (index) {
                             return Container(
                               margin: EdgeInsets.only(right: 5),
                               alignment: Alignment.center,
                               height: 9,
                               width: 9,
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: _activePage == index
                                     ? Colors.black
                                     : Colors.black26,
                               ),
                             );
                           },
                         ),
                       )


              ]);
        }
}
class AboutWidget extends StatelessWidget {
  final String image;
  final String desc;
  final String rating;
  const AboutWidget({
    super.key,
    required this.image,
    required this.desc,
    required  this.rating
  });
  @override
  Widget build(BuildContext context) {
     return  Padding(
            padding: EdgeInsets.all(10),

            child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Row(
                 //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                  
                children: <Widget>[
                    Column( children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                     // alignment: Alignment.,
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/user.png'),
                            fit: BoxFit.fill
                        ),
                      )),
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: <Widget>[
                            RatingBarIndicator(
                              rating: 5,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 1,
                              itemSize: 20.0,
                              direction: Axis.horizontal,
                            ),
                            Text("5")
                          ])
                      
                  ]),

                  //Text(desc),

                   Flexible(child:
                   Padding(
                       padding: EdgeInsets.only(left:8),
                  child: Text(desc,  style: AppStyle.instance.bodyVerySmall.copyWith(
                    color: AppColors.blackColor,
                  )))


                   )],

                 ),


            ]));
        }
}

class Menulist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  Container(
      //color: Colors.red,
      // margin: EdgeInsets.all(16.0),
        height:40,
        child:
        MenuHorizontalList()

    );
  }
}


class MenuHorizontalList extends StatelessWidget {
  final List<ListMonth> items = [
    ListMonth(

      text: 'Easy to Mordrate',
    ),
    ListMonth(

      text: 'Bike Trip',
    ),
    ListMonth(

      text: 'Best Seller',
    ),
    ListMonth(

      text: 'Best Seller',
    ),

  ];

  @override

  Widget build(BuildContext context) {

        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

     ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return   Center(
            child:  Container(
              //  height: 60,
              margin: const EdgeInsets.all(5),
              padding: EdgeInsets.all(5.0),
              height: 35,

              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.blueAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
                // color: Colors.blue.withOpacity(0.3),


              ),

              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    Container(
                        width: 20.0,
                        height: 20.0,
                        // alignment: Alignment.,
                        decoration: new BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/soup.png'),
                              fit: BoxFit.fill
                          ),
                        )),



                  ]),
            )

        ); },
    ),
          Container(


           // margin: const EdgeInsets.all(10),
            padding: EdgeInsets.all(5.0),
            height: 35,

            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.blueAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
              // color: Colors.blue.withOpacity(0.3),

            ), child: Row (

       children: [

         Text("View Details"),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
       child:  Image.asset('assets/images//arrowdirection.png',
               height: 15,
                width: 10,
             //fit: BoxFit.fill
          ),

              )],
    )
          

          )]);
  }
}

class Touriustlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  Container(

        height:150,
       // width: 100,
        child:
        VerticalList()

    );
  }
}

class VerticalList extends StatelessWidget {
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
    )

  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return   Container(
            width: 120,
           margin: EdgeInsets.all(10),
            //color:  Colors.white,
             padding: EdgeInsets.all(5),
          decoration: BoxDecoration(

                color: Colors.white,

              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
           // mainAxisAlignment: MainAxisAlignment.center,
           child: Column(

               children: <Widget>[

                  Image.asset('assets/images//calendor.png',
                   height: 50,
                   width: 50,
                   //fit: BoxFit.fill
                 ),
                 Text("Calendar"),

            Container(


            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            height: 30,


        decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15),
        // color: Colors.blue.withOpacity(0.3),


        ),

                child:  Text("Download")


                )]),

        );

      },
    );
  }
}


