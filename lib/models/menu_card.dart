import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget Menu_Card(BuildContext context, DocumentSnapshot document) {
  return ListView.builder(
    itemCount: 3,
    itemBuilder: (context, index) {
      String dishName = document['Dish-${index + 1}'];
      return Card(
        elevation: 3,
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dishName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add to Cart'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
