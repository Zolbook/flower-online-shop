import 'package:flutter/material.dart';
import 'flower.dart';
import 'about_flower.dart';

class FlowerCard1 extends StatelessWidget {
  final Flower flower;

  FlowerCard1({required this.flower});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutFlower(flower: flower)),
        );
      },
      child: Container(
      
   height: 200,
   width:130,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
       
            Image.network(
              flower.image_url,
              fit: BoxFit.contain,
              width: double.infinity,
              height: 150,
            ),
      SizedBox(height: 5,),
            Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               
                  Text(
                    flower.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.5,
                    ),
                 
                  ),
                Row(children: [       Icon(Icons.star, color: Colors.amber, size: 18),
                Text(
                  flower.rating.toString(),
                  style: TextStyle(
                    
                    fontSize: 13,
                  ),
                ),],)
         
              ],
            ),
          ],
        ),
      ),
    );
  }
}
