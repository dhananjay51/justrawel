import 'package:bottom_sheet_bar/bottom_sheet_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:justwravel/View/HomeView/ProductDetail/PackingViewScreen.dart';
import 'package:justwravel/View/NavigationView/CustomAppBar.dart';
import 'package:justwravel/res/color.dart';

import '../../res/style/text_style.dart';

class LoginScreen extends StatefulWidget{

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  var isScreen = "Login";
  bool _isLocked = false;
  bool _isCollapsed = true;
  bool _isExpanded = false;
  int _listSize = 1;
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
                   :isScreen=="Otp"?OtpVerify():Container())
             ],

           ),
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
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: Colors.black),
                                obscureText: false,
                                decoration: new InputDecoration.collapsed(
                                    hintText: '---- ----'
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
          GestureDetector(
            onTap: (){
              setState(() {
                isScreen="Otp";
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
          ),
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
  Widget OtpVerify(){
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Text("Welcome Back!", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
          SizedBox(height: 5,),
          Text("OTP has been sent to your registered Mobile Number", style: TextStyle(color: Colors.grey,fontSize: 12),),
SizedBox(height: 5,),
          Text("(+91- 12345 67890)", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 30),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                      height: 64.0,
                      width: 56.0,
                      child: Card(
                          color: Color.fromRGBO(173, 179, 191, 0.7),
                          child: Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: otpField()
                          )
                      )
                  ),
                  SizedBox(width: 10,),
                  Container(
                      height: 64.0,
                      width: 56.0,
                      child: Card(
                          color: Color.fromRGBO(173, 179, 191, 0.7),
                          child: Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: otpField()
                          )
                      )
                  ),
                  SizedBox(width: 10,),
                  Container(
                      height: 64.0,
                      width: 56.0,
                      child: Card(
                          color: Color.fromRGBO(173, 179, 191, 0.7),
                          child: Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: otpField()
                          )
                      )
                  ),
                  SizedBox(width: 10,),
                  Container(
                      height: 64.0,
                      width: 56.0,
                      child: Card(
                          color: Color.fromRGBO(173, 179, 191, 0.7),
                          child: Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: otpField()
                          )
                      )
                  ),

                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => PackingViewScreen()));

            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
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
          ),
          SizedBox(height: 10,),
          Text("Resend OTP in (00.00)", style: TextStyle(color: AppColors.grayColor,fontSize: 13),),

        ],
      ),
    );
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
    return Container(
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
                                    keyboardType: TextInputType.name,
                                    style: TextStyle(color: Colors.black,fontSize: 13),
                                    obscureText: true,
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
                                    keyboardType: TextInputType.name,
                                    style: TextStyle(color: Colors.black,fontSize: 13),
                                    obscureText: true,
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
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(color: Colors.black,fontSize: 13),
                                    obscureText: true,
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
          GestureDetector(
            onTap: (){
              setState(() {
                isScreen="Login";
              });
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
          ),
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

}