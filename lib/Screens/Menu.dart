import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swiggy_clone/Screens/MainScreen.dart';
import 'package:swiggy_clone/models/menu_card.dart';

class Menu extends StatefulWidget {
  const Menu(this.document_id, {super.key});
  final String document_id;

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
                      .doc(widget.document_id)
                      .collection('menu')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: Text("Loading..."));
                    }

                    return ListView.builder(
                      itemExtent: 100,
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
