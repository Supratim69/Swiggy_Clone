import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget Menu_Card(BuildContext context, DocumentSnapshot document) {
  return Card(
    elevation: 3,
    margin: EdgeInsets.all(8),
    child: Padding(
      padding: const EdgeInsets.all(7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 180),
            child: Text(
              document['Name'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              "₹" + document['Price'],
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Container(
                constraints: BoxConstraints(maxWidth: 80),
                child: const Text('Add to Cart')),
          ),
        ],
      ),
    ),
  );
}
