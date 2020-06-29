import 'dart:async';
import 'dart:convert';
import 'package:app/utils/elements_size.dart';
import 'package:app/screens/howtodonate_screen.dart';
import 'package:app/widgets/faderoute.dart';
import 'package:http/http.dart' as http;
import 'package:app/utils/colors.dart';
import 'package:app/widgets/header_widget.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DonationsScreen extends StatefulWidget {
  @override
  _DonationsScreenState createState() => _DonationsScreenState();
}

enum MessageType { Alert, Information, Warning, Error }

class _DonationsScreenState extends State<DonationsScreen> {
  Timer interval;
  final Connectivity _connectivity = new Connectivity();
  String _connectionStatus;
  //For subscription to the ConnectivityResult stream
  StreamSubscription<ConnectivityResult> _connectionSubscription;

  //final String url =  "https://standforsudan.ebs-sd.com/StandForSudan/getStandForSudanStatstics";

  final String url =
      "https://standforsudan.ebs-sd.com/StandForSudan/getMultiCurrencyStatistics";

  var numberofDonations = "000000000";
  var amount = "000000000";

  //var numberofDonations_usd = "000000000";
  //var amount_usd = "000000000";

  var lastupdate =
      new DateFormat("dd-MM-yyyy hh:mm:ss").format(DateTime.now()).toString();

  @override
  initState() {
    super.initState();
    print("SFS: init State");

    print("Donations:$numberofDonations Amount: $amount");
    _loadCounter();
    initConnectivity();
    _connectionSubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        _connectionStatus = result.toString();
      });
    });
    print("Connection : $_connectionStatus");
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      numberofDonations = prefs.getString('numberofDonations') ?? "000000000";
      amount = prefs.getString('amountofDonations') ?? "000000000";
    });
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
      print("Connection Erro: $e.toString()");
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
      AlertDialog(
        title: Text('You are connected! Yaaay'),
      );
      //Fluttertoast.showToast(msg: "عندك انترنت");
      this.getJsonDate();
    } else {
      AlertDialog(
        title: Text('No Internet Connection'),
      );
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
    print(formatter.format(parsedData['sdg']['totalAmount']));
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      numberofDonations =
          formatter.format(parsedData['sdg']['numberOfTransaction']);
      amount = formatter.format(parsedData['sdg']['totalAmount']);
      prefs.setString('numberofDonations', numberofDonations);
      prefs.setString('amountofDonations', amount);
      //_showDialog(context, MessageType.Information,response.body);
      lastupdate = new DateFormat("dd-MM-yyyy hh:mm:ss")
          .format(DateTime.now())
          .toString();
    });

    return "Success";
  }

  void onHowToButtonPressed(BuildContext context) =>
      Navigator.push(context, FadeRoute(page: HowToDonate()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.primaryBackground,
          child: Column(
            children: <Widget>[
              HeaderWidget(title: 'الإحصائيات'),
              Expanded(
                child: Container(
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
                                fontSize: ElementsSize().textSize(context, 13),
                                fontFamily: 'DIN Next LT Arabic',
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryText,
                              ),
                            ),
                            Text(
                              numberofDonations,
                              style: TextStyle(
                                fontSize: ElementsSize().textSize(context, 8),
                                fontFamily: 'DIN Next LT Arabic',
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondaryText,
                              ),
                            ),
                            Text(
                              'معاملة',
                              style: TextStyle(
                                fontSize: ElementsSize().textSize(context, 18),
                                fontFamily: 'DIN Next LT Arabic',
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryText,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'جملة التبرعات',
                                style: TextStyle(
                                  fontSize:
                                      ElementsSize().textSize(context, 13),
                                  fontFamily: 'DIN Next LT Arabic',
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryText,
                                ),
                              ),
                              Text(
                                amount,
                                style: TextStyle(
                                  fontSize: ElementsSize().textSize(context, 8),
                                  fontFamily: 'DIN Next LT Arabic',
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.secondaryText,
                                ),
                              ),
                              Text(
                                'جنيه سوداني',
                                style: TextStyle(
                                  fontSize:
                                      ElementsSize().textSize(context, 18),
                                  fontFamily: 'DIN Next LT Arabic',
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryText,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    lastupdate,
                                    style: TextStyle(
                                      fontSize:
                                          ElementsSize().textSize(context, 32),
                                      fontFamily: 'DIN Next LT Arabic',
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryBackground,
                                    ),
                                  ),
                                  Text(
                                    '  اخر تحديث',
                                    style: TextStyle(
                                      fontSize:
                                          ElementsSize().textSize(context, 32),
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
                                  fontSize:
                                      ElementsSize().textSize(context, 32),
                                  fontFamily: 'DIN Next LT Arabic',
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryBackground,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    height: 50.0,
                                    width: 120.0,
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryBackground,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0))),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        'الإحصائيات',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: 'DIN Next LT Arabic',
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.accentText,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      onHowToButtonPressed(context);
                                    },
                                    child: Container(
                                      height: 50.0,
                                      width: 120.0,
                                      decoration: BoxDecoration(
                                          color: AppColors.accentText,
                                          border: Border.all(
                                              color: AppColors.primaryText,
                                              width: 3.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30.0))),
                                      child: Padding(
                                        padding: EdgeInsets.all(7.0),
                                        child: Text(
                                          'كيفية التبرع؟',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14.0,
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
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
