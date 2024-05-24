import 'package:flutter/material.dart';
import '../services/flower_service.dart'; 
import 'flower_cart.dart';
import 'flower.dart';

class FlowerListScreen extends StatefulWidget {
  @override
  FlowerListScreenState createState() => FlowerListScreenState();
}

class FlowerListScreenState extends State<FlowerListScreen> {
  late Future<List<Flower>> futureFlowers;

  @override
  void initState() {
    super.initState();
    futureFlowers = FlowerService().fetchFlowers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Бүх цэцгүүд")),
      body: FutureBuilder<List<Flower>>(
        future: futureFlowers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                childAspectRatio: 0.9, 
                crossAxisSpacing: 2, 
                mainAxisSpacing: 1, 
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return FlowerCard(flower: snapshot.data![index]);
              },
            );
          } else {
            return Center(child: Text("Цэцэг олдсонгүй"));
          }
        },
      ),
    );
  }
}
