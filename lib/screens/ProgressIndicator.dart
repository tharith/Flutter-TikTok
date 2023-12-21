import 'package:flutter/material.dart';

class ShowProgressIndicator extends StatefulWidget {
  const ShowProgressIndicator({super.key});

  @override
  State<ShowProgressIndicator> createState() => _ShowProgressIndicator();
}

class _ShowProgressIndicator extends State<ShowProgressIndicator> {
  int _counter = 0;
  Future _incrementCounter() async {
    return Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _counter++;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Loading Indicator"),
      ),
      body: Center(
        child: Text(
          "Current counter is $_counter",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onPressed(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _onPressed(BuildContext context) async {
    DialogBuilder(context).showLoadingIndicator("Calculating $_counter + 1");
    await _incrementCounter();
    DialogBuilder(context).hideOpenDialog();
  }
}

// create class dialogBuilder
class DialogBuilder {
  DialogBuilder(this.context);
  final BuildContext context;

  void showLoadingIndicator([String? text]) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))
            ),
            backgroundColor: Colors.black87,
            content: LoadingIndicator(
              text: text!
            ),
          ),
        );
      }
    );
  }

  void hideOpenDialog() {
    Navigator.of(context).pop();
  }
}

// create class LoadingIndicator
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.text = ''});
  final String text;

  @override
  Widget build(BuildContext context) {
    var displayText = text;
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.black87,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _getLoadingIndicator(),
          _getHeading(context),
          _getText(displayText)
        ],
      ),
    );
  }

  Padding _getLoadingIndicator() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: SizedBox(
        width: 45,
        height: 45,
        child: CircularProgressIndicator(
          strokeWidth: 4,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _getHeading(context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4),
      child: Text(
        "Please wait...",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Text _getText(String displayText) {
    return Text(
      displayText,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20
      ),
      textAlign: TextAlign.center,
    );
  }
}


