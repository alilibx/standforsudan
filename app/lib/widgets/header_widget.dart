import 'package:app/styles/colors.dart';
import 'package:app/utils/shared.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;

  HeaderWidget({Key key, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: (Shared().screenHeight(context) / 4) / 6),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Shared().textSize(context, 24)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      iconSize: Shared().textSize(context, 28),
                      icon: Image.asset('assets/images/group-32.png'),
                      onPressed: () {},
                    ),
                    Text(
                      'StandForSudan',
                      style: TextStyle(
                        fontSize: Shared().textSize(context, 28),
                        fontFamily: 'DIN Next LT Arabic',
                        fontWeight: FontWeight.bold,
                        color: AppColors.accentText,
                      ),
                    ),
                  ],
                ),
                Text(
                  'القومة للسودان',
                  style: TextStyle(
                    fontSize: Shared().textSize(context, 28),
                    fontFamily: 'DIN Next LT Arabic',
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentText,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: (Shared().screenHeight(context) / 4) / 4.5),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: Shared().textSize(context, 10),
                  fontFamily: 'DIN Next LT Arabic',
                  fontWeight: FontWeight.bold,
                  color: AppColors.accentText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
