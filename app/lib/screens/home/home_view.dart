import 'package:app/responsive/orientation_layout.dart';
import 'package:app/responsive/screen_type_layout.dart';
import 'package:app/screens/home/home_view_mobile.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: HomeMobilePortrait(),
        landscape: HomeMobileLandscape(),
      ),
      tablet: OrientationLayout(
      //  portrait: HomeTabletPortrait(),
       // landscape: HomeMTabletLandscape(),
      ),
    );
  }
}
