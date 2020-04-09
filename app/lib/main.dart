
import 'package:app/screens/donations_screen.dart';
import 'package:app/styles/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      title: "Stand For Sudan",
      home: DonationsScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryBackground,
        accentColor: AppColors.accentText,
        ),
      //debugShowCheckedModeBanner: false,
    ));
}