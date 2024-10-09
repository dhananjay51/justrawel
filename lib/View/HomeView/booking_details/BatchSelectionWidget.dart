import 'package:bottom_sheet_bar/bottom_sheet_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/package_details_model.dart';
import '../../../res/color.dart';
import '../../../res/style/text_style.dart';
import 'package:justwravel/View/onboard/LoginScreen.dart';


class BatchSelectionWidget extends StatefulWidget {
  final PackageDetailDataResult packageDetail;
  const BatchSelectionWidget({ super.key,
    required this.packageDetail
  });
  @override
  _BatchSelectionWidgetState createState() => _BatchSelectionWidgetState();
}

class _BatchSelectionWidgetState extends State<BatchSelectionWidget> {
  int selectedBatchIndex = 0;
  bool _isLocked = false;
  bool _isCollapsed = true;
  bool _isExpanded = false;
  int _listSize = 1;
  final _bsbController = BottomSheetBarController();
  List<Batches>?  batch_list = [] ;
  List<String> nextSixMonths = [] ;
  int selectedIndex = 0;
  List<Batches> filteredBatches = [];
  List<String> numbers = [];
  int selectedOption = 0; // 0 for "Double", 1 for "Triple"
  List<Prices>?  priceoccupancyType = [] ;
  List<Map<String, dynamic>> finalList = [];
  int updatePrice = 0;
  int updatePriceQty = 0;
  @override
  void initState() {
    _bsbController.addListener(_onBsbChanged);
    batch_list=widget.packageDetail.batches;
    nextSixMonths = filterUniqueMonths();
    filteredBatches = widget.packageDetail.batches!;
    widget.packageDetail.prices!.forEach((item) {
      addUniqueValue(numbers,item.occupancyName.toString());
    });

    priceoccupancyType = widget.packageDetail.prices!.where((occupancy) {
      return occupancy.occupancyName!.contains(numbers[0].toString());
    }).toList();
// Grouping by travel_mode_id
    Map<int, Map<String, dynamic>> groupedByTravelMode = {};
    for (var price in priceoccupancyType!) {
      int? travelModeId = price.travelModeId;
      String? travelModeName = price.travelModeName;
      String? riderName = price.riderName;

      // If travel_mode_id is already present, update its rider_names and prices
      if (groupedByTravelMode.containsKey(travelModeId)) {
        if (riderName != null && !groupedByTravelMode[travelModeId]!['rider_names'].contains(riderName)) {
          groupedByTravelMode[travelModeId]!['rider_names'].add(riderName);
        }
      } else {
        // If not present, create a new entry for the travel_mode_id
        groupedByTravelMode[travelModeId!!] = {
          'travel_mode_id': travelModeId,
          'travel_mode_name': travelModeName,
          'rider_names': riderName != null ? [riderName] : [price.occupancyName],
          'prices': []
        };
      }
      // Adding price details with occupancy information
      groupedByTravelMode[travelModeId]!['prices'].add({
        'occupancy_name': price.occupancyName,
        'price': price.price,
        'qty': 0
      });
    }
    // Convert map back to a list for easy use in Flutter
    finalList = groupedByTravelMode.values.toList();

    super.initState();
  }
  @override
  void dispose() {
    _bsbController.removeListener(_onBsbChanged);
    super.dispose();
  }
  void _onBsbChanged() {
    if (_bsbController.isCollapsed && !_isCollapsed) {
      setState(() {
        _isCollapsed = true;
        _isExpanded = false;
      });
    } else if (_bsbController.isExpanded && !_isExpanded) {
      setState(() {
        _isCollapsed = false;
        _isExpanded = true;
      });
    }
  }
  void addUniqueValue(List<String> list, String value) {
    if (!list.contains(value)) {
      list.add(value);
    }
    print(numbers)
    ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BottomSheetBar(
        height: 100,
        locked: _isLocked,
        controller: _bsbController,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
        borderRadiusExpanded: const BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
        boxShadows: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 5.0,
            // blurRadius: 32.0,
            offset: const Offset(0, 0),
            // changes position of shadow
          ),
        ],
        body: SingleChildScrollView(
          child: Column(
            children: [
              // The top row with back, logo, and menu icons
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Container(
                  height: 45,
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // Add navigation or functionality for back button here
                          });
                        },
                        child: Container(
                          child: Image(
                            image: AssetImage("assets/images/Back_icon.png"),
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                      Spacer(),
                      Image(
                        image: AssetImage("assets/images/newlogo.png"),
                        height: 30,
                      ),
                      Spacer(),
                      Image(
                        image: AssetImage("assets/images/Menu_sky.png"),
                        height: 30,
                        width: 30,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              // Container for month tabs and batch grid
              SizedBox(

                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
          
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        borderRadius: BorderRadius.circular(12), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Shadow color
                            spreadRadius: 5, // Spread radius of shadow
                            blurRadius: 7, // Blur radius of shadow
                            offset: Offset(0, 3), // Position of shadow
                          ),
                        ],
                        border: Border.all(
                          color: Colors.white, // Border color
                          width: 2, // Border width
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0), // Padding for the container
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Select Batch", style: AppStyle.instance.bodySmallBold.copyWith(
                            color: AppColors.blackColor,
                          )),
                          SizedBox(height: 5,),
                          Divider(height: 1,color: AppColors.grayTextColor,),
                          SizedBox(height: 5,),
          
                          // Scrollable month tab row
                          Row(
                            children: [
                              Expanded(
                                  child: SizedBox(
                                      height: 40.0,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        itemBuilder: (BuildContext context, int index) {
                                          bool isSelected = selectedIndex == index;
                                          return GestureDetector(
                                              onTap: (){
                                                setState(() {
                                                  selectedIndex = index; // Update the selected month
                                                });
                                                filterBatches(nextSixMonths[index]);
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      nextSixMonths[index].toString(),
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.w300,
                                                        color: isSelected  ? Colors.blue : Colors.black,
                                                      ),
                                                    ),
                                                    /*if (showArrow)
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black,
                                      ),*/
                                                  ],
                                                ),
                                              )
                                          );
                                        }, separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white,), itemCount: nextSixMonths!.length,

                                      )
                                  ))

                            ],
                          ),
          
                          // GridView for batches without Expanded
                          Container(

                            child: GridView.builder(
                              shrinkWrap: true, // This allows the GridView to take up only the space it needs
                              // physics: NeverScrollableScrollPhysics(), // Disable scrolling on GridView to use the outer scroll
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 2.8, // Adjust for desired height/width ratio
                                crossAxisSpacing: 8.0,
                                mainAxisSpacing: 8.0,
                              ),
                              itemCount: filteredBatches!.length,
                              itemBuilder: (context, index) {
                                return _buildBatchCard(filteredBatches,index);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
          
                  ),
                ),
              ),
              SizedBox(height: 10,),
          
              SizedBox(

                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
          
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        borderRadius: BorderRadius.circular(12), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Shadow color
                            spreadRadius: 5, // Spread radius of shadow
                            blurRadius: 7, // Blur radius of shadow
                            offset: Offset(0, 3), // Position of shadow
                          ),
                        ],
                        border: Border.all(
                          color: Colors.white, // Border color
                          width: 2, // Border width
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0), // Padding for the container
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Add Members", style: AppStyle.instance.bodySmallBold.copyWith(
                            color: AppColors.blackColor,
                          )),
                          Text(
                            'Occupancy (Room Arrangement or Room Sharing)',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 10,),
                          SizedBox(
                            height: 50, // Give the ListView a height
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: numbers.length, // Number of items
                              itemBuilder: (context, index) {
                                bool isSelected = selectedOption == index;
                                return GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selectedOption = index; // Update the selected month
                                        priceoccupancyType = widget.packageDetail.prices!.where((occupancy) {
                                          return occupancy.occupancyName!.contains(numbers![index].toString());
                                        }).toList();

                                        // Grouping by travel_mode_id
                                        Map<int, Map<String, dynamic>> groupedByTravelMode = {};
                                        for (var price in priceoccupancyType!) {
                                          int? travelModeId = price.travelModeId;
                                          String? travelModeName = price.travelModeName;
                                          String? riderName = price.riderName;
                                          int? riderPrice = price.price;

                                          // If travel_mode_id is already present, update its rider_names and prices
                                          if (groupedByTravelMode.containsKey(travelModeId)) {
                                            if (riderName != null && !groupedByTravelMode[travelModeId]!['rider_names'].contains(riderName)) {
                                              groupedByTravelMode[travelModeId]!['rider_names'].add(riderName);
                                            }
                                          } else {
                                            // If not present, create a new entry for the travel_mode_id
                                            groupedByTravelMode[travelModeId!!] = {
                                              'travel_mode_id': travelModeId,
                                              'travel_mode_name': travelModeName,
                                              'rider_names': riderName != null ? [riderName] : [price.occupancyName],
                                              'prices':  [],
                                            };
                                          }

                                          // Adding price details with occupancy information
                                          groupedByTravelMode[travelModeId]!['prices'].add({
                                            'occupancy_name': price.occupancyName,
                                            'price': price.price,
                                            'qty': 0
                                          });
                                        }

                                        // Convert map back to a list for easy use in Flutter
                                        finalList = groupedByTravelMode.values.toList();
                                        // Print the result
                                        finalList.forEach((entry) {
                                          print(entry);

                                        });


                                      });

                                    },
                                    child: Container(
                                      height: 40,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(),
                                        color: Colors.transparent,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2),
                                        child: DecoratedBox(
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                numbers![index].toString(), style: AppStyle.instance.bodyVerySmallBold.copyWith(
                                                  color: isSelected  ? Colors.white : Colors.blue,fontSize: 11
                                              ),

                                              ),
                                            ),
                                          ),
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            color: isSelected  ? Colors.blue : Colors.blue[100],
                                          ),
                                        ),
                                      ),
                                    )

                                );
                              },
                            ),
                          ),
/*
        _pricingSegmentedControl(),
*/
                          SizedBox(height: 10,),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index) {
                                    return _pricingListControl(finalList,index);
                                  }, separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white,), itemCount: finalList!.length,

                                ),

                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "* Offer & Discount are Applicable on next step", style: AppStyle.instance.bodyVerySmallBold.copyWith(
                                color: AppColors.appbarlinearColor,fontSize: 10
                            ),

                            ),
                          ),
                        ],
                      ),
                    ),
          
                  ),
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  showCouponDialog(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.all(11),
                    decoration: new BoxDecoration(
                      color:AppColors.tooGrayColor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Coupons & Offers", style: AppStyle.instance.bodyVerySmallBold.copyWith(
                            color: AppColors.grayColor,fontSize: 14
                        ),

                        ),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),


            ],
          ),
        ),
        expandedBuilder: (scrollController) {
          final itemList =
          List<int>.generate(_listSize, (index) => index + 1);

          // Wrapping the returned widget with [Material] for tap effects
          return Material(
            color: Colors.white,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Image(image: AssetImage("assets/images/down_img.png"),width: 15,height: 15,),
                            Text(
                                "Cost Breakup", style: AppStyle.instance.bodyToo1Semi.copyWith(fontSize: 10,
                              color: AppColors.blackColor,
                            )),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                  child:Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "Amount", style: AppStyle.instance.bodyToo1Semi.copyWith(
                                              color: AppColors.txtColor,fontSize: 10,
                                            )  ),
                                            Text(
                                                "₹53000.00", style: AppStyle.instance.bodyToo1Semi.copyWith(
                                              color: AppColors.txtColor,fontSize: 10,
                                            )  )

                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "Charges", style: AppStyle.instance.bodyToo1Semi.copyWith(
                                              color: AppColors.txtColor,fontSize: 10,
                                            )  ),
                                            Text(
                                                "₹150.00", style: AppStyle.instance.bodyToo1Semi.copyWith(
                                              color: AppColors.txtColor,fontSize: 10,
                                            )  )

                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "GST", style: AppStyle.instance.bodyToo1Semi.copyWith(
                                              color: AppColors.txtColor,fontSize: 10,
                                            )  ),
                                            Text(
                                                "₹2400.00", style: AppStyle.instance.bodyToo1Semi.copyWith(
                                              color: AppColors.txtColor,fontSize: 10,
                                            )  )

                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "Discount", style: AppStyle.instance.bodyToo1Semi.copyWith(
                                              color: AppColors.txtColor,fontSize: 10,
                                            )  ),
                                            Text(
                                                "-₹0.00", style: AppStyle.instance.bodyToo1Semi.copyWith(
                                              color: AppColors.txtColor,fontSize: 10,
                                            )  )

                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "TCS (Tax collection at source)", style: AppStyle.instance.bodyToo1Semi.copyWith(
                                              color: AppColors.txtColor,fontSize: 10,
                                            )  ),
                                            Text(
                                                "₹1200.00", style: AppStyle.instance.bodyToo1Semi.copyWith(
                                              color: AppColors.txtColor,fontSize: 10,
                                            )  )

                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Divider(height: 1,color: AppColors.txtColor,),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "Subtotal", style: AppStyle.instance.bodySmallBold.copyWith(
                                              color: AppColors.blackColor,fontSize: 13,
                                            )  ),
                                            Text(
                                                "₹55000.00", style: AppStyle.instance.bodySmallBold.copyWith(
                                              color: AppColors.blackColor,fontSize: 13,
                                            )  )

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: AppColors.backGroundColor,
                                      borderRadius: BorderRadius.all(Radius.circular(15))
                                  )


                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Amount to Pay", style: AppStyle.instance.bodyToo1Semi.copyWith(
                                      color: AppColors.grayColor,fontSize: 12,
                                    )  ),
                                    SizedBox(height: 5,),
                                    Text(
                                        "₹ "+updatePrice.toString()+".00", style: AppStyle.instance.bodySmallBold.copyWith(
                                      color: AppColors.blackColor,fontSize: 17,
                                    )),
                                  ],
                                ),
                                Spacer(flex: 1,),
                                Container(

                                    width: 80,
                                    height: 40,
                                    child: Center(
                                      child: Text(
                                          "Pay Now", style: AppStyle.instance.bodyToo1Semi.copyWith(fontSize: 10,
                                        color: AppColors.whiteColor,
                                      )),
                                    ),
                                    decoration: BoxDecoration(
                                        color: AppColors.appbarlinearColor,
                                        borderRadius: BorderRadius.all(Radius.circular(50))
                                    )

                                )
                              ],
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        collapsed: TextButton(
          onPressed: () => _bsbController.expand(),
          child: Container(
            child: Column(
              children: [
                Image(image: AssetImage("assets/images/up_img.png"),width: 20,height: 20,),
                Text(
                    "Cost Breakup", style: AppStyle.instance.bodyToo1Semi.copyWith(fontSize: 10,
                  color: AppColors.blackColor,
                )),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Amount to Pay", style: AppStyle.instance.bodyToo1Semi.copyWith(
                          color: AppColors.grayColor,fontSize: 12,
                        )  ),
                        SizedBox(height: 5,),
                        Text(
                            "₹ "+updatePrice.toString()+".00", style: AppStyle.instance.bodySmallBold.copyWith(
                          color: AppColors.blackColor,fontSize: 17,
                        )),
                      ],
                    ),
                    Spacer(flex: 1,),
                    GestureDetector(
                       onTap: (){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                       },
                      child: Container(
                          width: 80,
                          height: 40,
                          child: Center(
                            child: Text(
                                "Continue", style: AppStyle.instance.bodyToo1Semi.copyWith(fontSize: 10,
                              color: AppColors.whiteColor,
                            )),
                          ),
                          decoration: BoxDecoration(
                              color: AppColors.appbarlinearColor,
                              borderRadius: BorderRadius.all(Radius.circular(50))
                          )

                      ),
                    )
                  ],
                )

              ],
            ),
          ),
        ),

      ),



    );
  }


  // Widget for Batch Cards
  Widget _buildBatchCard(List<Batches>?  batches, int index) {
    bool isSelected = index == selectedBatchIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBatchIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(

          children: [
            Radio(
              value: index,
              groupValue: selectedBatchIndex,
              onChanged: (value) {
                setState(() {
                  selectedBatchIndex = value as int;
                });
              },
              activeColor: Colors.blue,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  formatDate(batches![index].startdate.toString())+" To "+formatDate(batches![index].lastdate.toString()),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  batches![index].availability.toString()=="0"?"Available":"Unavailable",
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(String dateString) {
    try {
      // Parse the input date string into a DateTime object
      DateTime dateTime = DateTime.parse(dateString);

      // Extract the month abbreviation
      String monthAbbreviation = DateFormat('d-MMM').format(dateTime);

      // Construct the desired output with a fixed day (e.g., 10)
      String formattedDate = monthAbbreviation;

      return formattedDate;
    } catch (e) {
      // Handle any potential errors
      print('Error parsing date: $e');
      return 'Invalid Date';
    }
  }

  List<String> getNextSixMonths() {
    DateTime now = DateTime.now();
    List<String> months = [];
    for (int i = 0; i < 6; i++) {
      DateTime nextMonth = DateTime(now.year, now.month + i, 1);
      String formattedMonth = DateFormat('MMM').format(nextMonth);
      months.add(formattedMonth);
    }
    return months;
  }

  // Method to filter unique months in MMM format
  List<String>  filterUniqueMonths() {
    Set<String> uniqueMonths = {};
    List<String> monthList = [];
    for (var batch in batch_list!) {
      DateTime startDate = DateTime.parse(batch.startdate.toString());
      String formattedMonth = DateFormat('MMM').format(startDate);
      uniqueMonths.add(formattedMonth); // Set ensures uniqueness
    }
    monthList.add("All"); // Add "All" at the beginning of the list
    monthList.addAll(uniqueMonths.toList()); // Convert Set to List and add to monthList
    return monthList;


  }

  // Function to filter batches by selected month
  void filterBatches(String selectedMonth) {
    if (selectedMonth == "All") {
      setState(() {
        filteredBatches = widget.packageDetail.batches!; // Show all batches when "All" is selected
      });
    } else {
      setState(() {
        filteredBatches = widget.packageDetail.batches!.where((batch) {
          DateTime startDate = DateTime.parse(batch.startdate.toString());
          String batchMonth = DateFormat('MMM').format(startDate);
          return batchMonth == selectedMonth;
        }).toList(); // Filter the list by month
      });
    }
  }

  Widget _pricingListControl(List<Map<String, dynamic>>  price, int index) => Padding(
    padding: const EdgeInsets.only(left: 5,right: 5,top: 2,bottom: 2),
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: new BoxDecoration(
        color:AppColors.tooGrayColor,
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
          Text(price![index]["travel_mode_name"].toString(), style: AppStyle.instance.bodyVerySmallBold.copyWith(
            color: AppColors.blackColor,fontSize: 15
          )),

          SizedBox(height: 10,),

          Container(


            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(price![index]['rider_names'].length, (riderIndex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: new BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Occupancy",
                              style: TextStyle(fontSize: 10,
                                fontWeight: FontWeight.w300,

                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              price![index]['rider_names'][riderIndex],
                              style: TextStyle(fontSize: 10,

                              ),

                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Price",
                              style: TextStyle(fontSize: 10,
                                fontWeight: FontWeight.w300,

                              ),
                            ),
                            SizedBox(height: 5,),

                            Text(
                              '₹ ${price![index]['prices'][riderIndex]["price"].toString()}',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                /*decoration: price![index]['prices'][riderIndex]["price"] < 45000
                                    ? null
                                    : TextDecoration.lineThrough,*/
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Qty.",
                          style: TextStyle(fontSize: 10,
                            fontWeight: FontWeight.w300,

                          ),
                        ),
                        Container(
                          height: 30,
                          padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                          decoration: new BoxDecoration(
                            color:AppColors.tooGrayColor,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 2.0,
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(

                                child: SizedBox(
                                    width:7,
                                    child: Divider(height: 2,color: Colors.black,)

                                ),
                                onTap: (){
                                  setState(() {
                                   // updatePriceQty= updatePriceQty-1;
                                    if(price![index]['prices'][riderIndex]["qty"]==0){

                                    }else{
                                      price![index]['prices'][riderIndex]["qty"]=(price![index]['prices'][riderIndex]["qty"])-1;
                                      updatePrice=(price![index]['prices'][riderIndex]["price"])-updatePrice;
                                    }

                                  });
                                },
                              ),
                              SizedBox(width: 7,),
                              Text(
                                price![index]['prices'][riderIndex]["qty"].toString(),
                                style: TextStyle(fontSize: 15,
                                  fontWeight: FontWeight.w300,

                                ),
                              ),
                              SizedBox(width: 7,),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                   // updatePriceQty= updatePriceQty+1;
                                    price![index]['prices'][riderIndex]["qty"]=(price![index]['prices'][riderIndex]["qty"])+1;

                                    updatePrice=(price![index]['prices'][riderIndex]["price"])+updatePrice;


                                  });
                                },
                                child: Text(
                                  "+",
                                  style: TextStyle(fontSize: 15,
                                    fontWeight: FontWeight.w300,

                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
          /*Column(
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
          ),*/
        ],
      ),
    ),
  );


  void showCouponDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Close button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Coupons And Offers',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // Apply coupon section
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Apply Coupon',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                // Coupon code input field
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'coupon code',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Logic to apply coupon
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text('Apply'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

