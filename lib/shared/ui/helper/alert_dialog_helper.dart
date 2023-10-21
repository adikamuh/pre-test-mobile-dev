import 'package:flutter/material.dart';

class AlertDialogHelper {
  static void show(
    BuildContext context, {
    required Function() onContinue,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Continue"),
              onPressed: () {
                Navigator.of(context).pop();
                onContinue.call();
              },
            ),
          ],
        );
      },
    );
  }
}
