import 'package:flutter/material.dart';
import 'package:timeline_manager/src/core/extensions/build_context_extension.dart';

class DialogService {
  static Future<bool?> customDialog({
    required BuildContext context,
    required String title,
    required AlignmentGeometry dialogPosition,
    List<Widget>? actions,
    Widget? content,
  }) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: content,
            ),
            insetPadding: const EdgeInsets.all(15),
            alignment: dialogPosition,
            title: Text(
              title,
              textAlign: TextAlign.center,
              style: context.appTextTheme.titleMedium,
            ),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actions: actions,
          );
        });
  }

  static Future<bool?> loadingDialog({
    required BuildContext context,
    required AlignmentGeometry dialogPosition,
    required Widget content,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                child: content,
              ),
            ],
          ),
          insetPadding: const EdgeInsets.all(15),
          alignment: dialogPosition,
        );
      },
    );
  }
}
