import 'package:app/responsive/responsive_builder.dart';
import 'package:flutter/material.dart';

class OrientationLayout extends StatelessWidget {
  final Widget landscape;
  final Widget portrait;

  const OrientationLayout({Key key, this.portrait, this.landscape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.orientation == Orientation.landscape) {
          return landscape ?? portrait;
        }

        return portrait;
      },
    );
  }
}
