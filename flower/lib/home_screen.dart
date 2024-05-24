import 'package:flower/basket_screen.dart';
import 'package:flower/flower.dart';
import 'package:flutter/material.dart';
import 'package:flower/offer_field.dart';
import 'package:flower/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? username;

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

Future<void> _loadUsername() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    username = prefs.getString('username');
  });
}


  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    setState(() {
      username = null;  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xffE975A8),
                Color(0xffECA1A4),
                Color.fromARGB(255, 235, 129, 175),
              ],
            ),
          ),
        ),
        title: username != null ? GestureDetector(
          onTap: _logout,  
          child: Text('Сайн уу, $username', style: TextStyle(color: Colors.white, fontSize: 12)),
        ) : ElevatedButton(
          onPressed: () => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => LoginScreen(
      onLoginSuccess: _loadUsername,
    ),
  ),

  
          ),
          child: Text('Нэвтрэх', style: TextStyle(color: Colors.white, fontSize: 12)),
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(39, 255, 255, 255),
            minimumSize: Size(8, 25),
            onPrimary: Colors.white,
            elevation: 0,
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(51, 255, 255, 255),
              borderRadius: BorderRadius.circular(8),
            ),
            height: 36,
            width: 36,
            child: Center(
              child: IconButton(
  icon: Icon(Icons.shopping_cart, color: Colors.white),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BasketScreen()),
    );
  },
)

            ),
          ),
          SizedBox(width: 15),
          Container(
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Color.fromARGB(51, 255, 255, 255),
              borderRadius: BorderRadius.circular(8),
            ),
            height: 36,
            width: 36,
            child: Center(
              child: IconButton(
                icon: Icon(Icons.notifications, color: Colors.white),
                onPressed: () => print(' '),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.white),
                    SizedBox(width: 10),
                    Text('Баянзүрх, Улаанбаатар', style: TextStyle(color: Colors.white)),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 43,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Icon(Icons.search, color: Colors.grey),
                      ),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 10),
                            hintText: 'Хайж буй цэцгээ бичнэ үү',
                            hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Icon(Icons.camera_alt, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              OfferField(), 
            ],
          ),
        ),
      ),
    );
  }
}
