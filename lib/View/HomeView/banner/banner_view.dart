import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:justwravel/View/HomeView/banner/banner_item.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {


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
      'image': 'https://storage.googleapis.com/storage.justwravel.com/common/ads-banner/summer-sale-ads-banner-mobile.webp?v=1?v=1',
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
      'image': 'https://storage.googleapis.com/storage.justwravel.com/common/ads-banner/summer-sale-ads-banner-mobile.webp?v=1?v=1',
      'description': 'Are you ready to make a dish for your friends or family? create an account and cooks',
      'skip': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return  Container(
     // margin: EdgeInsets.all(10),
       height: 240,

        child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Expanded( child:
             Stack (
               alignment: Alignment.center,
               children: [

          PageView.builder(

              controller: _pageController,
              //shrinkWrap: true,
             // physics: ScrollPhysics(),
              itemCount: _pages.length,
              onPageChanged: (int page) {
                setState(() {
                  _activePage = page;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return IntroWidget(
                  image: _pages[index]["image"],

                );
              }
          ),
               Positioned(
                   bottom: 10,
                  // top:  20,
                   child:  Row(
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
                                 ? Colors.white
                                 : Colors.white54,
                           ),
                         );
                       },
                     ),
                   )
               )

      ],))
        ]
        )
    );
  }
}