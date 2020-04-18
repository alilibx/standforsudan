import 'package:flutter/material.dart';

class HomeMobilePortrait extends StatelessWidget {
  const HomeMobilePortrait({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.blue,
        ),
      ) ,
    );
  }
}

class HomeMobileLandscape extends StatelessWidget {
  const HomeMobileLandscape({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 300,
          color: Colors.green,
        ),
      ) ,
    );
  }
}
