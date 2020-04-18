import 'package:app/responsive/sizing_information.dart';
import 'package:app/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class ResponiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, SizingInformation) builder;

  const ResponiveBuilder({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstrain) {
      var mediaQuery = MediaQuery.of(context);
      var sizingInformation = SizingInformation(
          orientation: mediaQuery.orientation,
          deviceScreenType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(boxConstrain.maxWidth, boxConstrain.maxHeight));
      return builder(context, sizingInformation);
    });
  }
}
