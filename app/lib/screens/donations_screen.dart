import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app/styles/colors.dart';
import 'package:app/utils/shared.dart';
import 'package:app/widgets/header_widget.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class DonationsScreen extends StatefulWidget {
  @override
  _DonationsScreenState createState() => _DonationsScreenState();
}

class _DonationsScreenState extends State<DonationsScreen> {
  Timer interval;
  final Connectivity _connectivity = new Connectivity();
  String _connectionStatus;
  //For subscription to the ConnectivityResult stream
  StreamSubscription<ConnectivityResult> _connectionSubscription;

  final String url =
      "https://standforsudan.ebs-sd.com/StandForSudan/getStandForSudanStatstics";
  var numberofDonations = "000000000";
  var amount = "000000000";
  var lastupdate =
      new DateFormat("dd-MM-yyyy hh:mm:ss").format(DateTime.now()).toString();

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
    Timer.periodic(Duration(seconds: 60), (Timer t) {
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
      Fluttertoast.showToast(
          msg: "ما عندك انترنت",
          backgroundColor: AppColors.primaryBackground,
          textColor: AppColors.accentText,
          fontSize: 14);
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
      numberofDonations = formatter.format(parsedData['numberOfTransaction']);
      amount = formatter.format(parsedData['totalAmount']);
      lastupdate = new DateFormat("dd-MM-yyyy hh:mm:ss")
          .format(DateTime.now())
          .toString();
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 4),
        child: AppBar(
          flexibleSpace: HeaderWidget(),
          elevation: 0.0,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: Shared().screenWidth(context),
              decoration: BoxDecoration(
                  color: AppColors.accentText,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )),
              child: Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'عدد التبرعات',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontFamily: 'DIN Next LT Arabic',
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryText,
                          ),
                        ),
                        Text(
                          numberofDonations,
                          style: TextStyle(
                            fontSize: 44.0,
                            fontFamily: 'DIN Next LT Arabic',
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondaryText,
                          ),
                        ),
                        Text(
                          'معاملة',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'DIN Next LT Arabic',
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryText,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'جملة التبرعات',
                            style: TextStyle(
                              fontSize: 28.0,
                              fontFamily: 'DIN Next LT Arabic',
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryText,
                            ),
                          ),
                          Text(
                            amount,
                            style: TextStyle(
                              fontSize: 44.0,
                              fontFamily: 'DIN Next LT Arabic',
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondaryText,
                            ),
                          ),
                          Text(
                            'جنيه سوداني',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'DIN Next LT Arabic',
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryText,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                lastupdate,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: 'DIN Next LT Arabic',
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryBackground,
                                ),
                              ),
                              Text(
                                '  اخر تحديث',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: 'DIN Next LT Arabic',
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryBackground,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'البيانات تمثل جملة مدخلات حساب القومة للسودان و تحدث كل 60 ثانية',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: 'DIN Next LT Arabic',
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryBackground,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 35.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 50.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                                color: AppColors.primaryBackground,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0))),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'الإحصائيات',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'DIN Next LT Arabic',
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.accentText,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print('How to Donate');
                            },
                            child: Container(
                              height: 50.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                  color: AppColors.accentText,
                                  border: Border.all(
                                      color: AppColors.primaryText, width: 3.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0))),
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'كيفية التبرع؟',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'DIN Next LT Arabic',
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryText,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}