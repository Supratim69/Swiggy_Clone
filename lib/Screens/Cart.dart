import 'package:flutter/material.dart';
import 'package:swiggy_clone/Screens/MainScreen.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainScreen()));
            // Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: const Center(child: Text("Cart Empty")),
    );
  }
}
