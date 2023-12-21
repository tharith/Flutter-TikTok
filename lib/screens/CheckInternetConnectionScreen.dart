import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_for_tiktok/screens/NoInternetScreen.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckInternetConnectionScreen extends StatefulWidget {
  const CheckInternetConnectionScreen({Key? key}) : super(key: key);

  @override
  State<CheckInternetConnectionScreen> createState() => _CheckInternetConnectionScreenState();
}

class _CheckInternetConnectionScreenState extends State<CheckInternetConnectionScreen> {
  bool hasInternet = false;
  ConnectivityResult result = ConnectivityResult.none;

  @override
  void initState() {
    // TODO: implement initState
    InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;
      setState(() {
        this.hasInternet = hasInternet;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => OverlaySupport.global(
    child: MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Check Internet Connection"),
        ),
        body: hasInternet ? Center(
          child: ElevatedButton(
            onPressed: () async {
              result = await Connectivity().checkConnectivity();
              showTopSnackBar(result, context);
            },
            child: const Text("Check Connection"),
          ),
        ) : const NoInternetScreen(),
      ),
    ),
  );

  void showTopSnackBar(ConnectivityResult result, BuildContext context) {
    var netConnect = false;
    if (result != ConnectivityResult.none) {
      netConnect = true;
    }
    if (result == ConnectivityResult.mobile) {
      Fluttertoast.showToast(
        msg: "Mobile Internet",
        gravity: ToastGravity.BOTTOM
      );
    } else if (result == ConnectivityResult.wifi) {
      Fluttertoast.showToast(
          msg: "Wifi Internet",
          gravity: ToastGravity.BOTTOM
      );
    } else {
      Fluttertoast.showToast(
          msg: "No internet",
          gravity: ToastGravity.BOTTOM
      );
    }

    final message = netConnect
            ? "You have internet"
            : "You have no internet";
    final color = netConnect ? Colors.green: Colors.red;
    showSimpleNotification(
      Text(
        message
      ),
      background: color
    );
  }
}
