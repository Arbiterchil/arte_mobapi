
import 'package:arte/constants/color.dart';
import 'package:flutter/material.dart';

class CardPostPublic extends StatelessWidget {

  final String author;
  final String email;
  final String title;
  final String subtitle;
  final String description;
  final String tags;
  final int likes;
  final int dislikes;
  final int hearts;
  final String img;
  final Widget xample;

  const CardPostPublic({Key key, this.author, this.email, this.title, this.subtitle, this.description, this.tags, this.likes, this.dislikes, this.hearts, this.img, this.xample}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 500,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: decent_white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: not_sopure_black.withOpacity(0.1),
              offset: Offset(0.0,0.0),
              blurRadius: 1.0,
              spreadRadius: 1.0
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: [
              rowTop(),
              SizedBox(height: 15,),
              Text(subtitle,style: TextStyle(
                fontSize: 12,
                color: not_sopure_black,
                fontFamily: 'Metropolis-Bold'
              ),),
              SizedBox(height: 10,),
              Text(description,style: TextStyle(
                fontSize: 11,
                color: not_sopure_black.withOpacity(0.4),
                fontFamily: 'Metropolis-Bold'
              ),),
              SizedBox(height: 15,),
              xample
            ],
          ),
          ),
      ),
    );
  }

  Widget rowTop(){

    return Row(
      children: [
       CircleAvatar(
         radius: 30.0,
         backgroundImage: NetworkImage(img),
       ),
       SizedBox(width: 10,),
       Expanded(
         child: Container(
           height: 60,
           decoration: BoxDecoration(
            //  color: darkish_color
           ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(height: 10,),
              Text(author,style: TextStyle(
                fontSize: 16,
                color: not_sopure_black,
                fontFamily: 'Metropolis-Bold'
              ),),
              SizedBox(height: 5,),
              Text(email,style: TextStyle(
                fontSize: 10,
                color: not_sopure_black.withOpacity(0.4),
                fontFamily: 'Metropolis-Bold'
              ),),
            ],
          ), 
         ),
       )
      // Image.network(img)
      ],
    );

  }

}