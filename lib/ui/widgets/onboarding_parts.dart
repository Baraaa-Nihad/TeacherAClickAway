import 'package:flutter/material.dart';

class OnBoardingParts extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  OnBoardingParts({required this.title,required this.subtitle ,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(bottom: 30),
      margin: const EdgeInsets.only( left: 10, right: 10),
      child:Flexible(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(flex:2,child:  Image.asset("assets/images/$image",fit: BoxFit.contain,),
         
          ),
   SizedBox(height: 12,width: 15,),
         
          Flexible(
          
            child: Text(
              "$title",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 12,width: 15,),
          Expanded(
          
            child: Text(
              subtitle,
              maxLines:8 ,
              textAlign: TextAlign.center,
              style: const TextStyle(
                // fontSize: 20,
              ),
            ),
          ),
         
        ],
      ), )
      
    );
  }
}
