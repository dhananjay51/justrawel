import 'package:bottom_sheet_bar/bottom_sheet_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../res/color.dart';
import '../../../res/style/text_style.dart';




class PackingViewScreen extends StatefulWidget {
  final String title;

  const PackingViewScreen({Key? key, this.title = ''}) : super(key: key);

  @override
  PackingViewPageState createState() => PackingViewPageState();
}

class PackingViewPageState extends State<PackingViewScreen> {
  bool _isCollapsed = true;
  bool _isExpanded = false;
  bool _isLocked = false;

  final _bsbController = BottomSheetBarController();

  @override
  void initState() {
    _bsbController.addListener(_onBsbChanged);
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

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Hello"),


    ),
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
      body: Container(
          child: SingleChildScrollView(
            // shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                  children: <Widget>[

                    Container(
                        margin: EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(33, 37, 41, 0.04), //Colors.white, //HexColor("212529"),
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(child:
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row( children: <Widget>[

                                    Text("Traveler"),

                                    Spacer(),

                                    Text("Email"),

                                  ]),

                                  Text("You & Travler"),
                                  Row( children: <Widget>[
                                    Text("Traveler"),

                                    Spacer(),

                                    Text("dummymail@gmail.com"),

                                  ]),
                                  Text("+915784477389"),


                                ],
                              ),
                              ),
                              // Spacer(),
                              /*
                       Column(
                         children: <Widget>[
                           Text("Email"),
                           Text("dummy@gmaiul.com"),


                         ],
                       )
                       */



                            ],
                          )
                          ,
                        )
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 14, right: 14, top:  15),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(33, 37, 41, 0.04),
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(

                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Text("Ladakh"),
                              Row(
                                ///crossAxisAlignment:  ,
                                children: [

                                  Text("Delhi to Delhi"),
                                  SizedBox(width: 20),

                                  Text("11 Days"),
                                  SizedBox(width: 20),
                                  //Spacer(),
                                  Text("6 Sep to 16 Sep"),
                                ],
                              ),


                              Column(

                                  children: <Widget>[
                                    Container(

                                        constraints: BoxConstraints(minWidth: 230.0, minHeight: 25.0),

                                        child:


                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),

                                          itemCount: 2,
                                          itemBuilder: (BuildContext context, int index) {
                                            return Container(
                                                margin:  EdgeInsets.only(top:5, bottom: 5),
                                                padding: EdgeInsets.all(10),

                                                color: Colors.white60,


                                                child: Column(children: <Widget>[

                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: <Widget>[


                                                      Text( "EnFiled 350 CC"),
                                                      Spacer(),
                                                      Row(
                                                        children:< Widget> [
                                                          Text("Qty"),
                                                          Text("1")

                                                        ],
                                                      ),


                                                    ],),
                                                  new Divider(
                                                    color: Color.fromRGBO(33, 37, 41, 0.04),
                                                  ),
                                                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: <Widget>[

                                                        Text( "Solo Rider"),
                                                        Text( "Triple occciupancy"),
                                                        Text( "25000"),


                                                      ])

                                                ])

                                            );
                                          },
                                        ))]

                              )


                            ],)
                      ),



                      //Your content


                    ),
                    _builAllCooupan(context),
                    _buildApplyCooupan(context),
                    Padding(padding: EdgeInsets.all(18),
                        child: Row(
                          children: <Widget>[
                            Text("Join Our Membership"),
                            Spacer(),
                            Text("Learn More"),

                          ],
                        )),
                    _buildExploreCard(context),
                    SizedBox(height: 15),
                    DrifterCard(context),
                    SizedBox(height: 15),
                    _buildDetail(context),
                    /*ElevatedButton(onPressed: (){
                      Razorpay razorpay = Razorpay();
                      var options = {
                        'key': 'rzp_live_ILgsfZCZoFIKMb',
                        'amount': 100,
                        'name': 'Acme Corp.',
                        'description': 'Fine T-Shirt',
                        'retry': {'enabled': true, 'max_count': 1},
                        'send_sms_hash': true,
                        'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
                        'external': {
                          'wallets': ['paytm']
                        }
                      };
                      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
                      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
                      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
                      razorpay.open(options);
                    },
                        child: const Text("Pay with Razorpay")),
*/


                  ]
              )
          )
      ),
      expandedBuilder: (scrollController) {
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
                                      "₹ 75,000", style: AppStyle.instance.bodySmallBold.copyWith(
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
                          "₹ 75,000", style: AppStyle.instance.bodySmallBold.copyWith(
                        color: AppColors.blackColor,fontSize: 17,
                      )),
                    ],
                  ),
                  Spacer(flex: 1,),
                  GestureDetector(
                    onTap: (){

                      Razorpay razorpay = Razorpay();
                      var options = {
                        'key': 'rzp_live_ILgsfZCZoFIKMb',
                        'amount': 100,
                        'name': 'Acme Corp.',
                        'description': 'Fine T-Shirt',
                        'retry': {'enabled': true, 'max_count': 1},
                        'send_sms_hash': true,
                        'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
                        'external': {
                          'wallets': ['paytm']
                        }
                      };
                      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
                      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
                      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
                      razorpay.open(options);
                    },
                    child: Container(
                        width: 80,
                        height: 40,
                        child: Center(
                          child: Text(
                              "Book Now", style: AppStyle.instance.bodyToo1Semi.copyWith(fontSize: 10,
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

  void handlePaymentErrorResponse(PaymentFailureResponse response){
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response){
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response){
    showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message){
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed:  () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
Widget _builAllCooupan(BuildContext context) {
  return Container(
      color: Colors.white,
      //height: 50,
      margin: EdgeInsets.only(left: 16, right: 16),
      padding:  EdgeInsets.all(8),
      child:Column( children: <Widget>[


        Row( children: <Widget>[
          Text("Apply Coupon"),
          Spacer(),
          Text("View Offers"),

        ],

        ),
        Container(
            margin: EdgeInsets.only(top: 10),
            height: 40,
            decoration: BoxDecoration(
              color: Color.fromRGBO(33, 37, 41, 0.04),
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(20),
            ),

            padding:  EdgeInsets.all(8),
            child: Row( children: <Widget>[
              Text("Coupon & Offers"),
              Spacer(),
              GestureDetector(
                  onTap: (){
                    showDataAlert(context);
                  },
                  child: Text("Coupon & Offers")),


            ])
        ),

      ]) );

}

Widget _buildApplyCooupan(BuildContext context) {
  return Container(
      color: Colors.white,
      //height: 50,
      margin: EdgeInsets.only(left: 16, right: 16),
      padding:  EdgeInsets.all(8),
      child:Column( children: <Widget>[


        Row( children: <Widget>[
          Text("Have Gift Card"),
          Spacer(),


        ],

        ),
        Container(
            margin: EdgeInsets.only(top: 10),
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(20),
            ),

            padding:  EdgeInsets.all(8),
            child: Row( children: <Widget>[
              Text("Gift Card Code"),
              Spacer(),
              GestureDetector(
                  onTap: (){
                    giftCardAlert(context);
                  },
                  child: Text("Apply")),


            ])
        ),

      ]) );

}
Widget _buildExploreCard(BuildContext context) {
  return Container(
    //color: Colors.white,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),

      margin: EdgeInsets.only(left: 16, right: 16),
      padding:  EdgeInsets.all(8),
      child:Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: <Widget>[
            Row( children: <Widget>[
              Text("Explorer's Card"),
              Spacer(),
              Text("Price - 3,000"),

            ],


            ),

            Row( children: <Widget>[
              Text("Join membership & Get (7% Off) on 5 trip."),
              Spacer(),


            ],

            ),

          ]) );

}
Widget _buildDetail(BuildContext context) {
  return Container(

      margin: EdgeInsets.only(left: 16, right: 16),
      padding:  EdgeInsets.all(8),
      child:Column(
          mainAxisAlignment:  MainAxisAlignment.start,
          children: <Widget>[
            Row( children: <Widget>[
              Text("Amount"),
              Spacer(),
              Text("₹53000.00"),

            ],
            ),
            Row( children: <Widget>[
              Text("Charges"),
              Spacer(),
              Text("₹150.00"),
            ],
            ),
            Row( children: <Widget>[
              Text("GST"),
              Spacer(),
              Text("₹2400.00"),
            ],
            ),

            Row( children: <Widget>[
              Text("Discount"),
              Spacer(),
              Text("-₹0.00"),
            ],
            ),
            Row( children: <Widget>[
              Text("TCS (Tax collection at source)"),
              Spacer(),
              Text("₹1200.00"),
            ],
            ),
            Divider(),
            Row( children: <Widget>[
              Text("Subtotal"),
              Spacer(),
              Text("₹55000.00"),
            ],
            ),



          ]) );

}

Widget DrifterCard (BuildContext context) {


  return Container(
    //color: Colors.white,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      height: 70,
      margin: EdgeInsets.only(left: 16, right: 16),
      padding:  EdgeInsets.all(8),

      child:Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: <Widget>[
            Row( children: <Widget>[
              Text("Explorer's Card"),
              Spacer(),
              Text("Price - 3,000"),

            ],

            ),

            Row( children: <Widget>[
              Text("Join membership & Get (7% Off) on 5 trip."),
              Spacer(),

            ],

            ),

          ]) );

}
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

showDataAlert(BuildContext context,) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: EdgeInsets.only(
            top: 10.0,
          ),
          title: Row(
            children: [
              Text("Coupons And Offers", style:  AppStyle.instance.bodySmallBold.copyWith(fontSize: 15,
            color: AppColors.blackColor,
          )),
              Spacer(flex: 1,),
              GestureDetector(
                 onTap: (){

                 },
                  child: Image(image: AssetImage("assets/images/close.png"),width: 20,height: 20,)),
            ],
          ),
          content: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              height: 400,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Apply Coupon",style:  AppStyle.instance.bodyNormal.copyWith(fontSize: 13,
                        color: AppColors.grayColor,
                      ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(20),

                            )

                        ),
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            child: TextField(
                              style: AppStyle.instance.bodyNormal.copyWith(fontSize: 12,
                                color: AppColors.blackColor,
                              ),
                              decoration: InputDecoration.collapsed(
                                hintText: 'Coupon Code',
                              ),
                            ),
                          ),
                          Spacer(flex: 1,),
                          Text(
                            "Apply",style:  AppStyle.instance.bodyNormal.copyWith(fontSize: 12,
                            color: CupertinoColors.activeBlue,
                          ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return _applyCoupon(index);
                        }, separatorBuilder: (BuildContext context, int index) => const Divider(color: AppColors.appbarlinear1Color,), itemCount: 5,

                      ),

                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

Widget _applyCoupon(int index){
  return Container(
      decoration: BoxDecoration(
          color: AppColors.blurlightColor,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 35,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Center(
                  child: Text(
                      "Save ₹500", style: AppStyle.instance.bodyVerySmallBold.copyWith(fontSize: 10,
                    color: CupertinoColors.activeBlue,
                  )),
                ),
              ),
              Spacer(flex: 1,),
              Text(
                  "Remove", style: AppStyle.instance.bodyVerySmallBold.copyWith(fontSize: 12,
                color: CupertinoColors.activeBlue,
              ))

            ],
          ),
          SizedBox(height: 10,),
          Text(
              "Coupon Code : NEW500", style: AppStyle.instance.bodyVerySmallBold.copyWith(fontSize: 12,
            color: CupertinoColors.black,
          )),
          SizedBox(height: 3,),
          Text(
              "Use code NEW500 & get ₹500 off on this booking", style: AppStyle.instance.bodyVerySmall.copyWith(fontSize: 9,
            color: AppColors.grayTextColor,
          ))
        ],
      ),
    ),
  );
}

giftCardAlert(BuildContext context,) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: EdgeInsets.only(
            top: 10.0,
          ),
          title: Row(
            children: [
              Text("Gift card", style:  AppStyle.instance.bodySmallBold.copyWith(fontSize: 15,
                color: AppColors.blackColor,
              )),
              Spacer(flex: 1,),
              GestureDetector(
                  onTap: (){

                  },
                  child: Image(image: AssetImage("assets/images/close.png"),width: 20,height: 20,)
              ),
            ],
          ),
          content: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              height: 400,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return _giftCard(index);
                        }, separatorBuilder: (BuildContext context, int index) => const Divider(color: AppColors.appbarlinear1Color,), itemCount: 5,

                      ),

                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

Widget _giftCard(int index){
  return Container(
    decoration: BoxDecoration(
        color: AppColors.blurlightColor,
        borderRadius: BorderRadius.all(Radius.circular(10))
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage("assets/images/gift_card.png"),width: 50,height: 50,),
          SizedBox(height: 20,),
          Text(
              "Coupon You have Gift Card worth ₹ 5000", style: AppStyle.instance.bodyVerySmallBold.copyWith(fontSize: 12,
            color: CupertinoColors.black,
          )),
          SizedBox(height: 3,),
          Container(

              width: 50,
              height: 30,
              child: Center(
                child: Text(
                    "Use it", style: AppStyle.instance.bodyToo1Semi.copyWith(fontSize: 10,
                  color: AppColors.whiteColor,
                )),
              ),
              decoration: BoxDecoration(
                  color: AppColors.appbarlinearColor,
                  borderRadius: BorderRadius.all(Radius.circular(50))
              )

          )

        ],
      ),
    ),
  );
}
