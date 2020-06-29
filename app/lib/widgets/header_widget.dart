import 'package:app/utils/colors.dart';
import 'package:app/utils/elements_size.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;

  HeaderWidget({Key key, @required this.title});

  @override
  Widget build(BuildContext context) {
    print(ElementsSize().screenHeight(context).toString());
    return Container(
      width: ElementsSize().screenWidth(context),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ElementsSize().textSize(context, 24)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      iconSize: ElementsSize().textSize(context, 28),
                      icon: Image.asset('assets/images/group-32.png'),
                      onPressed: () {},
                    ),
                    Text(
                      'StandForSudan',
                      style: TextStyle(
                        fontSize: ElementsSize().textSize(context, 28),
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
                    fontSize: ElementsSize().textSize(context, 28),
                    fontFamily: 'DIN Next LT Arabic',
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentText,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: ElementsSize().textSize(context, 10),
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
