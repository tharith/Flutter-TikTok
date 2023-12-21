import 'package:flutter/material.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/no_internet.png"),
            const SizedBox(height: 30.0,),
            const Text(
              "No Internet Connection",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}
