import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Function onLoginSuccess;



  LoginScreen({required this.onLoginSuccess, super.key});
  Future<void> login(BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3001/login'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'username': usernameController.text.trim(),
          'password': passwordController.text.trim(),
        }),
      );
  


      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token']['token'];
        final username = data['token']['username'];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', username);

        onLoginSuccess();
        Navigator.pop(context);
      
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Нэвтрэлт амжилтгүй (${response.statusCode})')),
        );
      }
    
    } 
    catch (error) {
      print('Алдаа: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Алдаа гарлаа')),
      );
    }
  }

  void navigateToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterScreen(
          onLoginSuccess: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Нэвтрэх', style: TextStyle(color: Colors.white),),
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
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Нэвтрэх нэр',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Нууц үг',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
            
            ElevatedButton(
              onPressed: () => login(context),
              child: Text('Нэвтрэх'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 235, 129, 175),
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            SizedBox(height: 10, width: 20,),
            ElevatedButton(
              onPressed: () => navigateToRegister(context),
              child: Text('Бүртгүүлэх'),
              style: ElevatedButton.styleFrom(
               
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            )]),
          ],
        ),
      ),
    );
  }
}
