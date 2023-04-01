import 'package:flutter/material.dart';

class KeyPadCell extends StatelessWidget {
  final int number;
  final List<int> activeNumber;

  const KeyPadCell(this.number, this.activeNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 50,
      child: TextButton(
        onPressed: () {
          final String message = number == 0
              ? 'Use to clear squares'
              : 'Fill all squares with value $number';
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 1),
          ));

          // Setting activeNumber here...
          activeNumber[0] = number;
        },
        child: Text(
          '$number',
        ),
      ),
    );
  }
}