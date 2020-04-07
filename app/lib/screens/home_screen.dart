import 'dart:async';
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  Timer interval;
  final Connectivity _connectivity = new Connectivity();
  String _connectionStatus;
  //For subscription to the ConnectivityResult stream
  StreamSubscription<ConnectivityResult> _connectionSubscription;

  final String url =
      "https://standforsudan.ebs-sd.com/StandForSudan/getStandForSudanStatstics";
  var numberofDonations = "000000000";
  var amount = "000000000";

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectionSubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        _connectionStatus = result.toString();
      });
    });
    print("Initstate : $_connectionStatus");
  }

  //For cancelling the stream subscription...
  @override
  void dispose() {
    _connectionSubscription.cancel();
    super.dispose();
  }

  Future<Null> initConnectivity() async {
    String connectionStatus;

    try {
      connectionStatus = (await _connectivity.checkConnectivity()).toString();
    } on Exception catch (e) {
      print(e.toString());
      connectionStatus = "Internet connectivity failed";
    }

    if (!mounted) {
      return;
    }

    setState(() {
      _connectionStatus = connectionStatus;
    });
    print("InitConnectivity : $_connectionStatus");
    checkStatusAndGetData();
    //Check every timer duration if its connected
    Timer.periodic(Duration(seconds: 10), (Timer t) {
      checkStatusAndGetData();
    });
  }

  checkStatusAndGetData() {
    if (_connectionStatus == "ConnectivityResult.mobile" ||
        _connectionStatus == "ConnectivityResult.wifi") {
      print("You are connected! Yaaay");
     //Fluttertoast.showToast(msg: "عندك انترنت");
      this.getJsonDate();
    } else {
      Fluttertoast.showToast(msg: "ما عندك انترنت");
    }
  }

  Future<String> getJsonDate() async {
    var response = await http.get(
        //Url Encoding
        Uri.encodeFull(url),
        //Accept only Json response
        headers: {"Accept": "application/json"});
    var parsedData = json.decode(response.body);
    final formatter = new NumberFormat("#,###", "en_US");
    print("Data:" + response.body);
    print(formatter.format(parsedData['totalAmount']));
    setState(() {
      print("Setting Numbers State");
      numberofDonations = parsedData['numberOfTransaction'].toString();
      amount = formatter.format(parsedData['totalAmount']);
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "جملة التبرعات",
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      amount.toString(),
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "عدد المتبرعين",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      numberofDonations.toString(),
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
