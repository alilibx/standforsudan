/*
*  how_to_page_widget.dart
*  Stand For Sudan
*
*  Created by Ali Alhashimi.
*  Copyright © 2018 Penstash. All rights reserved.
    */

import 'package:app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/main_btn_style.dart';
import 'package:app/styles/other_btn_style.dart';


class HowToPageWidget extends StatelessWidget {
  
  //void onStatsButtonPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageStatsWidget()));
  
  void onHowToButtonPressed(BuildContext context) {
  
  }
  
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
              height: 772,
              margin: EdgeInsets.only(top: 116),
              decoration: BoxDecoration(
                color: AppColors.accentText,
                borderRadius: BorderRadius.all(Radius.circular(45)),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 215,
                      height: 470,
                      margin: EdgeInsets.only(top: 53, right: 36),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 66),
                            child: Text(
                              "يمكن التبرع لحساب",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: AppColors.accentText,
                                fontWeight: FontWeight.w400,
                                fontSize: 26,
                                height: 1.65385,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 24, top: 9),
                            child: Text(
                              "القومة للسودان",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: AppColors.accentText,
                                fontWeight: FontWeight.w400,
                                fontSize: 26,
                                height: 1.65385,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 13),
                            child: Text(
                              "عبر قنوات الدفع المختلفة",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: AppColors.accentText,
                                fontWeight: FontWeight.w400,
                                fontSize: 26,
                                height: 1.65385,
                              ),
                            ),
                          ),
                          Container(
                            height: 314,
                            margin: EdgeInsets.only(top: 38, right: 2),
                            child: Text(
                              "• تطبيقات الدفع الالكتروني\n• تطبيقات البنوك\n• نوافذ البنوك\n• نقاط البيع\n• شركات الاتصالات\n• خدمات الرسائل (سودابان)\n• الصرافات الآلية\n• نظام الدفع عبر الموبايل",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontWeight: FontWeight.w400,
                                fontSize: 19,
                                height: 1.94737,
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
                    margin: EdgeInsets.only(bottom: 104),
                    child: Row(
                      children: [
                        Container(
                          width: 108,
                          height: 44,
                          child: OtherbtnstyleButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {},
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
                          child: MainbtnstyleButton(
                            color: Color.fromARGB(255, 0, 0, 0),
                            padding: EdgeInsets.all(0),
                            onPressed: () => this.onHowToButtonPressed(context),
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