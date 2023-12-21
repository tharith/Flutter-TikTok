import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';
import 'dart:math';

class ScratchCard extends StatefulWidget {
  const ScratchCard({super.key});

  @override
  State<ScratchCard> createState() => _ScratchCardState();
}

class _ScratchCardState extends State<ScratchCard> {

  double _opacity = 0.0;
  int randomNumber = 0;
  var random = Random();

  // Create scratch dialogue
  Future<void> scratchDialogue(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          title: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "You earned gift",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Divider(
                  color: Colors.black,
                ),
              )
            ],
          ),

          content: StatefulBuilder(builder: (context, StateSetter setState) {
            return Scratcher(
              color: Colors.grey,
              accuracy: ScratchAccuracy.low,
              threshold: 5,
              brushSize: 60,
              onThreshold: () {
                setState(() {
                  _opacity = 1;
                  // random number
                  randomNumber = random.nextInt(90) + 10;
                });
              },
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 100),
                opacity: _opacity,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    children: [
                      Text(
                        "Hey! you won",
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                      SizedBox(height: 20,),
                      Expanded(
                        child: Text(
                          "$randomNumber\$",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                            color: Colors.blue,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Scratch Card"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            scratchDialogue(context);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            backgroundColor: Colors.black
          ),
          child: Text(
            "Scratch Card",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}
