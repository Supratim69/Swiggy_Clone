import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swiggy_clone/Screens/MainScreen.dart';
import 'package:swiggy_clone/models/menu_card.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainScreen()));
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: firestore
                      .collection('Restaurants')
                      .doc('behrouz biriyani')
                      .collection('menu')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Text("Loading...");
                    }
                    return ListView.builder(
                      itemExtent: 500.0,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Menu_Card(context, snapshot.data!.docs[index]);
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
