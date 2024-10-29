import 'dart:convert';

import 'package:bottom_sheet_bar/bottom_sheet_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../../data/network/AppUrl.dart';
import '../../../models/storeBooking/StoreBookingRequest.dart';
import '../../../res/color.dart';
import '../../../res/style/text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
class PackingViewScreen extends StatefulWidget {
  final String title;
  final String startingFrom;
  final String endingFrom;
  final String startEndDate;
  final Map<String, dynamic> bookingData;

  const PackingViewScreen({Key? key, this.title = '',required this.startingFrom,required this.endingFrom,required this.startEndDate,required this.bookingData}) : super(key: key);

  @override
  PackingViewPageState createState() => PackingViewPageState();
}

class PackingViewPageState extends State<PackingViewScreen> {
  bool _isCollapsed = true;
  bool _isExpanded = false;
  bool _isLocked = false;
  String userMobile ="";
  String token ="";
  late Booking booking;
  final _bsbController = BottomSheetBarController();
  String _selectedOptionss = "Booking Amount";
  String amountToPay ="5000";
  String remainingAmountToPay ="0";
  bool visible = true;
  @override
  void initState() {
    _bsbController.addListener(_onBsbChanged);
    booking=widget.bookingData["booking"];
    getLoginDetails();

    super.initState();
  }

  Future<String?> getLoginDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userMobile = prefs.getString('mobileNo').toString();
      token = prefs.getString('token').toString();
    });
    return prefs.getString('mobileNo'); // return false if no value is found
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
      title: Text("Booking Detail",style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      )),
   backgroundColor: Colors.white,

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
          //spreadRadius: 5.0,

        ),
      ],
      body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            // shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                  children: <Widget>[

                    Container(
                        margin: EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          color: AppColors.tooGrayColor, //HexColor("212529"),
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
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Traveler",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Text(
                                          "You",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Phone",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Text(
                                          booking.phone,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),



                                  ]),
                                  SizedBox(height: 5,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Email Address",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 2,),
                                      Text(
                                        booking.email,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),


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
                        color: AppColors.tooGrayColor,
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

                              Text(
                                booking.packageName,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                ///crossAxisAlignment:  ,
                                children: [
                                  Text(
                                    widget.startingFrom+" To "+widget.endingFrom,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w200,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 20),

                                  Text(
                                    "2 days",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w200,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  //Spacer(),
                                  Text(
                                    widget.startEndDate,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w200,
                                      color: Colors.black,
                                    ),
                                  ),

                                ],
                              ),


                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      physics: ScrollPhysics(),
                                      itemBuilder: (BuildContext context, int index) {
                                        return _pricingListControl(booking.cost,index);
                                      }, separatorBuilder: (BuildContext context, int index) => const Divider(), itemCount: booking.cost!.length,

                                    ),

                                  ),
                                ],
                              ),


                            ],)
                      ),



                      //Your content


                    ),
                    SizedBox(height: 10,),
                    _builAllCooupan(context),
                    _buildApplyCooupan(context),
                    SizedBox(height: 20),


                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildRadioOption('Booking Amount', '5000'),
                        SizedBox(width: 10,),
                        _buildRadioOption('Full Amount', booking.totalAmountToPay),
                      ],
                    ),

                    SizedBox(height: 15),
                    _buildDetail(context),



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
                                              "₹" + booking.totalAmount, style: AppStyle.instance.bodyToo1Semi.copyWith(
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
                                              "₹0.00", style: AppStyle.instance.bodyToo1Semi.copyWith(
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
                                              "₹0.00", style: AppStyle.instance.bodyToo1Semi.copyWith(
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
                                              "₹00.00", style: AppStyle.instance.bodyToo1Semi.copyWith(
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
                                              "₹" +  booking.totalAmountToPay, style: AppStyle.instance.bodySmallBold.copyWith(
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
                                      "₹ "+amountToPay, style: AppStyle.instance.bodySmallBold.copyWith(
                                    color: AppColors.blackColor,fontSize: 17,
                                  )),
                                ],
                              ),
                              Spacer(flex: 1,),
                              GestureDetector(
                                onTap: (){
                                  bookingApi();

                                },
                                child: Container(
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

                                ),
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
                          "₹"+amountToPay, style: AppStyle.instance.bodySmallBold.copyWith(
                        color: AppColors.blackColor,fontSize: 17,
                      )),
                    ],
                  ),
                  Spacer(flex: 1,),
                  visible ?  GestureDetector(
                    onTap: (){

                          visible = false;
                          bookingApi();
                        },
                    child: Container(
                        width: 100,
                        height: 40,
                        child: Center(
                          child: Text(
                              "Pay Now", style: AppStyle.instance.bodyToo1Semi.copyWith(fontSize: 12,
                            color: AppColors.whiteColor,
                          )),
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.appbarlinearColor,
                            borderRadius: BorderRadius.all(Radius.circular(50))
                        )

                    ),
                  ) : CircularProgressIndicator()
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
   // showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response){
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    verifyBookingApi(response.orderId.toString(),response.paymentId.toString(),response.signature.toString());

    //showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response){
    //showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
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

  Widget _buildRadioOption(String title, String amount) {
    return Container(
     // width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey.shade400,
        ),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedOptionss = title;
                amountToPay=amount;
                if(_selectedOptionss=="Booking Amount"){
                  remainingAmountToPay=((double.parse(booking.totalAmountToPay))-(double.parse(amountToPay))).toString();
                }else{
                  remainingAmountToPay="0";
                }
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,

              children: [
                Radio<String>(
                  value: title,
                  groupValue: _selectedOptionss,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionss = value!;
                      amountToPay=amount;
                      if(_selectedOptionss=="Booking Amount"){
                        remainingAmountToPay=((double.parse(booking.totalAmountToPay))-(double.parse(amountToPay))).toString();
                      }else{
                        remainingAmountToPay="0";
                      }
                    });
                  },
                  activeColor: Colors.blue,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'Total - $amount',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildDetail(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.tooGrayColor, //HexColor("212529"),
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(14),
        ),

        margin: EdgeInsets.only(left: 16, right: 16),
        padding:  EdgeInsets.all(8),
        child:Column(
            mainAxisAlignment:  MainAxisAlignment.start,
            children: <Widget>[
              Row( children: <Widget>[
                Text("Amount",style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),),
                Spacer(),
                Text("₹"+booking.totalAmount,style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                )),

              ],
              ),
              SizedBox(height: 5,),
              Row( children: <Widget>[
                Text("GST(5%)",style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                )),
                Spacer(),
                Text("₹"+booking.totalGst,style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                )),
              ],
              ),
              SizedBox(height: 5,),

              Row( children: <Widget>[
                Text("Subtotal",style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey,
                )),
                Spacer(),
                Text("₹"+booking.totalAmountToPay,style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey,
                )),
              ],
              ),
              Divider(),
              Row( children: <Widget>[
                Text("Amount To Pay",style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey,
                )),
                Spacer(),
                Text("₹"+amountToPay,style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey,
                )),
              ],
              ),
              _selectedOptionss=="Booking Amount"?Row( children: <Widget>[
                Text("Remaining Amount",style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey,
                )),
                Spacer(),
                Text("₹"+remainingAmountToPay,style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey,
                )),
              ],
              ):Row(),
            ]) );
   }

  void bookingApi() async {

    print(json.encode(booking));
    visible = false;
    booking.remainingAmount=remainingAmountToPay;
    String stringValue = amountToPay; // Example string value
    double value = double.parse(stringValue); // Convert string to double
    double finalPay = value * 100; // Multiply by 100

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token
    };
    final Map<String, dynamic> body = {
      "booking": booking,
      "secret_code": "12345",
      "payment_method": "Mobile Wallets"
    };

    // Convert the map to a JSON string
    final data = jsonEncode(body);
    try{
      Response response = await post(
          Uri.parse(AppUrl.booking),
          headers: headers,
          body:  data
      );
      print(response.body);
      if(response.statusCode == 200){
        visible = true;
        Razorpay razorpay = Razorpay();
        var options = {
          'key': 'rzp_test_jrFPz3u3W90033',
          'amount': 1,
          'name': booking.packageName,
          'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
          'external': {
            'wallets': ['paytm']
          }
        };
        razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
        razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
        razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
        razorpay.open(options);


      }else {

          visible = true;

        print('failed');
        Fluttertoast.showToast(
            msg: "Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
        );
       }
    }catch(e){
      print(e.toString());
      visible = true;
      Fluttertoast.showToast(
          msg: "error"+e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0

      );
    }
  }

  void verifyBookingApi(String razorpay_order_id,String razorpay_payment_id,String razorpay_signature) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token
    };
    final Map<String, dynamic> body = {
      "razorpay_order_id": razorpay_order_id,
      "razorpay_payment_id": razorpay_payment_id,
      "razorpay_signature": razorpay_signature
    };

    // Convert the map to a JSON string
    final data = jsonEncode(body);
    try{
      Response response = await post(
          Uri.parse(AppUrl.verifyBooking),
          headers: headers,
          body:  data
      );
      print(response.body);
      if(response.statusCode == 200){
        showSuccessDialog(context,"success");


        /*Fluttertoast.showToast(
            msg: "Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
        );*/
      }else {
        print('failed');
        showSuccessDialog(context,"failed");

        Fluttertoast.showToast(
            msg: "Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }
    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "error"+e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
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
          Text("Apply Coupon",
            style: TextStyle(
              fontSize: 15 ,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          Spacer(),
          Text("View Offers",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),),

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
                  child: Icon(
                    Icons.chevron_right, // or Icons.chevron_right
                    size: 24.0,
                    color: Colors.black,
                  ),),


            ])
        ),

      ]) );

}

Widget _pricingListControl(List<Cost> price, int index) => Padding(
  padding: const EdgeInsets.only(left: 0,right: 0,top: 5,bottom: 2),
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
        Text(price![index].travelModeName, style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        )),
        SizedBox(height: 10,),
        Divider(height: 1,color: AppColors.grayTextColor,),
        SizedBox(height: 10,),
        Container(
          padding: EdgeInsets.all(1),
          decoration: new BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              price![index].riderName.replaceAll("[", "").replaceAll("]", ""),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              )
            ),
            Text(
              '₹ '+price![index].packagePrice,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
          ],
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


Widget _buildApplyCooupan(BuildContext context) {
  return Container(
      color: Colors.white,
      //height: 50,
      margin: EdgeInsets.only(left: 16, right: 16),
      padding:  EdgeInsets.all(8),
      child:Column( children: <Widget>[


        Row( children: <Widget>[
          Text("Have Gift Card",style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),),
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
              Text("Gift Card Code",style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              )),
              Spacer(),
              GestureDetector(
                  onTap: (){
                    giftCardAlert(context);
                  },
                  child: Text("Apply",style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueAccent,
                  ))),


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
                   Navigator.of(context, rootNavigator: true).pop();
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
                    Navigator.of(context, rootNavigator: true).pop();
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

void showSuccessDialog(BuildContext context,String status) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: const EdgeInsets.all(16.0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle,
              color: status=="success"?Colors.green:Colors.red,
              size: 60,
            ),
            const SizedBox(height: 16),
            status=="success"?Text(
              'Transaction Successful!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ):Text(
              'Transaction Failed!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            status=="success"?Text(
              'Your transaction  completed successfully.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ):Text(
              'Your transaction Failed.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'OK',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      );
    },
  );
}







