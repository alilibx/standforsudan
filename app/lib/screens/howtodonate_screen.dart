import 'package:app/screens/donations_screen.dart';
import 'package:app/styles/colors.dart';
import 'package:app/utils/elements_size.dart';
import 'package:app/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class HowToDonate extends StatelessWidget {
  void onStatsButtonPressed(BuildContext context) => Navigator.pop(
      context, MaterialPageRoute(builder: (context) => DonationsScreen()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Column(
        children: <Widget>[
          HeaderWidget(title: 'كيفية التبرع؟'),
          Expanded(
            child: Container(
              width: ElementsSize().screenWidth(context),
              decoration: BoxDecoration(
                  color: AppColors.accentText,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )),
              child: Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ElementsSize().textSize(context, 18)),
                      child: RichText(
                        textAlign: TextAlign.right,
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "يمكن التبرع لحساب\n",
                              style: TextStyle(
                                  fontSize: ElementsSize().textSize(context, 18),
                                  fontFamily: 'DIN Next LT Arabic',
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryBackground)),
                          TextSpan(
                              text: "القومة للسودان\n",
                              style: TextStyle(
                                fontSize: ElementsSize().textSize(context, 10),
                                fontFamily: 'DIN Next LT Arabic',
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryBackground,
                              )),
                          TextSpan(
                              text: "عبر قنوات الدفع المختلفة\n",
                              style: TextStyle(
                                fontSize: ElementsSize().textSize(context, 18),
                                fontFamily: 'DIN Next LT Arabic',
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryBackground,
                              ))
                        ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ElementsSize().textSize(context, 18),
                          vertical: ElementsSize().textSize(context, 18)),
                      child: RichText(
                        textAlign: TextAlign.right,
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text:
                                  "تطبيقات الدفع الالكتروني •\nتطبيقات البنوك •\nنوافذ البنوك •\nنقاط البيع •\nشركات الاتصالات •\n خدمات الرسائل (سودابان) •\nالصرافات الآلية •\n نظام الدفع عبر الموبايل •",
                              style: TextStyle(
                                  fontSize: ElementsSize().textSize(context, 20),
                                  fontFamily: 'DIN Next LT Arabic',
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryText)),
                        ]),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ElementsSize().textSize(context, 18),
                              vertical: ElementsSize().textSize(context, 10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  onStatsButtonPressed(context);
                                },
                                child: Container(
                                  height: 50.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                      color: AppColors.accentText,
                                      border: Border.all(
                                          color: AppColors.primaryText,
                                          width: 3.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0))),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      'الإحصائيات',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:
                                            ElementsSize().textSize(context, 22),
                                        fontFamily: 'DIN Next LT Arabic',
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryText,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryBackground,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(30.0))),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'كيفية التبرع؟',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: ElementsSize().textSize(context, 22),
                                      fontFamily: 'DIN Next LT Arabic',
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.accentText,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
