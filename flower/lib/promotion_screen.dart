import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class User {
  final int id; 
  String username;
  String password;

  User({required this.id, required this.username, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'username': this.username,
      'password': this.password,
    };
  }
}

class RegisterScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterScreen({Key? key}) : super(key: key);

Future<void> register(BuildContext context) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:3001/register'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'username': usernameController.text.trim(),
      'password': passwordController.text.trim(),
    }),
  );

  if (response.statusCode == 201) {
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Бүртгэл амжилттай')),
    );
  
    usernameController.clear();
    passwordController.clear();
  } else {
   
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Бүртгэл амжилтгүй: ${response.body}')),
    );
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Бүртгүүлэх')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Нэвтрэх нэр'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Нээ'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => register(context),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
