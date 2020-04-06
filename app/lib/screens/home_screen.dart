import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  Timer interval;

  final String url =
      "https://standforsudan.ebs-sd.com/StandForSudan/getStandForSudanStatstics";
  var numberofDonations;
  var amount;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 60), (Timer t) {
      this.getJsonDate();
    });
  }

  Future<String> getJsonDate() async {
    var response = await http.get(
        //Url Encoding
        Uri.encodeFull(url),
        //Accept only Json response
        headers: {"Accept": "application/json"});

    //print(response.body);

    setState(() {
      var parsedData = json.decode(response.body);
      numberofDonations = parsedData['numberOfTransaction'];
      amount = parsedData['totalAmount'];
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Column(
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
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "عدد المتبرعين",
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        numberofDonations.toString(),
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
