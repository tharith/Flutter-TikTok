import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class DownloadFile extends StatelessWidget {

  // create custom progress bar
  _customProgress(context) async {
    ProgressDialog progressDialog = ProgressDialog(context: context);
    // show the state of preparation first
    progressDialog.show(
      max: 100, // number of file to download
      msg: "Preparing Download...",progressType: ProgressType.valuable,
      backgroundColor: Colors.black87,
      progressValueColor: Colors.blue,
      progressBgColor: Colors.white70,
      msgColor: Colors.white,
      valueColor: Colors.white,
      msgFontSize: 21.0,
      msgFontWeight: FontWeight.w600,
      valueFontSize: 18.0
    );

    // added to test late loading start
    await Future.delayed(const Duration(milliseconds: 3000));
    for (int i = 0; i <=100; i++) {
      // indicate here that the download has start
      progressDialog.update(value: i, msg: "File Downloading...");
      i++;
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Download File",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0
                  ),
                ),
              ),
              MaterialButton(
                color: Colors.orange,
                child: const Text(
                  "Donwload",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700
                  ),
                ),
                onPressed: () {
                  _customProgress(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
