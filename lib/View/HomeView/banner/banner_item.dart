import 'package:flutter/material.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({
    super.key,

    required this.image,
    });
  final String image;


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child:  Container(
            height: 200,
            decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(10),
                   image: DecorationImage(
                    image:  NetworkImage(image),
                    fit: BoxFit.fill
                )
            ),
          ));

  }
}



