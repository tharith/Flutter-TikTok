import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';

class CircleSeekBarScreen extends StatefulWidget {
  const CircleSeekBarScreen({super.key});

  @override
  State<CircleSeekBarScreen> createState() => _CircleSeekBarScreenState();
}

class _CircleSeekBarScreenState extends State<CircleSeekBarScreen> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  double _progress = 100;

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Circle Seek Bar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 15.0,),
            CircularSeekBar(
              width: double.infinity,
              height: 250,
              progress: _progress,
              barWidth: 15,
              startAngle: 45,
              trackColor: Colors.black12,
              sweepAngle: 360,
              strokeCap: StrokeCap.butt,
              progressGradientColors: [
                Colors.red, Colors.orange, Colors.yellow, Colors.green,
                Colors.blue, Colors.indigo, Colors.purple
              ],
              innerThumbRadius: 5,
              innerThumbStrokeWidth: 3,
              innerThumbColor: Colors.white,
              outerThumbRadius: 10,
              outerThumbStrokeWidth: 10,
              outerThumbColor: Colors.blueAccent,
              dashWidth: 5,
              dashGap: 5,
              animation: true,
              curves: Curves.bounceInOut,
              valueNotifier: _valueNotifier,
              child: Center(
                child: ValueListenableBuilder(
                  valueListenable: _valueNotifier,
                  builder: (_, double value, __) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${value.round()}",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20
                        ),
                      ),
                      Text(
                        "Progress",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20
                        ),
                      )
                    ],
                  )
                ),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            "Progress",
                            style: TextStyle(
                              color: Colors.red
                            ),
                          ),
                          Slider(
                            min: 0.0,
                            max: 100.0,
                            value: _progress,
                            activeColor: Colors.red,
                            inactiveColor: Colors.blueAccent,
                            onChanged: (value) {
                              setState(() {
                                _progress = value;
                              });
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

