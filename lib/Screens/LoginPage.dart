import 'package:flutter/material.dart';
import 'package:swiggy_clone/Screens/MainScreen.dart';
import 'package:swiggy_clone/services/firebase_services.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 75,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () async {
                await FirebaseServices().signInWithGoogle();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/google-logo.png",
                    height: 35,
                    width: 35,
                  ),
                  const Text(
                    "Login with google",
                    style: TextStyle(fontSize: 22),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
