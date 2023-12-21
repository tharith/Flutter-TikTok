import 'package:flutter/material.dart';
import 'package:gradient_slide_to_act/gradient_slide_to_act.dart';

class SliderGradient extends StatefulWidget {
  const SliderGradient({super.key});

  @override
  State<SliderGradient> createState() => _SliderGradientState();
}

class _SliderGradientState extends State<SliderGradient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Slider"),
      ),
      body: Center(
        child: GradientSlideToAct(
          width: 300,
          textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          backgroundColor: Color.fromARGB(255, 23, 99, 29),
          onSubmit: () {
            print("Submitted!");
          },
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 13, 194, 28),
              Color.fromARGB(255, 8, 87, 5)
            ]
          ),
        ),
      ),
    );
  }
}
