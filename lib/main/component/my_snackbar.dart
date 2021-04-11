import 'package:flutter/material.dart';

Widget showSnackbar(BuildContext context, String title) {
  print("show snack bar");
  final snackbar = SnackBar(
      content: Text(title),
      action: SnackBarAction(
        label: 'Thoát',
        onPressed: () {
          // Some code to undo the change.
        },
      ));
  Scaffold.of(context).showSnackBar(snackbar);
}
