
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flower/flower.dart';

class FlowerService {
  Future<List<Flower>> fetchFlowers() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3008/flowers'));

    if (response.statusCode == 200) {
      List<dynamic> flowersJson = jsonDecode(response.body);
      return flowersJson.map((json) => Flower.fromJson(json)).toList();
    } else {
      throw Exception('Алдаа гарлаа');
    }
  }
}
