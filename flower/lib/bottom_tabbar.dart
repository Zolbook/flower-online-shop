import 'package:flutter/material.dart';
import 'package:flower/flower_list.dart';
import 'package:flower/home_screen.dart';
import 'package:flower/promotion_screen.dart';
import 'package:flower/login_page.dart';  

class BottomTabbarScreen extends StatefulWidget {
  const BottomTabbarScreen({Key? key}) : super(key: key);

  @override
  State<BottomTabbarScreen> createState() => _BottomTabbarScreenState();
}

class _BottomTabbarScreenState extends State<BottomTabbarScreen> {
  int _tabIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(), 
  HomeScreen(),
    FlowerListScreen(),
    Text("  "), 
  ];
  void refreshHome() {
    setState(() {
  
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        onTap: (index) {
          if (index == 0) {  
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(onLoginSuccess: refreshHome),
              ),
            );
          } else {
            setState(() {
              _tabIndex = index;
            });
          }
        },
        selectedItemColor: Colors.deepPurple[400],
        unselectedItemColor: Colors.grey[300],
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Нүүр',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Хүслийн жагсаалт',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Бараанууд',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профайл',
          ),
        ],
      ),
    );
  }
}

