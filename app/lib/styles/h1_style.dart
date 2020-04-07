/*
*  h1_style.dart
*  Stand For Sudan
*
*  Created by Ali Alhashimi.
*  Copyright © 2018 Penstash. All rights reserved.
    */

import 'package:app/styles/colors.dart';
import 'package:flutter/material.dart';


// Style Foreground Color
const Color _foregroundColor = AppColors.primaryText;

// Style Font
const double _fontSize = 34;
const FontWeight _fontWeight = FontWeight.w500;
const String _fontFamily = "DIN Next LT Arabic";
const FontStyle _fontStyle = null;


class H1styleDecoration extends BoxDecoration {
  const H1styleDecoration({
    Color color,
    Gradient gradient,
    Border border,
    BorderRadiusGeometry borderRadius,
    List<BoxShadow> boxShadow,
  }) : super(
         color: color,
         border: border,
         borderRadius: borderRadius,
         boxShadow: boxShadow,
         gradient: gradient,
       );
  
  H1styleDecoration.withOverrides({
    Color color,
    Gradient gradient,
    double borderWidth,
    Color borderColor,
    BorderRadiusGeometry borderRadius,
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


class H1styleTextStyle extends TextStyle {
  const H1styleTextStyle({
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


class H1style extends StatelessWidget {
  const H1style({
    Key key,
    this.decoration = const H1styleDecoration(),
    this.child,
  }) : super(key: key);
  final H1styleDecoration decoration;
  final Widget child;
  
  @override
  Widget build(BuildContext context) {
  
    return DefaultTextStyle(
      style: const H1styleTextStyle(),
      child: DecoratedBox(
        decoration: this.decoration,
        child: this.child,
      ),
    );
  }
}


class H1styleButton extends StatelessWidget {
  
  const H1styleButton({
    Key key,
    this.color,
    this.border = const BorderSide(),
    this.borderRadius = const BorderRadius.all(Radius.circular(0)),
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
        style: const H1styleTextStyle(),
        child: this.child,
      ),
    );
  }
}


class H1styleSwitch extends StatelessWidget {
  const H1styleSwitch({
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


class H1styleSlider extends StatelessWidget {
  const H1styleSlider({
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


class H1styleCircularProgressIndicator extends StatelessWidget {
  const H1styleCircularProgressIndicator({
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


class H1styleLinearProgressIndicator extends StatelessWidget {
  const H1styleLinearProgressIndicator({
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