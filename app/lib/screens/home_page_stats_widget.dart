/*
*  home_page_stats_widget.dart
*  Stand For Sudan
*
*  Created by Ali Alhashimi.
*  Copyright © 2018 Penstash. All rights reserved.
    */

import 'package:app/screens/how_to_page_widget.dart';
import 'package:app/styles/colors.dart';
import 'package:app/styles/h1_style.dart';
import 'package:app/styles/h2_style.dart';
import 'package:app/styles/main_btn_style.dart';
import 'package:app/styles/number_style.dart';
import 'package:app/styles/other_btn_style.dart';
import 'package:flutter/material.dart';


class HomePageStatsWidget extends StatelessWidget {
  
  void onHowToButtonPressed(BuildContext context) {
  
  }
  
  void onButtonPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => HowToPageWidget()));
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 360,
                height: 18,
                margin: EdgeInsets.only(top: 48),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      right: -4,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 35,
                              height: 14,
                              child: Image.asset(
                                "assets/images/group-32.png",
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.only(top: 39),
                              child: Text(
                                "الإحصائيات",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.accentText,
                                  fontFamily: "DIN Next LT Arabic",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 44,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              " القومة للسودان",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.accentText,
                                fontFamily: "DIN Next LT Arabic",
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 36,
                      child: Text(
                        " StandForSudan",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.accentText,
                          fontFamily: "DIN Next LT Arabic",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 769,
              margin: EdgeInsets.only(top: 116),
              decoration: BoxDecoration(
                color: AppColors.accentText,
                borderRadius: BorderRadius.all(Radius.circular(45)),
              ),
              child: Column(
                children: [
                  Container(
                    width: 259,
                    height: 378,
                    margin: EdgeInsets.only(top: 33),
                    child: Column(
                      children: [
                        Container(
                          width: 171,
                          height: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 3),
                                child: H1style(
                                  child: Text(
                                    "عدد التبرعات",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: 11, top: 50),
                                  child: Numberstyle(
                                    child: Text(
                                      "78.123",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  width: 77,
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: H2style(
                                    child: Text(
                                      "معاملة",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 171,
                          height: 160,
                          margin: EdgeInsets.only(top: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              H1style(
                                child: Text(
                                  "جملة التبرعات",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: 11, top: 50),
                                  child: Numberstyle(
                                    child: Text(
                                      "78.123",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  width: 140,
                                  height: 43,
                                  child: H2style(
                                    child: Text(
                                      "جنيه سوداني",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 132,
                      height: 19,
                      margin: EdgeInsets.only(left: 128, top: 84),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Positioned(
                            bottom: -2,
                            child: Text(
                              " 06-04-2020 17:57:28 ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromARGB(255, 245, 111, 118),
                                fontFamily: "DIN Next LT Arabic",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -19,
                            child: Text(
                              "اخر تحديث \nالبيانات تمثل جملة مدخلات حساب القومة للسودان و تحدث كل 60 ثانية",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.accentText,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                height: 1.58333,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 338,
                    height: 61,
                    margin: EdgeInsets.only(bottom: 101),
                    child: Row(
                      children: [
                        Container(
                          width: 108,
                          height: 44,
                          child: MainbtnstyleButton(
                            color: Color.fromARGB(255, 0, 0, 0),
                            padding: EdgeInsets.all(0),
                            onPressed: () => this.onHowToButtonPressed(context),
                            child: Text(
                              "الإحصائيات",
                              textAlign: TextAlign.left,
                              style: TextStyle(),
                            ),
                          ),
                        ),
                        Container(
                          width: 108,
                          height: 44,
                          margin: EdgeInsets.only(left: 121),
                          child: OtherbtnstyleButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () => this.onButtonPressed(context),
                            child: Text(
                              "كيفية التبرع؟",
                              textAlign: TextAlign.left,
                              style: TextStyle(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}