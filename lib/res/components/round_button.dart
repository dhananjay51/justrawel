// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton(
      {Key? key,
      required this.title,
      this.loading = false,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: AppColors.blackColor,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  title,
                  style: TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {

    return SizedBox (
        width: 100,
        height: 40,
        child:  ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:  const Color(0xFF36A9E1),//Color(0xFFE6007E)
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onPressed: onPressed,
          child: Text(text, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300)),
        ));

  }
}