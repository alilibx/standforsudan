/*
*  other_btn_style.dart
*  Stand For Sudan
*
*  Created by Ali Alhashimi.
*  Copyright © 2018 Penstash. All rights reserved.
    */

import 'package:app/styles/colors.dart';
import 'package:flutter/material.dart';


// Style Background Color
const Color _backgroundColor = AppColors.accentText;

// Style Border
const BorderSide _borderSide = BorderSide(
  color: Color.fromARGB(255, 112, 112, 112),
  width: 3,
  style: BorderStyle.solid,
);

// Style Corner Radius
const BorderRadiusGeometry _cornerRadius = BorderRadius.all(Radius.circular(20));

// Style Foreground Color
const Color _foregroundColor = AppColors.primaryBackground;

// Style Font
const double _fontSize = 17;
const FontWeight _fontWeight = FontWeight.w500;
const String _fontFamily = "DIN Next LT Arabic";
const FontStyle _fontStyle = null;


class OtherbtnstyleDecoration extends BoxDecoration {
  const OtherbtnstyleDecoration({
    Color color = _backgroundColor,
    Gradient gradient,
    Border border = const Border.fromBorderSide(_borderSide),
    BorderRadiusGeometry borderRadius = _cornerRadius,
    List<BoxShadow> boxShadow,
  }) : super(
         color: color,
         border: border,
         borderRadius: borderRadius,
         boxShadow: boxShadow,
         gradient: gradient,
       );
  
  OtherbtnstyleDecoration.withOverrides({
    Color color = _backgroundColor,
    Gradient gradient,
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
         border: Border.fromBorderSide(_borderSide.copyWith(width: borderWidth, color: borderColor)),
         boxShadow: [ BoxShadow(color: shadowColor ?? const Color(0x00000000), offset: shadowOffset ?? Offset.zero, blurRadius: shadowRadius ?? 0.0) ]
       );
}


class OtherbtnstyleTextStyle extends TextStyle {
  const OtherbtnstyleTextStyle({
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


class Otherbtnstyle extends StatelessWidget {
  const Otherbtnstyle({
    Key key,
    this.decoration = const OtherbtnstyleDecoration(),
    this.child,
  }) : super(key: key);
  final OtherbtnstyleDecoration decoration;
  final Widget child;
  
  @override
  Widget build(BuildContext context) {
  
    return DefaultTextStyle(
      style: const OtherbtnstyleTextStyle(),
      child: DecoratedBox(
        decoration: this.decoration,
        child: this.child,
      ),
    );
  }
}


class OtherbtnstyleButton extends StatelessWidget {
  
  const OtherbtnstyleButton({
    Key key,
    this.color = _backgroundColor,
    this.border = _borderSide,
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
        style: const OtherbtnstyleTextStyle(),
        child: this.child,
      ),
    );
  }
}


class OtherbtnstyleSwitch extends StatelessWidget {
  const OtherbtnstyleSwitch({
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


class OtherbtnstyleSlider extends StatelessWidget {
  const OtherbtnstyleSlider({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.inactiveColor = _backgroundColor,
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


class OtherbtnstyleCircularProgressIndicator extends StatelessWidget {
  const OtherbtnstyleCircularProgressIndicator({
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


class OtherbtnstyleLinearProgressIndicator extends StatelessWidget {
  const OtherbtnstyleLinearProgressIndicator({
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