import 'package:flutter/material.dart';
import 'package:swiggy_clone/Screens/ProfilePage.dart';
import 'package:swiggy_clone/models/restaurant_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<Res_Card> res_list = const [
  //   Res_Card(
  //       "assets/Tiles_images/Biriyani.jpg", "The Biriyani Life", "4.2 stars"),
  //   Res_Card("assets/Tiles_images/Noodles.jpg", "Noodle Store", "3 stars"),
  //   Res_Card(
  //       "assets/Tiles_images/Biriyani.jpg", "The Biriyani Life", "4.2 stars"),
  // ];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        leading: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Profile()));
          },
          child: const Icon(
            Icons.account_circle_outlined,
            size: 40,
          ),
        ),
        leadingWidth: 80,
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/Food Banner.jpg"),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Welcome to Viggy!!",
              style: TextStyle(
                color: Colors.orangeAccent,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for restaurants',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: firestore.collection('Restaurants').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("Loading...");
                  }
                  return ListView.builder(
                    itemExtent: 120,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Res_Card(context, snapshot.data!.docs[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
