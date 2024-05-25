import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  final int id;
  

  AddToCartButton({required this.id});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {
        
      },
      style: ElevatedButton.styleFrom(

        primary: Color(0xffE975A8),
        onPrimary: Colors.white, 
      ),
      child: Text('Сагсанд нэмэх'),
    );
  }
}
