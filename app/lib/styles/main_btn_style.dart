/*
*  main_btn_style.dart
*  Stand For Sudan
*
*  Created by Ali Alhashimi.
*  Copyright © 2018 Penstash. All rights reserved.
    */

import 'package:app/styles/colors.dart';
import 'package:flutter/material.dart';


// Style Gradient
const Gradient _gradient = LinearGradient(
  begin: Alignment(0.5, 0),
  end: Alignment(0.5, 1),
  stops: [
    0,
    0.04128,
    0.16892,
    0.40385,
    0.68232,
    1,
  ],
  colors: [
    Color.fromARGB(255, 91, 244, 156),
    Color.fromARGB(255, 91, 244, 156),
    Color.fromARGB(255, 98, 229, 156),
    Color.fromARGB(255, 104, 219, 156),
    Color.fromARGB(255, 106, 216, 156),
    Color.fromARGB(255, 106, 216, 156),
  ],
);

// Style Corner Radius
const BorderRadiusGeometry _cornerRadius = BorderRadius.all(Radius.circular(20));

// Style Foreground Color
const Color _foregroundColor = AppColors.accentText;

// Style Font
const double _fontSize = 17;
const FontWeight _fontWeight = FontWeight.w500;
const String _fontFamily = "DIN Next LT Arabic";
const FontStyle _fontStyle = null;


class MainbtnstyleDecoration extends BoxDecoration {
  const MainbtnstyleDecoration({
    Color color,
    Gradient gradient = _gradient,
    Border border,
    BorderRadiusGeometry borderRadius = _cornerRadius,
    List<BoxShadow> boxShadow,
  }) : super(
         color: color,
         border: border,
         borderRadius: borderRadius,
         boxShadow: boxShadow,
         gradient: gradient,
       );
  
  MainbtnstyleDecoration.withOverrides({
    Color color,
    Gradient gradient = _gradient,
    double borderWidth,
    Color borderColor,
    BorderRadiusGeometry borderRadius = _cornerRadius,
    Color shadowColor,
    Offset shadowOffset,
    double shadowRadius,
  }) : super(
         color: color,
         borderRadius: borderRadius,
         gradient: gradient,
         border: Border.all(width: borderWidth ?? 0.0, color: borderColor ?? const Color(0xFF000000)),
         boxShadow: [ BoxShadow(color: shadowColor ?? const Color(0x00000000), offset: shadowOffset ?? Offset.zero, blurRadius: shadowRadius ?? 0.0) ]
       );
}


class MainbtnstyleTextStyle extends TextStyle {
  const MainbtnstyleTextStyle({
    Color color = _foregroundColor,
    double fontSize = _fontSize,
    FontWeight fontWeight = _fontWeight,
    String fontFamily = _fontFamily,
    FontStyle fontStyle = _fontStyle,
    double height,
    double letterSpacing,
  }) : super(
         color: color,
         fontSize: fontSize,
         fontWeight: fontWeight,
         fontFamily: fontFamily,
       );
}


class Mainbtnstyle extends StatelessWidget {
  const Mainbtnstyle({
    Key key,
    this.decoration = const MainbtnstyleDecoration(),
    this.child,
  }) : super(key: key);
  final MainbtnstyleDecoration decoration;
  final Widget child;
  
  @override
  Widget build(BuildContext context) {
  
    return DefaultTextStyle(
      style: const MainbtnstyleTextStyle(),
      child: DecoratedBox(
        decoration: this.decoration,
        child: this.child,
      ),
    );
  }
}


class MainbtnstyleButton extends StatelessWidget {
  
  const MainbtnstyleButton({
    Key key,
    this.color,
    this.border = const BorderSide(),
    this.borderRadius = _cornerRadius,
    this.padding,
    @required this.onPressed,
    @required this.child,
  }): super(key: key);
  
  final Color color;
  final BorderSide border;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsets padding;
  final VoidCallback onPressed;
  final Widget child;
  
  @override
  Widget build(BuildContext context) {
  
    return FlatButton(
      color: this.color,
      shape: RoundedRectangleBorder(
        side: this.border,
        borderRadius: this.borderRadius,
      ),
      onPressed: this.onPressed,
      child: DefaultTextStyle(
        style: const MainbtnstyleTextStyle(),
        child: this.child,
      ),
    );
  }
}


class MainbtnstyleSwitch extends StatelessWidget {
  const MainbtnstyleSwitch({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.activeColor = _foregroundColor,
  }): super(key: key);
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  
  @override
  Widget build(BuildContext context) {
  
    return Switch.adaptive(
      value: this.value,
      onChanged: this.onChanged,
      activeColor: this.activeColor,
    );
  }
}


class MainbtnstyleSlider extends StatelessWidget {
  const MainbtnstyleSlider({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.inactiveColor,
    this.activeColor = _foregroundColor,
    this.min,
    this.max,
  }): super(key: key);
  final double value;
  final ValueChanged<double> onChanged;
  final Color inactiveColor;
  final Color activeColor;
  final double min;
  final double max;
  
  @override
  Widget build(BuildContext context) {
  
    return Slider(
      value: this.value,
      onChanged: this.onChanged,
      activeColor: this.activeColor,
    );
  }
}


class MainbtnstyleCircularProgressIndicator extends StatelessWidget {
  const MainbtnstyleCircularProgressIndicator({
    Key key,
    this.color = _foregroundColor,
  }): super(key: key);
  final Color color;
  
  @override
  Widget build(BuildContext context) {
  
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(this.color),
    );
  }
}


class MainbtnstyleLinearProgressIndicator extends StatelessWidget {
  const MainbtnstyleLinearProgressIndicator({
    Key key,
    this.color = _foregroundColor,
  }): super(key: key);
  final Color color;
  
  @override
  Widget build(BuildContext context) {
  
    return LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(this.color),
    );
  }
}