
import 'package:flower/flower_list.dart';
import 'package:flutter/material.dart';
import '../services/flower_service.dart'; 
import 'flower_cart.dart';
import 'flower.dart';

class OfferField extends StatefulWidget {
  @override
  _OfferFieldState createState() => _OfferFieldState();
}

class _OfferFieldState extends State<OfferField> {
  late Future<List<Flower>> futureFlowers;
  List<Flower> boutiqueFlowers = [];
  List<Flower> simpleFlowers = [];
  List<Flower> homeFlowers = [];

  @override
  void initState() {
    super.initState();
    futureFlowers = FlowerService().fetchFlowers();
    futureFlowers.then((flowers) {
      setState(() {
       boutiqueFlowers = flowers.where((f) => f.type == 'boutique').toList(); 
        simpleFlowers = flowers.where((f) => f.type == 'simple').toList(); 
        homeFlowers = flowers.where((f) => f.type == 'home').toList(); 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( 
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 20),
            child: Row(
              children: [
                Text('Онцгой санал', style: TextStyle(color: Color.fromARGB(255, 90, 89, 89), fontSize: 12)),
                Spacer(),
                Text('Бүгдийг харах', style: TextStyle(color: Color.fromARGB(150, 33, 149, 243), fontSize: 12)),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Text('Танд санал болгох', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)),
                    SizedBox(height: 8.0),
                    Text('60% хүртэл', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.red)),
                    SizedBox(height: 8.0),
                    Text('хямдарлаа', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffE975A8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      child: Text('Захиалах', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                Image.asset('assets/images/image1.jpg', height: 150, width: 130)
              ],
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Row(
              children: [
                Text('Танд санал болгох', style: TextStyle(color: Color.fromARGB(255, 107, 107, 107), fontSize: 12)),
                Spacer(),
                ElevatedButton(style: ButtonStyle(  shadowColor: MaterialStatePropertyAll(Colors.transparent), backgroundColor: MaterialStatePropertyAll( Colors.white60)), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>FlowerListScreen())), child: 
                Text('Бүгдийг харах', style: TextStyle(color: Color.fromARGB(150, 33, 149, 243), fontSize: 12))),
              ],
            ),
          ),
        DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                  indicatorColor: Color.fromARGB(255, 231, 56, 132),
                  labelColor: Color.fromARGB(255, 231, 56, 132),
                  unselectedLabelColor: const Color.fromARGB(255, 83, 82, 82),
                  tabs: [
                    Tab(text: 'Баглаа'),
                    Tab(text: 'Тасалгаа'),
                    Tab(text: 'Энгийн'),
                  ], 
                ),
              
                Container(
                  height: 240, 
        
                  child: TabBarView(
                    children: [
                      FlowerListView(flowers: boutiqueFlowers),
                      FlowerListView(flowers: simpleFlowers),
                      FlowerListView(flowers: homeFlowers),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
        
      );
    
  }
}
class FlowerListView extends StatelessWidget {
  final List<Flower> flowers;

  FlowerListView({required this.flowers});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal, 
        itemCount: flowers.length,
        itemBuilder: (context, index) {
          return Container(
            width: 160, 
            child: FlowerCard(flower: flowers[index]), 
          );
        },
      ),
    );
  }
}

