import 'package:flower/flower_cart1.dart';
import 'package:flutter/material.dart';
import 'package:flower/flower.dart';

import 'package:flower/add_button.dart';

class AboutFlower extends StatefulWidget {
  final Flower flower;

  const AboutFlower({super.key, required this.flower});

  @override
  _AboutFlowerState createState() => _AboutFlowerState();
}

class _AboutFlowerState extends State<AboutFlower> {
  int quantity = 1;
  late int totalCost;

  @override
  void initState() {
    super.initState();
    totalCost = widget.flower.price;  
  }

  void updateQuantity(int change) {
    if ((quantity + change) > 0) {  
      setState(() {
        quantity += change;
        totalCost = quantity * widget.flower.price; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
         
            Container(
              height: 320,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: const BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  Positioned(
                    top: 30,
                    left: 10,
                    right: 10,
                    bottom: 10,
                    child: FlowerCard1(flower: widget.flower),
                  ),
                  Positioned(
                    top: 50,
                    left: 30,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  Positioned(
                    top: 67,
                    right: 75,
                    child: const Icon(Icons.share, color: Color.fromARGB(205, 36, 36, 36), size: 22),
                  ),
                  Positioned(
                    top: 67,
                    right: 40,
                    child: const Icon(Icons.favorite_border, color: Color.fromARGB(192, 35, 35, 35), size: 22),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                'Бүтээгдэхүүний дэлгэрэнгүй',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                widget.flower.description,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 89, 88, 88),
                ),
              ),
            ),
       
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40,),
              child:
              Container( width: double.infinity,  height: 70,
              margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Color.fromARGB(62, 193, 192, 192), borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/zurag.png', height: 50, width: 50, ),
              
                  Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Д.Дөлгөөн'), Text('Цэцэгчин')],),    
                  IconButton(
                    icon: const Icon(Icons.message),
                    onPressed: () {},  
                  ),
                  IconButton(
                    icon: const Icon(Icons.phone),
                    onPressed: () {},  
                  ),
                ],
              )),
            ),
          SizedBox(height: 30,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisAlignment:MainAxisAlignment.center, children:[
                Text(
                  'Үнэ: $totalCost₮',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ), SizedBox(width: 30,),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                          IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => updateQuantity(1),
                        color: Colors.green,
                      ), Text(quantity.toString(), style: const TextStyle(fontSize: 20)),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => updateQuantity(-1),
                        color: Colors.red,
                      ),
                     
        
                    ],
                  ),
                )
                ]
                ),
                SizedBox(height: 18,),
                AddToCartButton(id: widget.flower.id),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
