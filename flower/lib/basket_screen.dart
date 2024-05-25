import 'package:flower/basket_not.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flower/flower.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  BasketScreenState createState() => BasketScreenState();
}

class BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    var basket = Provider.of<Basket>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Сагс'),
      ),
      body: ListView.builder(
        itemCount: basket.items.length,
        itemBuilder: (context, index) {
          Flower flower = basket.items.keys.elementAt(index);
          int quantity = basket.items[flower]!;

          return ListTile(
              leading: Image.network(flower.image_url, width: 50, height: 50),
              title: Text(flower.name),
              subtitle: Text('Тоо ширхэг: $quantity'),
              subtitle: Text('Тоо ширхэгүүд: $quantity'),
              trailing: Expanded(
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 240, 239, 239),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.add, color: const Color.fromARGB(255, 234, 112, 104),),
                          onPressed: () {
                            basket.updateItem(flower, quantity + 1);
                          },
                        ),
                        Text(
                          '$quantity',
                          style: TextStyle(fontSize: 15),
                        ),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            basket.updateItem(flower, quantity - 1);
                          },
                        ),
                      ],
                    )),
                    SizedBox(width: 10),
                IconButton(
                  icon: Icon(
                    Icons.delete_forever, color: const Color.fromARGB(255, 117, 116, 116),
                    size: 29,
                  ),
                  onPressed: () {
                    basket.removeItem(flower);
                  },
                ),
              ])));
        },
      ),
    );
  }
}
