import 'package:flower/about_flower.dart';
import 'package:flower/basket_not.dart';
import 'package:flutter/material.dart';
import 'flower.dart';

import 'package:provider/provider.dart';

class FlowerCard extends StatelessWidget {
  final Flower flower;

  FlowerCard({required this.flower});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () {
    Provider.of<Basket>(context, listen: false).addItem(flower); 
    Navigator.push(  
      context,
      MaterialPageRoute(builder: (context) => AboutFlower(flower: flower)),
    );
  },
      child: Container(
      
   height: 180,
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
            Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.favorite, color: const Color.fromARGB(255, 243, 93, 83)),
            ),
            Image.network(
              flower.image_url,
              fit: BoxFit.contain,
              width: double.infinity,
              height: 120,
            ),
      SizedBox(height: 5,),
            Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               
                  Text(
                    flower.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.5,
                    ),
                 
                  ),
                Row(children: [       Icon(Icons.star, color: Colors.amber, size: 18),
                Text(
                  flower.rating.toString(),
                  style: TextStyle(
                    
                    fontSize: 11,
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
