import 'dart:convert';
import 'package:app/models/donations_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DonationsController {
  //final String url =  "https://standforsudan.ebs-sd.com/StandForSudan/getStandForSudanStatstics";

  final String url =
      "https://standforsudan.ebs-sd.com/StandForSudan/getMultiCurrencyStatistics";

  Future<DonationData> getJsonDate() async {
    var response = await http.get(
        //Url Encoding
        Uri.encodeFull(url),
        //Accept only Json response
        headers: {"Accept": "application/json"});
    var parsedData = json.decode(response.body);
    final formatter = new NumberFormat("#,###", "en_US");
    print("Data:" + response.body);
    print(formatter.format(parsedData['sdg']['totalAmount']));
    if (response != null) {
      return DonationData(
        numberOfDonationsSDG: parsedData['sdg']['numberOfTransaction'],
        amountOfDonationsSDG: parsedData['sdg']['totalAmount'],
        numberOfDonationsUSD: parsedData['usd']['numberOfTransaction'],
        amountOfDonationsUSD: parsedData['usd']['totalAmount'],
      );
    } else
      return null;
  }

    Future<DonationData> loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return DonationData(
        numberOfDonationsSDG: prefs.getString('numberofDonationsSDG') ?? "000000000",
        amountOfDonationsSDG: prefs.getString('totalAmountSDG') ?? "000000000",
        numberOfDonationsUSD: prefs.getString('numberofDonationsUSD') ?? "000000000",
        amountOfDonationsUSD: prefs.getString('totalAmountUSD') ?? "000000000",
      );
  }

  //  setState(() {
  //     final prefs = await SharedPreferences.getInstance();
  //     numberofDonations =
  //         formatter.format(parsedData['sdg']['numberOfTransaction']);
  //     amount = formatter.format(parsedData['sdg']['totalAmount']);
  //     prefs.setString('numberofDonations', numberofDonations);
  //     prefs.setString('amountofDonations', amount);
  //     //_showDialog(context, MessageType.Information,response.body);
  //     lastupdate = new DateFormat("dd-MM-yyyy hh:mm:ss")
  //         .format(DateTime.now())
  //         .toString();
  //   });

}
