/*
*  shadow_bg.dart
*  Stand For Sudan
*
*  Created by Ali Alhashimi.
*  Copyright © 2018 Penstash. All rights reserved.
    */

import 'package:flutter/material.dart';



class Shadowbg extends StatelessWidget {
  const Shadowbg({
    Key key,
    this.child,
  }) : super(key: key);
  final Widget child;
  
  @override
  Widget build(BuildContext context) => this.child;
}


class ShadowbgButton extends StatelessWidget {
  
  const ShadowbgButton({
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
      child: this.child,
    );
  }
}


class ShadowbgSwitch extends StatelessWidget {
  const ShadowbgSwitch({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.activeColor,
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


class ShadowbgSlider extends StatelessWidget {
  const ShadowbgSlider({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.inactiveColor,
    this.activeColor,
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


class ShadowbgCircularProgressIndicator extends StatelessWidget {
  const ShadowbgCircularProgressIndicator({
    Key key,
    this.color,
  }): super(key: key);
  final Color color;
  
  @override
  Widget build(BuildContext context) {
  
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(this.color),
    );
  }
}


class ShadowbgLinearProgressIndicator extends StatelessWidget {
  const ShadowbgLinearProgressIndicator({
    Key key,
    this.color,
  }): super(key: key);
  final Color color;
  
  @override
  Widget build(BuildContext context) {
  
    return LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(this.color),
    );
  }
}