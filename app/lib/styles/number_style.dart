/*
*  number_style.dart
*  Stand For Sudan
*
*  Created by Ali Alhashimi.
*  Copyright © 2018 Penstash. All rights reserved.
    */

import 'package:app/styles/colors.dart';
import 'package:flutter/material.dart';


// Style Foreground Color
const Color _foregroundColor = AppColors.secondaryText;

// Style Font
const double _fontSize = 46;
const FontWeight _fontWeight = FontWeight.w700;
const String _fontFamily = "Gotham";
const FontStyle _fontStyle = null;


class NumberstyleDecoration extends BoxDecoration {
  const NumberstyleDecoration({
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
  
  NumberstyleDecoration.withOverrides({
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


class NumberstyleTextStyle extends TextStyle {
  const NumberstyleTextStyle({
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


class Numberstyle extends StatelessWidget {
  const Numberstyle({
    Key key,
    this.decoration = const NumberstyleDecoration(),
    this.child,
  }) : super(key: key);
  final NumberstyleDecoration decoration;
  final Widget child;
  
  @override
  Widget build(BuildContext context) {
  
    return DefaultTextStyle(
      style: const NumberstyleTextStyle(),
      child: DecoratedBox(
        decoration: this.decoration,
        child: this.child,
      ),
    );
  }
}


class NumberstyleButton extends StatelessWidget {
  
  const NumberstyleButton({
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
        style: const NumberstyleTextStyle(),
        child: this.child,
      ),
    );
  }
}


class NumberstyleSwitch extends StatelessWidget {
  const NumberstyleSwitch({
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


class NumberstyleSlider extends StatelessWidget {
  const NumberstyleSlider({
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


class NumberstyleCircularProgressIndicator extends StatelessWidget {
  const NumberstyleCircularProgressIndicator({
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


class NumberstyleLinearProgressIndicator extends StatelessWidget {
  const NumberstyleLinearProgressIndicator({
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