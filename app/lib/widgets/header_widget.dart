import 'package:app/styles/colors.dart';
import 'package:app/utils/shared.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: (Shared().screenHeight(context)/4)/5),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      iconSize: 14.0,
                      icon: Image.asset('assets/images/group-32.png'),
                      onPressed: () {},
                    ),
                    Text(
                      'StandForSudan',
                      style: TextStyle(
                        fontSize: 14.0,
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
                    fontSize: 14.0,
                    fontFamily: 'DIN Next LT Arabic',
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentText,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: (Shared().screenHeight(context)/4)/4.5),
            child: Center(
              child: Text(
                'الإحصائيات',
                style: TextStyle(
                  fontSize: 37.0,
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
