import 'package:flutter/material.dart';

snack(String text, BuildContext context) {
  return ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(
      behavior: SnackBarBehavior.fixed,
      content: Text(text),
    ));
}