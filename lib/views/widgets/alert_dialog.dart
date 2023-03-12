import 'package:flutter/material.dart';
import 'package:lib_management/services/app_constants.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/services/app_services_impl.dart';

Future<bool> showAlertDialog({required BuildContext context, required title, required content, required action1, required action2}) {
  AppServices imp = AppServiceImp();
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(imp.getSize(context, 20)),
          ),
          elevation: 20,
          title: Text(title),
          content: (content == null) ? null : Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                action1,
                style: TextStyle(
                  color: bgColor,
                  fontSize: imp.getSize(context, 20),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                action2,
                style: TextStyle(
                  color: bgColor,
                  fontSize: imp.getSize(context, 20),
                ),
              ),
            )
          ],
        );
      }).then((value) => value ?? false);
}
