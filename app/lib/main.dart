import 'package:app/screens/donations_screen.dart';
//import 'package:app/screens/home/home_view.dart';
import 'package:app/styles/colors.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

//void main() => runApp(DevicePreview(builder: (context) => StandForSudan()));
void main() => runApp(StandForSudan());
class StandForSudan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stand For Sudan",
      home: DonationsScreen(),//HomeView(), 
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryBackground,
        accentColor: AppColors.accentText,
      ),
      //debugShowCheckedModeBanner: false,
    );
  }
}
