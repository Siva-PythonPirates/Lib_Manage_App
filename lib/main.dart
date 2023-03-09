import 'package:flutter/material.dart';
import 'package:lib_management/view_model/app_provider.dart';
import 'package:lib_management/views/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    Changes(
      child: const MaterialApp(
        home: Login(),
        debugShowCheckedModeBanner: false,
        title: 'REC Library',
      ),
    ),
  );
}
