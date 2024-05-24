import 'package:flower/basket_not.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flower/bottom_tabbar.dart'; 

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Basket(), 
      child: MyApp(), 
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flower',
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      home: BottomTabbarScreen(),  
    );
  }
}
