import 'dart:convert';
import 'package:flower/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Function onLoginSuccess;

  RegisterScreen({super.key, required this.onLoginSuccess});

  Future<void> register(BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3001/register'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'username': usernameController.text.trim(),
          'password': passwordController.text.trim(),
        }),
      );


      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final username = data['username'];
 
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', username);

        onLoginSuccess();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Бүртгэл амжилттай')),
        );

     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Бүртгэл амжилтгүй (${response.statusCode})')),
        );
      }
    } catch (error) {
      print(' $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Алдаа гарлаа')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Бүртгүүлэх', style: TextStyle(color: Colors.white)),
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
            ElevatedButton(
              onPressed: () => register(context),
              child: Text('Бүртгүүлэх'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 235, 129, 175),
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
