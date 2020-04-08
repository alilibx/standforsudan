import 'package:app/screens/donations_screen.dart';
import 'package:flutter/material.dart';

class HowToDonate extends StatelessWidget {
  void onStatsButtonPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => DonationsScreen()));

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}