import 'package:flutter/material.dart';

class Shared {
  void showToast(BuildContext context, String _message) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(_message),
    ));
  }
}
