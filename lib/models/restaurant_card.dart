import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swiggy_clone/Screens/Menu.dart';

// class Res_Card extends StatelessWidget {
//   const Res_Card(this.res_name, this.res_reviews, {super.key});
//   // final String res_icon;
//   final String res_name;
//   final String res_reviews;

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () {},
//       child: Container(
//         child: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(25),
//                 child: Image.asset(
//                   'assets/Tiles_images/Biriyani.jpg',
//                   height: 200,
//                   width: 200,
//                 ),
//               ),
//             ),
//             Column(
//               children: [
//                 Text(
//                   res_name,
//                   style: TextStyle(fontSize: 20),
//                 ),
//                 Text(res_reviews)
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class MockInfo {
//   const MockInfo(this.res_name, this.res_reviews);
//   final String res_name;
//   final String res_reviews;
// }

// Widget Res_Card(BuildContext context, DocumentSnapshot document) {
//   return SizedBox(
//     height: 500,
//     child: TextButton(
//       onPressed: () {},
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(25),
//               child: Image.asset(
//                 'assets/Tiles_images/Biriyani.jpg',
//                 // height: 300,
//                 // width: 100,
//               ),
//             ),
//           ),
//           Column(
//             children: [
//               Text(
//                 document["Store Name"],
//                 style: const TextStyle(fontSize: 20),
//               ),
//               Text(document["Reviews"])
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }
Widget Res_Card(BuildContext context, DocumentSnapshot document) {
  return TextButton(
    style: TextButton.styleFrom(
      backgroundColor: Color.fromARGB(23, 158, 158, 158),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
    ),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
    },
    // style: TextButton.styleFrom(padding: EdgeInsets.zero),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(6),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              document['Icon'],
              height: 200,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                document["Store Name"],
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(document["Reviews"] + "/5 stars"),
            ],
          ),
        ),
      ],
    ),
  );
}
