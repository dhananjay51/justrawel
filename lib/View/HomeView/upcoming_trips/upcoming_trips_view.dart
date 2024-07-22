import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justwravel/View/HomeView/upcoming_trips/upcoming_trips_item.dart';
import 'package:provider/provider.dart';
import '../../../../data/response/api_status.dart';
import '../../../../viewmodel/HomeViewModel.dart';
import '../best_seller/best_seller_item.dart';
import 'package:justwravel/res/components/round_button.dart';
import 'package:justwravel/View/HomeView/ProductDetail/package_list_view.dart';
import 'package:justwravel/data/network/AppUrl.dart';



class UpcomingTripsView extends StatefulWidget {
  const UpcomingTripsView({super.key});

  @override
  State<UpcomingTripsView> createState() => _PopularListViewState();
}

class _PopularListViewState extends State<UpcomingTripsView> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  bool isSelect = true;
  bool isnternationSelect = false;

  @override
  void initState() {

   homeViewViewModel.fetchUpcomingTripsApi("false");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        /// Categories(),

        ChangeNotifierProvider<HomeViewViewModel>(
            create: (BuildContext context) => homeViewViewModel,
            child: Consumer<HomeViewViewModel>(builder: (context, value, _) {
              switch (value.upComingTripsList.apiStatus) {
                case ApiStatus.LOADING:
                  return SizedBox(
                    height: height,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                case ApiStatus.ERROR:
                  return Text(value.upComingTripsList.toString());
                  case ApiStatus.COMPLETED:
                  return   Column(children: [

                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          TextButton(
                              onPressed: () {

                                setState(() {
                                  isnternationSelect = false;
                                  if (isSelect == true) {

                                     isSelect = false;

                                  }
                                  else {
                                     homeViewViewModel.fetchUpcomingTripsApi("false");
                                    isSelect = true;

                                  }
                                });
                              },
                              child: Text('Upcoming Trips', style: TextStyle(color: Colors.black, fontSize:  isSelect == true ? 18 : 14, fontWeight:  isSelect == true ? FontWeight.bold:FontWeight.normal))),

                          TextButton(
                              onPressed: () {

                                setState(() {
                                  //if
                                  isSelect = false;
                                  if (isnternationSelect == true) {
                                    isnternationSelect = false;

                                  }
                                  else {
                                    isnternationSelect = true;
                                    homeViewViewModel.fetchUpcomingTripsApi("true");

                                   }

                                });

                              },
                              child: Text('International', style: TextStyle(color: Colors.black, fontSize:  isnternationSelect == true ? 18 : 14, fontWeight:  isnternationSelect == true ? FontWeight.bold:FontWeight.normal))),

                          ],
                      ),
                    ),


                     upComingTripsList(height, value),
              ]);
                default:
                  return const Text("Best seller default");
              }
            })),
        CustomButton(text: "ViewAll", onPressed: () {
          _navigateToNextScreen(context);

        }), ],
    );
  }
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PackageList(url: AppUrl.viewallPackageUpComing, packageType: AppUrl.upcomingtrips)));
  }

  Widget upComingTripsList(double height, HomeViewViewModel value) {
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
                    (MediaQuery.of(context).size.height /1.75)

            ),
            itemCount: value.upComingTripsList.data?.dataResult?.data?.length,
            itemBuilder: (BuildContext context, int index){return   UpComingTripsItem(dataItem: value.upComingTripsList.data!.dataResult!.data![index]);
            }));
  }
}
class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Aug", "Sep", "Oct", "Nov", "Dec", "Jan", "Feb"];
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            shrinkWrap: true,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }
  Widget buildCategory(int index) {
    return GestureDetector(
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
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);
const kDefaultPaddin = 20.0;
