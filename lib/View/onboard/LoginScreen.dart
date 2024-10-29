import 'dart:convert';
import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bottom_sheet_bar/bottom_sheet_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:justwravel/View/HomeView/ProductDetail/PackingViewScreen.dart';
import 'package:justwravel/View/NavigationView/CustomAppBar.dart';
import 'package:justwravel/data/network/AppUrl.dart';
import 'package:justwravel/models/otp_varification.dart';
import 'package:justwravel/res/color.dart';
import 'package:justwravel/models/login_model.dart';
import '../../res/style/text_style.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:justwravel/models/otp_varification.dart';
 import 'package:fluttertoast/fluttertoast.dart';


import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget{
  final Map<String, dynamic> bookingData;
  final String startingFrom;
  final String endingFrom;
  final String startEndDate;
  const LoginScreen({Key? key,required this.startingFrom,required this.endingFrom,required this.startEndDate,required this.bookingData}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var isScreen = "Login";
  var otp = "";
  var isMobileno = "";

  bool _isLocked = false;
  bool _isCollapsed = true;
  bool _isExpanded = false;
  int _listSize = 1;
  bool visible = true;
  bool _validate = false;
  int secondsRemaining = 30;
  bool enableResend = false;
  late Timer timer ;
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController  email = TextEditingController();
  var token ="";

  final _bsbController = BottomSheetBarController();
  @override
  void initState() {
    _bsbController.addListener(_onBsbChanged);
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
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
         child: Container(
           child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                 child: Container(
                   height: 45,
                   child: Row(
                     children: <Widget>[

                       GestureDetector(
                           onTap: (){
                             setState(() {
                               isScreen=="Otp"?isScreen="Login":isScreen=="Register"?isScreen="Login":Navigator.pop(context,true);
                             });

                           },
                           child: Container(child: Image(image: AssetImage("assets/images/Back_icon.png"),height: 30,width: 30,))),
                       Spacer(),
                       Image(image: AssetImage("assets/images/newlogo.png"),height: 30,),
                       Spacer(),
                       Image(image: AssetImage("assets/images/Menu_sky.png"),height: 30,width: 30,)

                     ],
                   ),
                 ),
               ),
               //login()
               Container(child: isScreen=="Login"?login():isScreen=="Register"?register()
                   :isScreen=="Otp"?OtpVerify(isMobileno):Container())
             ],

           ),
         ),
       ),
       expandedBuilder: (scrollController) {
         final itemList =
         List<int>.generate(_listSize, (index) => index + 1);

         // Wrapping the returned widget with [Material] for tap effects
          return Container(
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
                    /* onTap: (){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                       },*/
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


  Widget login(){

    String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
      if (value.length != 10)
        return 'Mobile Number must be of 10 digit';
      else
        return "";
    }

    void login(String mobileno ) async {

// Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });
      try{

        Response response = await post(
            Uri.parse(AppUrl.login),
            body: {
              'phone' : mobileno,
              'country_code' : '+91'
            }
        );
        if(response.statusCode == 200){
// Hiding the CircularProgressIndicator.
          setState(() {
            visible = true;
          });

          final Map<String, dynamic> jsonMap = jsonDecode(response.body);
         final  user =     LoginModel.fromJson(jsonMap);
          print(user.message);

            isMobileno = mobileno;
            isScreen="Otp";

        }
          else {
          print('failed');

          Fluttertoast.showToast(
              msg: "failed",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0
          );
          // Hiding the CircularProgressIndicator.
          setState(() {
            visible = true;
          });
        }
        }catch(e){
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = true;
        });
        print(e.toString());
        Fluttertoast.showToast(
            msg: e.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
      }
      return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Text("Welcome Back!", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
          SizedBox(height: 5,),
          Text("Enter your details to proceed", style: TextStyle(color: Colors.grey),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Phone", style: TextStyle(color: Colors.black),),
                SizedBox(height: 5,),
                Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("+91 |", style: TextStyle(color: Colors.black),),
                        ),
                        Container(
                            child: SizedBox(
                              width: 250,
                              child: TextField(
                                controller: phoneNoController,

                                keyboardType: TextInputType.number,
                                style: TextStyle(color: Colors.black),
                                obscureText: false,
                                 decoration: new InputDecoration(
                                    hintText: '---- ----',
                                  // errorText: _validate ? "Please enter valid Mobile No." : null,

                                  ),
                                  onChanged: (text) => {
                                   debugPrint("hello"),


                                },
                              ),)
                        ),



                      ],

                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(20),

                        )

                    )
                ),
                 Text(_validate ? "Please enter valid mobile No." : "", style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        visible ? GestureDetector(
            onTap: (){
              setState(() {

                FocusScope.of(context).unfocus();


                _validate = phoneNoController.text.isEmpty;

                  if (_validate)  {

                  //  visible = false;
                  }
                  else {

                    visible = false;
                   // visible = true;

                     login(phoneNoController.text);

                  }



               });
             },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Submit', style: TextStyle(color: Colors.white),
                  ),
                ),
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.appbarlinearColor,
                ),
              ),
            ),
           ) : CircularProgressIndicator(),


           SizedBox(height: 10,),
           GestureDetector(
             onTap: (){
               setState(() {
                 isScreen="Register";
               });
             },
              child: Text("Register Here", style: TextStyle(color: AppColors.appbarlinearColor,fontSize: 15),)),

        ],
      ),
    );

  }

  Widget OtpVerify(String mobileno ){

    void optvarify() async {

// Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });
      try{

        Response response = await post(
            Uri.parse(AppUrl.otpVarify),
            body: {
              'phone' : mobileno,
              'country_code' : '+91',
              "otp" : otp
            }
        );
        if(response.statusCode == 200){
// Hiding the CircularProgressIndicator.
          setState(() {
            visible = true;
          });

          final Map<String, dynamic> jsonMap = jsonDecode(response.body);
          final  user =     Otpvarification.fromJson(jsonMap);
          print(user.message);
           print(user.data?.firstName);
          token=user.data!.token.toString();
        //

           var userPhone =   user.data?.phone ?? "";
          var email =   user.data?.email ?? "";
            if (userPhone.length  >  0 &&  email.length > 0){

              saveLoginStatus(user.data!.token.toString(),user.data!.id.toString(),user.data!.firstName.toString(),user.data!.lastName.toString()
                  ,user.data!.countryCode.toString(),user.data!.email.toString(),user.data!.phone.toString());
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => PackingViewScreen(startingFrom: widget.startingFrom!.toString(),endingFrom: widget.endingFrom!.toString(),startEndDate:widget.startEndDate,bookingData: widget.bookingData,)));


            }
            else {
              isScreen="Register";
            }




        }else {
          print('failed');
          Fluttertoast.showToast(
              msg: "failed",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0
          );
          // Hiding the CircularProgressIndicator.
          setState(() {
            visible = true;
          });
        }
      }catch(e){
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = true;
        });
        print(e.toString());
        Fluttertoast.showToast(
            msg: e.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
        );
       }
     }
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Text("Welcome Back!", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
          SizedBox(height: 5,),
          Text("OTP has been sent to your registered Mobile Number", style: TextStyle(color: Colors.grey,fontSize: 12),),
SizedBox(height: 5,),
          Text((' + 91-' + mobileno ), style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:

          Container(
           // height: 50,
            child: OtpPinField(
              maxLength: 4,
             otpPinFieldDecoration:
                 OtpPinFieldDecoration.defaultPinBoxDecoration,
              onSubmit: (String pin) {
                print("OTP Entered: $pin");
                 otp = pin;

              }, onChange: (String text) {  },

            ),

          )),

          SizedBox(height: 15),

          visible ?   GestureDetector(
            onTap: (){

              if (otp.length == 4) {

                  visible = false;
                  optvarify();
               }
               else {
                visible = true;
               }
               },

            child: Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: Container(
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.appbarlinearColor,
                ),
              ),
            ),
          ) : CircularProgressIndicator(),

          SizedBox(height: 10,),
          enableResend == true?  GestureDetector(
             onTap: (){
               enableResend = false;
               _resendCode();
             },
           child: Text ("Resend OTP",style: TextStyle(color: AppColors.blackColor,fontSize: 13),)

         ) : Text("Resend OTP in ($secondsRemaining)", style: TextStyle(color: AppColors.grayColor,fontSize: 13),),


        ],
      ),
    );

  }
  void _resendCode() {
    //other code here
    setState((){
      secondsRemaining = 30;
      enableResend = false;
    });
  }
  Widget otpField(){
    return TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            hintText: "*",
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)
        )
    );
  }
  Widget register(){


    void singUp() async {


// Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });
      try{
        Response response = await post(
            Uri.parse(AppUrl.register),
            body: {
              'first_name' : firstname.text,
              'last_name' : lastname.text,
              "email" : email.text,
              "gender" : "male",
            },
            headers: {
              'X-Requested-With': ' XMLHttpRequest',
              'Accept': 'application/json',
              'Authorization':"Bearer "+token,
            }
        );
        if(response.statusCode == 200){
// Hiding the CircularProgressIndicator.
          setState(() {
            visible = true;
          });

          final Map<String, dynamic> jsonMap = jsonDecode(response.body);
          final  user =     Otpvarification.fromJson(jsonMap);
          print(user.message);
          print(user.data?.firstName);

          if ((user.data?.firstName ?? "" ).length  >  0  &&  (user.data?.email ?? "" ).length >  0){

            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PackingViewScreen(startingFrom: widget.startingFrom!.toString(),endingFrom: widget.endingFrom!.toString(),startEndDate:widget.startEndDate,bookingData: widget.bookingData,)));
          }
          else {
            isScreen="Register";
          }


        }else {
          print('failed');
          Fluttertoast.showToast(
              msg: response.body,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0
          );
          // Hiding the CircularProgressIndicator.
          setState(() {
            visible = true;
          });
        }
      }catch(e){
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = true;
        });
        print(e.toString());
        Fluttertoast.showToast(
            msg: e.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Text("Register Here!", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
          SizedBox(height: 5,),
          Text("Enter your details to proceed", style: TextStyle(color: Colors.grey),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("First Name", style: TextStyle(color: Colors.black),),
                SizedBox(height: 5,),
                Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            child: SizedBox(
                              width: 250,
                              height: 40,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TextField(
                                    controller: firstname,
                                    keyboardType: TextInputType.name,
                                    style: TextStyle(color: Colors.black,fontSize: 13),
                                    obscureText: false,
                                    decoration: new InputDecoration.collapsed(
                                        hintText: 'First name'
                                    ),

                                  ),
                                ),
                              ),)
                        )


                      ],

                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(20),

                        )

                    )
                )

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Last Name", style: TextStyle(color: Colors.black),),
                SizedBox(height: 5,),
                Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            child: SizedBox(
                              width: 250,
                              height: 40,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TextField(
                                    controller: lastname,
                                    keyboardType: TextInputType.name,
                                    style: TextStyle(color: Colors.black,fontSize: 13),
                                    obscureText: false,
                                    decoration: new InputDecoration.collapsed(
                                        hintText: 'Last name'
                                    ),

                                  ),
                                ),
                              ),)
                        )


                      ],

                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(20),

                        )

                    )
                )

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email Address", style: TextStyle(color: Colors.black),),
                SizedBox(height: 5,),
                Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            child: SizedBox(
                              width: 250,
                              height: 40,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TextField(
                                    controller: email,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(color: Colors.black,fontSize: 13),
                                    obscureText: false,
                                    decoration: new InputDecoration.collapsed(
                                        hintText: 'xyz@gmail.com'
                                    ),

                                  ),
                                ),
                              ),)
                        )


                      ],

                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(20),

                        )

                    )
                )

              ],
            ),
          ),


          visible ? GestureDetector(
            onTap: (){

              if (firstname.text.length > 0 && lastname.text.length > 0  && email.text.length > 0) {

                visible = false;

                singUp();
                print("submit");

              }
              else {
                visible = true;
              }
            },

            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Submit',

                    style: TextStyle(color: Colors.white),
                  ),
                ),
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.appbarlinearColor,
                ),
              ),
            ),
          ) :  CircularProgressIndicator(),
          SizedBox(height: 10,),

          GestureDetector(
              onTap: (){
                setState(() {
                  isScreen="Login";
                });
              },
              child: Text("Login Here", style: TextStyle(color: AppColors.appbarlinearColor,fontSize: 15),)),

        ],
      ),
    );
  }
  Future<void> saveLoginStatus(String token,String userId,String firstName,String lastName,String countryCode,String email,String mobileNo) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('userId', userId);
    await prefs.setString('firstName', firstName);
    await prefs.setString('lastName', lastName);
    await prefs.setString('countryCode', countryCode);
    await prefs.setString('email', email);
    await prefs.setString('mobileNo', mobileNo);
  }
}