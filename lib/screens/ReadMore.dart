import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ReadMore extends StatelessWidget {
  const ReadMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Read More"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: ReadMoreText(
                'GeeksForGeeks is the best tutorial website for programmers. '
                    'If you are beginner or intermediate or expert programmer GeeksForGeeks is '
                    'the best website for learning to code and learn different frameworks.',
                trimLines: 2,
                textScaleFactor: 1,
                colorClickableText: Colors.red,
                trimMode: TrimMode.Line,
                trimCollapsedText: "...Read more",
                trimExpandedText: "Less",
                style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold),
                moreStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
