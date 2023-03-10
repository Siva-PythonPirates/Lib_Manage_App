import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/services/app_services_impl.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  AppServices imp = AppServiceImp();
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(imp.getSize(context, 20)),
          ),
          elevation: 20,
          title: const Text('Log out'),
          content: const Text("Do you want to Log out ?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                'Yes',
                style: TextStyle(
                  fontSize: imp.getSize(context, 20),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                "No",
                style: TextStyle(
                  fontSize: imp.getSize(context, 20),
                ),
              ),
            )
          ],
        );
      }).then((value) => value ?? false);
}
