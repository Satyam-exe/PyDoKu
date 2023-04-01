import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showNormalBoolDialog(BuildContext context, String text, String trueOption, String falseOption) {
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Warning!'),
        content: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(falseOption),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(trueOption),
          )
        ],
      );
    },
  ).then((value) => value ?? false);
}

showNormalDialog(BuildContext context, String text) {
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Invalid!'),
        content: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Okay'),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
